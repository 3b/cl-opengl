;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; package.lisp --- cl-glut package definition.
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

(in-package #:cl-user)

(defpackage #:cl-glut
  (:nicknames #:glut)
  (:use #:cl #:cffi)
  (:import-from #:alexandria #:deletef #:emptyp)
  ;; interface.lisp stuff
  (:shadow #:special #:close)
  (:export
   ;; events / GFs
   #:idle
   #:keyboard
   #:special
   #:reshape
   #:visibility
   #:display
   #:mouse
   #:motion
   #:passive-motion
   #:entry
   #:menu-state
   #:spaceball-motion
   #:spaceball-rotate
   #:spaceball-button
   #:button-box
   #:dials
   #:tablet-motion
   #:tablet-button
   #:menu-status
   #:overlay-display
   #:window-status
   #:keyboard-up
   #:special-up
   #:joystick
   #:mouse-wheel
   #:close
   #:wm-close
   #:menu-destroy
   #:enable-event
   #:disable-event
   #:display-window
   #:tick
   ;; classes
   #:base-window
   #:window
   #:sub-window
   ;; accessors
   #:title
   #:name
   #:id
   #:events
   #:parent
   #:pos-x
   #:pos-y
   #:width
   #:height
   #:mode
   #:game-mode
   ;; other functions and macros
   #:display-window
   #:find-window
   #:with-window
   #:destroy-current-window
   #:schedule-timer
   #:enable-tick
   #:disable-tick
   ;; specials
   #:*run-main-loop-after-display*)
  ;; everything else
  (:shadow #:get)
  (:export
   ;; Enums and Bitfields
   #:cursor
   #:device-get-param
   #:display-mode
   #:entry-state
   #:color-component
   #:game-mode-param
   #:get-param
   #:layer-get-param
   #:layer-type
   #:menu-state
   #:modifiers
   #:video-resize-param
   #:mouse-button
   #:mouse-button-state
   #:key-repeat-mode
   #:rendering-context
   #:rendering-context-options
   #:joystick-buttons
   #:special-keys
   #:visibility-state
   #:options                            ; freeglut ext
   #:window-close-behaviour             ; freeglut ext
   #:window-status

   ;; initialization api
   #:init
   #:init-display-mode
   #:init-display-string
   #:init-window-size
   #:init-window-position

   ;; event loop api
   #:main-loop
   #:main-loop-event
   #:leave-main-loop

   ;; window api
   #:create-window
   #:create-sub-window
   #:destroy-window
   #:set-window
   #:get-window
   #:set-window-title
   #:set-icon-title
   #:reshape-window
   #:position-window
   #:show-window
   #:hide-window
   #:iconify-window
   #:push-window
   #:pop-window
   #:full-screen
   #:post-window-redisplay
   #:post-redisplay
   #:swap-buffers
   #:warp-pointer
   #:set-cursor

   ;; overlay management api
   #:establish-overlay
   #:remove-overlay
   #:use-layer
   #:post-overlay-redisplay
   #:post-window-overlay-redisplay
   #:show-overlay
   #:hide-overlay

   ;; menu management api
   #:create-menu
   #:destroy-menu
   #:get-menu
   #:set-menu
   #:add-menu-entry
   #:add-sub-menu
   #:change-to-menu-entry
   #:change-to-sub-menu
   #:remove-menu-item
   #:attach-menu
   #:detach-menu

   ;; window callback api
   #:timer-func
   #:idle-func
   #:keyboard-func
   #:special-func
   #:reshape-func
   #:visibility-func
   #:display-func
   #:mouse-func
   #:motion-func
   #:passive-motion-func
   #:entry-func
   #:menu-state-func
   #:spaceball-motion-func
   #:spaceball-rotate-func
   #:spaceball-button-func
   #:button-box-func
   #:dials-func
   #:tablet-motion-func
   #:tablet-button-func
   #:dials-func
   #:menu-status-func
   #:overlay-display-func
   #:window-status-func
   #:keyboard-up-func
   #:special-up-func
   #:joystick-func
   #:mouse-wheel-func                   ; freeglut ext
   #:close-func                         ; freeglut ext
   #:wm-close-func                      ; freeglut ext
   #:menu-destroy-func                  ; freeglut ext

   ;; state api
   #:set-option                         ; freeglut ext
   #:set-display-mode
   #:set-action-on-window-close
   #:set-rendering-context
   #:set-direct-rendering
   #:get
   #:getp
   #:get-window-cursor
   #:get-init-display-mode
   #:device-get
   #:device-getp
   #:layer-get
   #:layer-getp
   #:get-layer-in-use
   #:get-modifiers
   #:get-modifier-values
   #:extension-supported-p
   #:get-proc-address

   ;; font rendering api
   #:+stroke-roman+
   #:+stroke-mono-roman+
   #:+bitmap-9-by-15+
   #:+bitmap-8-by-13+
   #:+bitmap-times-roman-10+
   #:+bitmap-times-roman-24+
   #:+bitmap-helvetica-10+
   #:+bitmap-helvetica-12+
   #:+bitmap-helvetica-18+
   #:bitmap-character
   #:bitmap-width
   #:stroke-character
   #:stroke-width
   #:bitmap-length                      ; freeglut ext?
   #:stroke-length                      ; freeglut ext?
   #:bitmap-height                      ; freeglut ext
   #:stroke-height                      ; freeglut ext
   #:bitmap-string                      ; freeglut ext
   #:stroke-string                      ; freeglut ext

   ;; geometry api
   #:wire-cube
   #:solid-cube
   #:wire-sphere
   #:solid-sphere
   #:wire-cone
   #:solid-cone
   #:wire-torus
   #:solid-torus
   #:wire-dodecahedron
   #:solid-dodecahedron
   #:wire-octahedron
   #:solid-octahedron
   #:wire-tetrahedron
   #:solid-tetrahedron
   #:wire-icosahedron
   #:solid-icosahedron
   #:wire-teapot
   #:solid-teapot
   #:wire-rhombic-dodecahedron          ; freeglut ext
   #:solid-rhombic-dodecahedron         ; freeglut ext
   #:wire-sierpinski-sponge             ; freeglut ext
   #:solid-sierpinski-sponge            ; freeglut ext
   #:wire-cylinder                      ; freeglut ext
   #:solid-cylinder                     ; freeglut ext

   ;; game mode api
   #:game-mode-string
   #:enter-game-mode
   #:leave-game-mode
   #:game-mode-get
   #:game-mode-getp

   ;; video resize api (unimplemented by freeglut)
   #:video-resize-get
   #:setup-video-resizing
   #:stop-video-resizing
   #:video-resize
   #:video-pan

   ;; misc
   #:set-color
   #:get-color
   #:copy-colormap
   #:ignore-key-repeat
   #:set-key-repeat
   #:force-joystick-func
   #:report-errors
   ))
