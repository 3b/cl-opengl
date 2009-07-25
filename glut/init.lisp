;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; init.lisp --- GLUT Initialization API.
;;;
;;; Copyright (c) 2006, Luis Oliveira <loliveira@common-lisp.net>
;;;   All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;  o Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;  o Neither the name of the author nor the names of the contributors may
;;;    be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;; A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package #:cl-glut)

(defcfun ("glutInit" %glutInit) :void
  (argcp :pointer)  ; int*
  (argv  :pointer)) ; char**

(defmacro without-fp-traps (&body body)
  #+(and sbcl (or x86 x86-64))
  `(sb-int:with-float-traps-masked (:invalid :divide-by-zero)
     ,@body)
  #-(and sbcl (or x86 x86-64))
  `(progn ,@body))

(defparameter *glut-initialized-p* nil)

#+(and darwin (or openmcl-native-threads sb-thread))
(defparameter *glut-thread* nil)

(defun make-thread (name function)
  #+openmcl-native-threads (ccl:process-run-function name function)
  #+sb-thread (sb-thread:make-thread function :name name)
  #-(or openmcl-native-threads sb-thread)
  (error "CL-GLUT::MAKE-THREAD not implemented for this Lisp."))

(defun %init (program-name)
  (with-foreign-objects ((argcp :int) (argv :pointer))
    (setf (mem-ref argcp :int) 1)
    (with-foreign-string (str program-name)
      (setf (mem-ref argv :pointer) str)
      (%glutInit argcp argv)
      (setf *glut-initialized-p* t)))
  ;; By default, we choose the saner option to return from the event
  ;; loop on window close instead of exit()ing.
  (set-action-on-window-close :action-continue-execution)
  ;; this probably doesn't play well with other toolkits
  (setq %gl:*gl-get-proc-address* 'get-proc-address)
  (values))

;;; From CCL's opengl-ffi:
;;;
;;; "On OSX, we need to use an undocumented API or two to ensure that
;;; the thread we're creating is seen as the 'main' event handling
;;; thread (that's what the code that sets the current thread's
;;; CFRunLoop to the main CFRunLoop does.)"

#+(and darwin (or sb-thread openmcl-native-threads))
(progn
  (defcfun ("CFRunLoopGetCurrent" cf-run-loop-get-current) :pointer)
  (defcfun ("_CFRunLoopSetCurrent" cf-run-loop-set-current)
      :pointer (arg :pointer))
  (defcfun ("CFRunLoopGetMain" cf-run-loop-get-main) :pointer))

(defun init (&optional (program-name (lisp-implementation-type)))
  (without-fp-traps
   ;; freeglut will exit() if we try to call initGlut() when
   ;; things are already initialized.
   (unless *glut-initialized-p*
     #+(and darwin (or sb-thread openmcl-native-threads))
     (setf *glut-thread*
           (make-thread
            "CL-GLUT thread"
            (lambda ()
              ;; In OSX, a "run loop" is a data structure that
              ;; describes how event-handling code should block for
              ;; events, timers, and other event sources.  Ensure that
              ;; this thread has a "current run loop".  (Under some
              ;; circumstances, there may not yet be a "main" run
              ;; loop; setting the "current" ensures that a main loop
              ;; exists.)
              (cf-run-loop-get-current)
              ;; Make the current thread's run loop be the "main" one;
              ;; only the main run loop can interact with the window
              ;; server.
              (cf-run-loop-set-current (cf-run-loop-get-main))
              (%init program-name)
              (loop (sleep 1)))))
     #-(and darwin (or sb-thread openmcl-native-threads))
     (%init program-name)))
  (values))

;; We call init at load-time in order to ensure a usable glut as often
;; as possible. Also, we call init when the main event loop returns in
;; main.lisp and some other places. We do this to avoid having
;; freeglut call exit() when performing some operation that needs
;; previous initialization.
(init)

;;; The display-mode bitfield is defined in state.lisp
(defcfun ("glutInitDisplayMode" %glutInitDisplayMode) :void
  (mode display-mode))

;;; freeglut_ext.h says: "Only one GLUT_AUXn bit may be used at a time."
(defun init-display-mode (&rest options)
  (declare (dynamic-extent options))
  (%glutInitDisplayMode options))

;;; useless?
(defcfun ("glutInitDisplayString" init-display-string) :void
  (display-mode :string))

(defcfun ("glutInitWindowPosition" init-window-position) :void
  (x :int)
  (y :int))

(defcfun ("glutInitWindowSize" init-window-size) :void
  (width  :int)
  (height :int))
