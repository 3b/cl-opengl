;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; window.lisp --- GLUT window management API.
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

;;; TODO: make sure if it's safe to free the window title
;;; right after calling glutCreateWindow().
(defcfun ("glutCreateWindow" create-window) :int
  (title :string))

(defcfun ("glutCreateSubWindow" create-sub-window) :int
  (window-id :int)
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(defcfun ("glutDestroyWindow" destroy-window) :void
  (window-id :int))

(defcfun ("glutSetWindow" set-window) :void
  (window-id :int))

(defcfun ("glutGetWindow" get-window) :int)

;;; Do we need to be paranoid here too? See create-window.
(defcfun ("glutSetWindowTitle" set-window-title) :void
  (string :string))

(defcfun ("glutSetIconTitle" set-icon-title) :void
  (string :string))

(defcfun ("glutReshapeWindow" reshape-window) :void
  (width :int)
  (height :int))

(defcfun ("glutPositionWindow" position-window) :void
  (x :int)
  (y :int))

(defcfun ("glutShowWindow" show-window) :void)
(defcfun ("glutHideWindow" hide-window) :void)
(defcfun ("glutIconifyWindow" iconify-window) :void)
(defcfun ("glutPushWindow" push-window) :void)
(defcfun ("glutPopWindow" pop-window) :void)
(defcfun ("glutFullScreen" full-screen) :void)

(defcfun ("glutPostWindowRedisplay" post-window-redisplay) :void
  (window-id :int))

(defcfun ("glutPostRedisplay" post-redisplay) :void)
(defcfun ("glutSwapBuffers" swap-buffers) :void)

;; freeglut ext?
(defcfun ("glutWarpPointer" warp-pointer) :void
  (x :int)
  (y :int))

(defcenum cursor
  :cursor-right-arrow
  :cursor-left-arrow
  :cursor-info
  :cursor-destroy
  :cursor-help
  :cursor-cycle
  :cursor-spray
  :cursor-wait
  :cursor-text
  :cursor-crosshair
  :cursor-up-down
  :cursor-left-right
  :cursor-top-side
  :cursor-bottom-side
  :cursor-left-side
  :cursor-right-side
  :cursor-top-left-corner
  :cursor-top-right-corner
  :cursor-bottom-right-corner
  :cursor-bottom-left-corner
  (:cursor-inherit #x0064)
  :cursor-none
  :cursor-full-crosshair)

(defcfun ("glutSetCursor" set-cursor) :void
  (cursor cursor))