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
;;;
;;; FIXME: LISP-FUNCTION-NAME should probably be exported from CFFI
;;; for helper macros like this one.
(defmacro defglfun (name result-type &body body)
  (let ((lisp-name (second name)))
    `(progn
       (declaim (inline ,lisp-name))
       (defcfun ,name ,result-type ,@body))))

;;; Helpers for wrapping dynamically loaded extension function pointers
;;;
;;; TODO: need to handle multiple contexts.
;;;
;;; TODO: probably should have the option of using directly exported
;;; functions on platforms that have them, but that would need to deal
;;; with the possibility of a core being loaded on a system with different
;;; functions exported than the one on which the core was saved.

(defparameter *gl-extension-resetter-list* nil)
(defun %reset-gl-extension-pointers ()
  (format t " resetting extension pointers ...") (finish-output)
  ;; fixme?: race here, but intended to be called while saving an
  ;; image, so if someone is still calling GL functions we lose
  ;; anyway...
  (mapc #'funcall *gl-extension-resetter-list*)
  (setf *gl-extension-resetter-list* nil))

(eval-when (:load-toplevel :execute)
  #+clisp (pushnew #'%reset-gl-extension-pointers custom:*fini-hooks*)
  #+sbcl (pushnew #'%reset-gl-extension-pointers sb-ext:*save-hooks*)
  #+cmu (pushnew #'%reset-gl-extension-pointers
                 ext:*before-save-initializations*)
  #-(or clisp sbcl cmu)
  (warn "Don't know how to setup a hook before saving cores on this Lisp."))

(defparameter *gl-get-proc-address* nil
 "set this to a function which knows how to get a GL extension
 pointer from the OS (glutGetProcAddress, SDL_GL_GetProcAddress,
 wglGetProcAddress, etc.)")

(defun %gl-get-proc-address (name)
  "override this with something useful..."
  (if (and *gl-get-proc-address* (functionp *gl-get-proc-address*))
      (funcall *gl-get-proc-address* name)
      (error "no glGetProcAddress specified!")))

(defmacro defglextfun ((cname lname &rest fargs) return-type &body args)
  (let ((pointer (gensym "GLEXT-FUN-POINTER")))
    `(let ((,pointer (cffi:null-pointer)))
       (defun ,lname ,(mapcar #'car args)
         (when (cffi:null-pointer-p ,pointer)
           (setf ,pointer (%gl-get-proc-address ,cname))
           (assert (not (cffi:null-pointer-p ,pointer))
                   () "couldn't load symbol ~a ~%" ,cname)
           (format t "loaded function pointer for ~a : ~a ~%"
                   ,cname ,pointer)
           (push (lambda ()
                   (setf ,pointer (cffi:null-pointer)))
                 *gl-extension-resetter-list*))
         (foreign-funcall-pointer
          ,pointer
          ,fargs
          ,@(loop for arg in args collect (second arg) collect (first arg))
          ,return-type)))))
