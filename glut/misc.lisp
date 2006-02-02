;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; misc.lisp --- Misc functions from the GLUT API.
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

;;; Color API

(defcfun ("glutSetColor" %glutSetColor) :void
  (ndx   :int)
  (red   gl:float)
  (green gl:float)
  (blue  gl:float))

(declaim (inline set-color))
(defun set-color (cell red green blue)
  (%glutSetColor cell (float red) (float green) (float blue)))

(defcfun ("glutGetColor" get-color) gl:float
  (color :int)
  (component color-component))

(defcfun ("glutCopyColormap" copy-colormap) :void
  (window-id :int))

;;; Misc keyboard and joystick functions.

(defcfun ("glutIgnoreKeyRepeat" ignore-key-repeat) :void
  (ignore :int))

(defcenum key-repeat-mode
  :key-repeat-off
  :key-repeat-on
  :key-repeat-default)

(defcfun ("glutSetKeyRepeat" set-key-repeat) :void
  (repeat-mode key-repeat-mode))

(defcfun ("glutForceJoystickFunc" force-joystick-func) :void)
(defcfun ("glutReportErrors" report-errors) :void)

;;; Game Mode API

(defcfun ("glutGameModeString" game-mode-string) :void
  (string :string))

(defcfun ("glutEnterGameMode" enter-game-mode) :void)
(defcfun ("glutLeaveGameMode" leave-game-mode) :void)

(defcfun ("glutGameModeGet" game-mode-get) :int
  (query game-mode-param))

(defcfun ("glutGameModeGet" game-mode-getp) :boolean
  (query game-mode-param))

;;; Video API

;;; freeglut doesn't implement any of these

(defcfun ("glutVideoResizeGet" video-resize-get) :int
  (query video-resize-param))

(defcfun ("glutVideoResizeGet" video-resize-getp) :boolean
  (query video-resize-param))

(defcfun ("glutSetupVideoResizing" setup-video-resizing) :void)
(defcfun ("glutStopVideoResizing" stop-video-resizing) :void)

(defcfun ("glutVideoResize" video-resize) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(defcfun ("glutVideoPan" video-pan) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int))