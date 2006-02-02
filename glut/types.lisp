;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; types.lisp --- GLUT enum and bitfield definitions.
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

(defcenum color-component
  :red
  :green
  :blue)

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

(defcenum (device-get-param gl:enum)
  (:has-keyboard #x0258)
  :has-mouse
  :has-spaceball
  :has-dial-and-button-box
  :has-tablet
  :num-mouse-buttons
  :num-spaceball-buttons
  :num-button-box-buttons
  :num-dials
  :num-tablet-buttons
  :device-ignore-key-repeat
  :device-key-repeat
  :has-joystick
  :owns-joystick
  :joystick-buttons
  :joystick-axes
  :joystick-poll-rate)

(defbitfield (display-mode :unsigned-int)
  (:rgb 0)
  (:rgba 0)
  (:index 1)
  (:single 0)
  (:double 2)
  (:accum 4)
  (:alpha 8)
  (:depth 16)
  (:stencil 32)
  (:multisample 128)
  (:stereo 256)
  (:luminance 512)
  (:aux1 #x1000)                        ; freeglut ext
  (:aux2 #x2000)                        ; freeglut ext
  (:aux3 #x4000)                        ; freeglut ext
  (:aux4 #x8000))                       ; freeglut ext

(defcenum entry-state
  :left
  :entered)

(defcenum (game-mode-param gl:enum)
  :game-mode-active
  :game-mode-possible
  :game-mode-width
  :game-mode-height
  :game-mode-pixel-depth
  :game-mode-refresh-rate
  :game-mode-display-changed)

(defcenum (get-param gl:enum)
  (:window-x #x0064)
  :window-y
  :window-width
  :window-height
  :window-buffer-size
  :window-stencil-size
  :window-depth-size
  :window-red-size
  :window-green-size
  :window-blue-size
  :window-alpha-size
  :window-accum-red-size
  :window-accum-green-size
  :window-accum-blue-size
  :window-accum-alpha-size
  :window-doublebuffer
  :window-rgba
  :window-parent
  :window-num-children
  :window-colormap-size
  :window-num-samples
  :window-stereo
  :window-cursor
  (:screen-width #x00C8)
  :screen-height
  :screen-width-mm
  :screen-height-mm
  (:menu-num-items #x012C)
  (:display-mode-possible #x0190)
  (:init-window-x #x01F4)
  :init-window-y
  :init-window-width
  :init-window-height
  :init-display-mode
  (:elapsed-time #x02BC)
  (:window-format-id #x007B)
  :init-state
  (:action-on-window-close #x01F9)      ; freeglut ext
  :window-border-width                  ; freeglut ext
  :window-header-height                 ; freeglut ext
  :version                              ; freeglut ext
  :rendering-context                    ; freeglut ext
  :direct-rendering)                    ; freeglut ext

(defbitfield (joystick-buttons :unsigned-int)
  (:joystick-button-a 1)
  (:joystick-button-b 2)
  (:joystick-button-c 4)
  (:joystick-button-d 8))

(defcenum (layer-get-param gl:enum)
  (:overlay-possible #x0320)
  :layer-in-use
  :has-overlay
  :transparent-index
  :normal-damaged
  :overlay-damaged)

(defcenum (layer-type gl:enum)
  :normal
  :overlay)

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
  :right-button)

(defcenum mouse-button-state
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
  :key-insert)

(defcenum (video-resize-param gl:enum)
  (:video-resize-possible #x0384)
  :video-resize-in-use
  :video-resize-x-delta
  :video-resize-y-delta
  :video-resize-width-delta
  :video-resize-height-delta
  :video-resize-x
  :video-resize-y
  :video-resize-width
  :video-resize-height)

(defcenum visibility-state
  :not-visible
  :visible)

(defcenum window-status
  :hidden
  :fully-retained
  :partially-retained
  :fully-covered)

;; freeglut ext
(defcenum (options gl:enum)
  (:init-window-x #x01F4)
  :init-window-y
  :init-window-width
  :init-window-height
  :init-display-mode
  :action-on-window-close
  (:rendering-context #x01FD)
  :direct-rendering
  :window-cursor)

;; freeglut ext
(defcenum rendering-context
  :create-new-context
  :use-current-context)

;; freeglut ext
(defcenum rendering-context-options
  :force-indirect-context
  :allow-direct-context
  :try-direct-context
  :force-direct-context)

;; freeglut ext
(defcenum window-close-behaviour
  :action-exit
  :action-glutmainloop-returns
  :action-continue-execution)