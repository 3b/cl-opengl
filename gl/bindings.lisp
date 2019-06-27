;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; Copyright (c) 2004, Oliver Markovic <entrox@entrox.org>
;;;   All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;;  o Redistributions of source code must retain the above copyright notice,
;;;    this list of conditions and the following disclaimer.
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;  o Neither the name of the author nor the names of the contributors may be
;;;    used to endorse or promote products derived from this software without
;;;    specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(in-package #:cl-opengl-bindings)

;;; in case we want to be able to tell whether we are using a cl-opengl with
;;; automatic error checking, push something on *features*
#-cl-opengl-no-check-error(pushnew :cl-opengl-checks-errors *features*)

(define-condition opengl-error (simple-error)
  ((error-code :initarg :error-code :reader opengl-error.error-code)
   (error-context :initform nil :initarg :error-context :reader opengl-error.error-context))
  (:report (lambda (c s)
             (if (opengl-error.error-context c)
                 (format s "OpenGL signalled ~A from ~A."
                         (opengl-error.error-code c)
                         (opengl-error.error-context c))
                  (format s "OpenGL signalled ~A."
                          (opengl-error.error-code c))))))

(defmacro with-float-traps-maybe-masked (() &body body)
  `(#-cl-opengl-no-masked-traps float-features:with-float-traps-masked
    #-cl-opengl-no-masked-traps t
    #+cl-opengl-no-masked-traps progn
    ,@body))

(defparameter *in-begin* nil)
;; inlining lots of restart-case kills compilation times on SBCL, and doesn't
;; seem to help performance much
;; (declaim (inline check-error))
(defun check-error (&optional context)
  (declare (optimize speed))
  (unless *in-begin*
    (let ((error-code (foreign-funcall ("glGetError" :library opengl)
                                       :unsigned-int)))
      (unless (zerop error-code)
        (restart-case
            (error 'opengl-error
                   :error-code (cons error-code
                                     (cffi:foreign-enum-keyword '%gl:enum error-code))
                   :error-context context)
          (continue () :report "Continue"))))))

;;; Helper macro to define a GL API function and declare it inline.
(defmacro defglfun ((cname lname) result-type &body body)
  `(progn
     (declaim (inline ,lname))
     #-cl-opengl-no-check-error
     (defun ,lname ,(mapcar #'first body)
       (multiple-value-prog1
           (with-float-traps-maybe-masked ()
            (foreign-funcall (,cname :library opengl)
                             ,@(loop for i in body
                                     collect (second i)
                                     collect (first i))
                             ,result-type))
         ,@(cond
             ((string= cname "glGetError") ())
             ((string= cname "glBegin")
              `((setf *in-begin* t)))
             ((string= cname "glEnd")
              `((setf *in-begin* nil)
                (check-error ',lname)))
             (t
              `((check-error ',lname))))))
     #+cl-opengl-no-check-error
     (defun ,lname ,(mapcar #'first body)
       (with-float-traps-maybe-masked ()
        (foreign-funcall (,cname :library opengl)
                         ,@(loop for i in body
                                 collect (second i)
                                 collect (first i))
                         ,result-type)))
     #++(defcfun (,cname ,lname :library opengl) ,result-type ,@body)))

;;;; Extensions

;;; TODO: need to handle multiple contexts.
;;;
;;; TODO: probably should have the option of using directly exported
;;;       functions on platforms that have them, but that would need
;;;       to deal with the possibility of a core being loaded on a
;;;       system with different functions exported than the one on
;;;       which the core was saved.

;;; Set this to a function which knows how to get a GL extension
;;; pointer from the OS: glutGetProcAddress(), SDL_GL_GetProcAddress(),
;;; wglGetProcAddress(), etc.
(defparameter *gl-get-proc-address* nil)

;;; Fallback get-proc-address bindings which should work for common
;;; configurations
;;; TODO: Darwin
#+(or linux freebsd)
(defcfun ("glXGetProcAddress" glx-get-proc-address) :pointer
  (proc-name :string))
#+windows
(defcfun ("wglGetProcAddress" wgl-get-proc-address) :pointer
  (proc-name :string))

(defun gl-get-proc-address (name)
  (funcall (or *gl-get-proc-address*
               #+(or linux freebsd) #'glx-get-proc-address
               #+windows #'wgl-get-proc-address
               #'cffi:foreign-symbol-pointer)
           name))

(eval-when (:load-toplevel :execute)
  #+clisp (pushnew 'reset-gl-pointers custom:*fini-hooks*)
  #+sbcl (pushnew 'reset-gl-pointers sb-ext:*save-hooks*)
  #+cmu (pushnew 'reset-gl-pointers ext:*before-save-initializations*)
  ;; ECL does not need this since it does not save images
  #-(or clisp sbcl cmu ecl)
  (warn "Don't know how to setup a hook before saving cores on this Lisp."))

;;;; Bart's version of DEFGLEXTFUN.

#-(and)
(defparameter *gl-extension-resetter-list* nil)

;;; FIXME? There's a possible race condition here, but this function
;;; is intended to be called while saving an image, so if someone is
;;; still calling GL functions we lose anyway...
#-(and)
(defun reset-gl-pointers ()
  (format t "~&;; resetting extension pointers...~%")
  (mapc #'funcall *gl-extension-resetter-list*)
  (setf *gl-extension-resetter-list* nil))

#-(and)
(defmacro defglextfun ((cname lname) return-type &body args)
  (with-unique-names (pointer)
    `(let ((,pointer (null-pointer)))
       (defun ,lname ,(mapcar #'car args)
         (when (null-pointer-p ,pointer)
           (setf ,pointer (%gl-get-proc-address ,cname))
           (assert (not (null-pointer-p ,pointer)) ()
                   "Couldn't load symbol ~A~%" ,cname)
           (format t "Loaded function pointer for ~A: ~A~%" ,cname ,pointer)
           (push (lambda () (setf ,pointer (null-pointer)))
                 *gl-extension-resetter-list*))
         (foreign-funcall-pointer
          ,pointer
          (:library opengl)
          ,@(loop for arg in args collect (second arg) collect (first arg))
          ,return-type)))))

;;;; Thomas's version of DEFGLEXTFUN.

(defun reset-gl-pointers ()
  (do-external-symbols (sym (find-package '#:%gl))
    (let ((dummy (get sym 'proc-address-dummy)))
      (when dummy
        (setf (fdefinition sym) dummy)))))

(defun generate-gl-function (foreign-name lisp-name result-type body &rest args)
  (let ((address (gl-get-proc-address foreign-name))
        (arg-list (mapcar #'first body)))
    (when (or (not (pointerp address)) (null-pointer-p address))
      (error "Couldn't find function ~A" foreign-name))
    (compile lisp-name
             `(lambda ,arg-list
                (multiple-value-prog1
                    (with-float-traps-maybe-masked ()
                      (foreign-funcall-pointer
                       ,address
                       (:library opengl)
                       ,@(loop for i in body
                               collect (second i)
                               collect (first i))
                       ,result-type))
                  #-cl-opengl-no-check-error
                  (check-error ',lisp-name))))
    (apply lisp-name args)))

(defmacro defglextfun ((foreign-name lisp-name) result-type &rest body)
  (let ((args-list (mapcar #'first body)))
    `(progn
       (declaim (notinline ,lisp-name))
       (defun ,lisp-name ,args-list
         (generate-gl-function ,foreign-name  ',lisp-name ',result-type
                               ',body ,@args-list))
       (setf (get ',lisp-name 'proc-address-dummy) #',lisp-name)
       ',lisp-name)))
