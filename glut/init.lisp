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
  `(float-features:with-float-traps-masked t
     ,@body)
  #-(and sbcl (or x86 x86-64))
  `(progn ,@body))

(defparameter *glut-initialized-p* nil)

(defun %init (program-name)
  (with-foreign-objects ((argcp :int) (argv :pointer))
    (setf (mem-ref argcp :int) 1)
    (with-foreign-string (str program-name)
      (setf (mem-ref argv :pointer) str)
      (%glutInit argcp argv)
      (init-font-pointers)
      (setf *glut-initialized-p* t)))
  ;; By default, we choose the saner option to return from the event
  ;; loop on window close instead of exit()ing.
  (set-action-on-window-close :action-continue-execution)
  ;; this probably doesn't play well with other toolkits
  (setq %gl:*gl-get-proc-address* 'get-proc-address)
  (values))

(defun init (&optional (program-name (lisp-implementation-type)))
  (without-fp-traps
    ;; freeglut will exit() if we try to call initGlut() when
    ;; things are already initialized.
    #-darwin
    (unless (getp :init-state)
      (%init program-name))
    #+darwin
    (unless *glut-initialized-p*
      (%init program-name)))
  (values))

;; We call init at load-time in order to ensure a usable glut as often
;; as possible. Also, we call init when the main event loop returns in
;; main.lisp and some other places. We do this to avoid having
;; freeglut call exit() when performing some operation that needs
;; previous initialization.
;; -- this is causing problems in other situations (loading without X
;;    available for example, possibly also making the OSX threading stuff
;;    worse), so disabling for now.
;; (init)

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
