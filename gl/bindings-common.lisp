(in-package #:cl-opengl-bindings)

;;; in case we want to be able to tell whether we are using a cl-opengl with
;;; automatic error checking, push something on *features*
#-cl-opengl-no-check-error(pushnew :cl-opengl-checks-errors *features*)

(define-condition cl-opengl-condition (condition)
  ())

(define-condition function-not-found (error cl-opengl-condition)
  ((function :initarg :function :reader function-not-found.function))
  (:report (lambda (c s)
             (format s "Couldn't find function ~A"
                     (function-not-found.function c)))))

(define-condition opengl-error (simple-error cl-opengl-condition)
  ((error-code :initarg :error-code :reader opengl-error.error-code)
   (error-context :initform nil :initarg :error-context :reader opengl-error.error-context))
  (:report (lambda (c s)
             (if (opengl-error.error-context c)
                 (format s "OpenGL signalled ~A from ~A."
                         (opengl-error.error-code c)
                         (opengl-error.error-context c))
                 (format s "OpenGL signalled ~A."
                         (opengl-error.error-code c))))))

(defvar *traps-already-masked* nil)

(defmacro with-float-traps-masked (() &body body)
  "Mask floating point traps in dynamic scope of BODY, and disable
automatic per-call masking within that scope."
  `(let ((*traps-already-masked* t))
     (float-features:with-float-traps-masked t
       ,@body)))

(defmacro with-float-traps-maybe-masked (() &body body)
  #+cl-opengl-no-masked-traps
  `(progn ,@body)
  #-cl-opengl-no-masked-traps
  `(if *traps-already-masked*
       (progn
         ,@body)
       (float-features:with-float-traps-masked t
         ,@body)))

(defparameter *in-begin* nil)
;; inlining lots of restart-case kills compilation times on SBCL, and
;; doesn't seem to help performance much. Inlining just the *in-begin*
;; check seems to be 10-20% faster when not checking errors, so just
;; inlining that.
(declaim (inline check-error))

(defun check-error (&optional context)
  (declare (optimize speed))
  (unless *in-begin*
    (%check-error context)))

(defun %check-error (&optional context)
  (declare (optimize speed))
  (let ((error-code (foreign-funcall ("glGetError" :library opengl)
                                     :unsigned-int)))
    (unless (zerop error-code)
      (restart-case
          (error 'opengl-error
                 :error-code (cons error-code
                                   (cffi:foreign-enum-keyword '%gl:enum error-code
                                                              :errorp nil))
                 :error-context context)
        (continue () :report "Continue")))))

;; allow deferring automatic error check within a block of code.
(defmacro with-deferred-errors ((name &key force) &body body)
  "Defer automatic glGetError check until end of dynamic scope of BODY,
reporting NAME (not evaluated) as the source of any errors detected.
Nested calls will defer check until end of outermost scope. If
FORCE (evaluated) is not NIL, automatic error checks will be forced on
instead to allow easier localization of errors when debugging instead
of removing the form completely.

Note that BEGIN/END/WITH-PRIMITIVES already defer checks because
glGetError is not allowed within a glBegin/glEnd pair, so this should
not be used in those contexts."
  `(multiple-value-prog1
       (let ((*in-begin* (not ,force)))
         ,@body)
     (check-error ',name)))


(defparameter +compiler-macro-types+ '(enum boolean))

