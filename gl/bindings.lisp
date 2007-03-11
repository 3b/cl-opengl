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

;;; Helper macro to define a GL API function and declare it inline.
(defmacro defglfun ((cname lname) result-type &body body)
  `(progn
     (declaim (inline ,lname))
     (defcfun (,cname ,lname :library opengl) ,result-type ,@body)))

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

(defun gl-get-proc-address (name)
  (funcall *gl-get-proc-address* name))

(eval-when (:load-toplevel :execute)
  #+clisp (pushnew 'reset-gl-pointers custom:*fini-hooks*)
  #+sbcl (pushnew 'reset-gl-pointers sb-ext:*save-hooks*)
  #+cmu (pushnew 'reset-gl-pointers ext:*before-save-initializations*)
  #-(or clisp sbcl cmu)
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
                (foreign-funcall-pointer
                 ,address
                 (:library opengl)
                 ,@(loop for i in body
                         collect (second i)
                         collect (first i))
                 ,result-type)))
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
