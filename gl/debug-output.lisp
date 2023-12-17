(in-package #:cl-opengl)

;;; this API isn't final, and not completely sure it even works right,
;;; so probably shouldn't rely on it for anything permanent, but might
;;; help with debugging.

;; in particular needs configurable user-level callbacks (ideally
;; without using defcallback). Also should add wrappers for the
;; GetDebugMessageLog API

;; functions for Debug Output (from gl 4.3+ / KHR_Debug )
(defvar *break-severities* '(:debug-severity-high))
(defvar *synchronous* nil)

(defvar *ignore-ids* #())
#++ (setf *ignore-ids* #(#x20071 #x20043))
#++ (setf *ignore-ids* #(#x20071))

(defcallback debug-output-callback :void
    ;; SOURCE,TYPE,SEVERITY are enums, but translating manually to
    ;; avoid ambiguity
    ((source :unsigned-int)
     (type :unsigned-int)
     (id %gl:uint)
     (severity :unsigned-int)
     (length %gl:sizei)
     (message (:pointer :char))
     (user-param (:pointer :void)))
  (declare (ignorable user-param))
  (unless (position id *ignore-ids*)
    (let ((message
            (format nil "~a:~a:~a:~4,'0x:~a~%"
                    (enum-case source
                               (:debug-source-api "API")
                               (:debug-source-window-system "WIN")
                               (:debug-source-shader-compiler "SHD")
                               (:debug-source-third-party "3RD")
                               (:debug-source-application "APP")
                               (:debug-source-other "???"))
                    (enum-case type
                               (:debug-type-error "ERR")
                               (:debug-type-deprecated-behavior "DEP")
                               (:debug-type-undefined-behavior "U B")
                               (:debug-type-portability "PRT")
                               (:debug-type-performance "PER")
                               (:debug-type-marker "MRK")
                               (:debug-type-push-group "PUS")
                               (:debug-type-pop-group "POP")
                               (:debug-type-other "???"))
                    (enum-case severity
                               (:debug-severity-high "HIG")
                               (:debug-severity-medium "MED")
                               (:debug-severity-low "LOW")
                               (:debug-severity-notification "NOT"))
                    id
                    (cffi:foreign-string-to-lisp message :max-chars length))))
      (format t "~a" message)
      (when (and *synchronous*
                 (loop for s in *break-severities*
                       for i = (if (numberp s)
                                   s (cffi:foreign-enum-value '%gl:enum s))
                         thereis (= severity i)))
        (break message)))))

(defmacro with-synchronous-debug ((&key (break '*break-severities*)) &body body)
  (alexandria:with-gensyms (prev)
    `(let* ((,prev *synchronous*)
            (*break-severities* ,break)
            (*synchronous* t))
       (unwind-protect
            (progn
              (%gl:enable :debug-output-synchronous)
              ,@body)
         ;; match previous state even if user toggled it within this
         ;; scope, to match binding
         (if ,prev
             (%gl:enable :debug-output-synchronous)
             (%gl:disable :debug-output-synchronous))))))

(defmacro with-synchronous-debug* ((&key (break '*break-severities*)) &body body)
  `(let* ((*break-severities* ,break)
          (*synchronous* t))
     ,@body))

(defun debug-output-insert (message &key (source :debug-source-application)
                                      (type :debug-type-other)
                                      (severity :debug-severity-notification)
                                      (id 0))
  (cffi:with-foreign-string ((buf len) message)
    (%gl:debug-message-insert source type id severity len buf)))

(defun init-debug-output (&key (enable t))
  (%gl:debug-message-callback (get-callback 'debug-output-callback)
                              (null-pointer))
  (when enable
    (gl:enable :debug-output)
    (debug-output-insert "debug output enabled"
                         :source :debug-source-third-party
                         :id #x3b)))

(defun object-label (id name label)
  (let ((label (format nil "~a(~a)" label name)))
    (cffi:with-foreign-string ((buf len) label)
      (%gl:object-label id name len buf))))

(defun debug-filter-ids (source type &key enable disable)
  (setf enable (alexandria:ensure-list enable))
  (setf disable (alexandria:ensure-list disable))
  (when enable
    (with-foreign-object (p '%gl:uint (length enable))
      (loop for e in enable for i from 0 do (setf (mem-aref p '%gl:uint i) e))
      (%gl:debug-message-control source type :dont-care
                                 (length enable) p :true)))
  (when disable
    (with-foreign-object (p '%gl:uint (length disable))
      (loop for e in disable for i from 0 do (setf (mem-aref p '%gl:uint i) e))
      #++(format t "disable ~s~% ~s~% ~s~%"
                 disable (list source type :dont-care
                               (length disable) p :false)
                 (loop for i below (length disable)
                       collect (mem-aref p '%gl:uint i)))
      (%gl:debug-message-control source type :dont-care
                                 (length disable) p :false))))
