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

;;; Being paranoid about whether the memory allocated for argc and argv
;;; should be kept around as opposed to free right after calling
;;; %glutInit(). Is this really necessary? --luis

(defparameter *argcp* (null-pointer))
(defparameter *argv* (null-pointer))

(defun init (&optional (program-name (lisp-implementation-type)))
  (unless (getp :init-state)
    ;; freeglut will exit() if we try to call initGlut() when
    ;; things are already initialized.
    (when (not (null-pointer-p *argcp*))
      (foreign-free *argcp*))
    (when (not (null-pointer-p *argv*))
      (foreign-free (mem-aref *argv* :pointer 0))
      (foreign-free *argv*))
    (setq *argcp* (foreign-alloc :int :initial-element 1))
    (setq *argv* (foreign-alloc
                  :pointer
                  :initial-element (foreign-string-alloc program-name)))
    (%glutInit *argcp* *argv*)
    ;; By default, we choose the saner option to return from the event
    ;; loop on window close instead of exit()ing.
    (set-action-on-window-close :action-continue-execution)
    ;; this probably doesn't play well with other toolkits
    (setq %gl:*gl-get-proc-address* 'get-proc-address))
  (values))

;; We call init at load-time in order to ensure a usable glut as
;; often as possible. Also, we call init when the main event loop
;; returns in main.lisp. We do this to avoid having freeglut call
;; exit() when performing some operation that needs previous
;; initialization.
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
