;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; callbacks.lisp --- GLUT Callback Registration API.
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

;;; Low-level functions (exported nevertheless)

(defcfun ("glutTimerFunc" timer-func) :void
  (millis :unsigned-int)
  (callback-pointer :pointer) ; void (*func)(int value)
  (value :int))

(defcfun ("glutIdleFunc" idle-func) :void
   ;; void (*func)(void)
  (callback-pointer :pointer))

(defcfun ("glutKeyboardFunc" keyboard-func) :void
  ;; void (*func)(unsigned char int, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutSpecialFunc" special-func) :void
  ;; void (*func)(int key, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutReshapeFunc" reshape-func) :void
  ;; void (*func)(int width, int height)
  (callback-pointer :pointer))

(defcfun ("glutVisibilityFunc" visibility-func) :void
   ;; void (*func)(int state)
  (callback-pointer :pointer))

(defcfun ("glutDisplayFunc" display-func) :void
  ;; void (*func)(void)
  (callback-pointer :pointer))

(defcfun ("glutMouseFunc" mouse-func) :void
  ;; void (*func)(int button, int state, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutMotionFunc" motion-func) :void
  ;; void (*func)(int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutPassiveMotionFunc" passive-motion-func) :void
  ;; void (*func)(int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutEntryFunc" entry-func) :void
  ;; void (*func)(int state)
  (callback-pointer :pointer))

(defcfun ("glutMenuStateFunc" menu-state-func) :void
  ;; void (*func)(int state)
  (callback-pointer :pointer))

(defcfun ("glutSpaceballMotionFunc" spaceball-motion-func) :void
  ;; void (*func)(int x, int y, int z)
  (callback-pointer :pointer))

(defcfun ("glutSpaceballRotateFunc" spaceball-rotate-func) :void
  ;; void (*func)(int x, int y, int z)
  (callback-pointer :pointer))

(defcfun ("glutSpaceballButtonFunc" spaceball-button-func) :void
  ;; void (*func)(int button, int state)
  (callback-pointer :pointer))

(defcfun ("glutButtonBoxFunc" button-box-func) :void
  ;; void (*func)(int button, int state)
  (callback-pointer :pointer))

(defcfun ("glutDialsFunc" dials-func) :void
  ;; void (*func)(int dial, int value)
  (callback-pointer :pointer))

(defcfun ("glutTabletMotionFunc" tablet-motion-func) :void
  ;; void (*func)(int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutTabletButtonFunc" tablet-button-func) :void
  ;; void (*func)(int button, int state, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutMenuStatusFunc" menu-status-func) :void
  ;; void (*func)(int status, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutOverlayDisplayFunc" overlay-display-func) :void
  ;; void (*func)(void)
  (callback-pointer :pointer))

(defcfun ("glutWindowStatusFunc" window-status-func) :void
  ;; void (*func)(int state)
  (callback-pointer :pointer))

(defcfun ("glutKeyboardUpFunc" keyboard-up-func) :void
  ;; void (*func)(unsigned char key, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutSpecialUpFunc" special-up-func) :void
  ;; void (*func)(int key, int x, int y)
  (callback-pointer :pointer))

(defcfun ("glutJoystickFunc" joystick-func) :void
  ;; void (*func)(unsigned int buttonMask, int x, int y, int z)
  (callback-pointer :pointer)
  (poll-interval :int))

;; freeglut ext
#-darwin
(defcfun ("glutMouseWheelFunc" mouse-wheel-func) :void
  ;; void (*func)(int button, int pressed, int x, int y)
  (callback-pointer :pointer))

;; freeglut/GLUT.framework ext
(defcfun (#-darwin "glutCloseFunc"
          #+darwin "glutWMCloseFunc" close-func) :void
  ;; void (*func)(void)
  (callback-pointer :pointer))

;; freeglut ext
(defcfun ("glutWMCloseFunc" wm-close-func) :void
  ;; void (*func)(void)
  (callback-pointer :pointer))

;; freeglut ext
#-darwin
(defcfun ("glutMenuDestroyFunc" menu-destroy-func) :void
  ;; void (*func)(void)
  (callback-pointer :pointer))

;;;; Types used for callbacks.

(defcenum entry-state
  :left
  :entered)

(defbitfield (joystick-buttons :unsigned-int)
  (:joystick-button-a 1)
  (:joystick-button-b 2)
  (:joystick-button-c 4)
  (:joystick-button-d 8))

(defcenum menu-state
  :menu-not-in-use
  :menu-in-use)

(defbitfield modifiers
  (:active-shift 1)
  (:active-ctrl 2)
  (:active-alt 4))

(defcenum mouse-button
  :left-button
  :middle-button
  :right-button
  :wheel-up
  :wheel-down
  :button4
  :button5
  :button6
  :button7
  :button8
  :button9
  :button10
  :button11
  :button12
  :button13
  :button14
  :button15
  :button16
  :button17
  :button18
  :button19
  :button20
  :button21
  :button22
  :button23
  :button24
  :button25
  :button26
  :button27
  :button28
  :button29
  :button30
  :button31
  :button32)

(defcenum mouse-button-state
  (:wheel-down -1)
  :down
  :up)

(defcenum special-keys
  ;; Function keys.
  (:key-f1 1)
  :key-f2
  :key-f3
  :key-f4
  :key-f5
  :key-f6
  :key-f7
  :key-f8
  :key-f9
  :key-f10
  :key-f11
  :key-f12
  ;; Directional keys.
  (:key-left 100)
  :key-up
  :key-right
  :key-down
  :key-page-up
  :key-page-down
  :key-home
  :key-end
  :key-insert
  ;; Modifiers keys
  (:key-left-shift 112)
  :key-right-shift
  :key-left-ctrl
  :key-right-ctrl
  :key-left-alt
  :key-right-alt)

(defcenum visibility-state
  :not-visible
  :visible)

(defcenum window-status
  :hidden
  :fully-retained
  :partially-retained
  :fully-covered)
