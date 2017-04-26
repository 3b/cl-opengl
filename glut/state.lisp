;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; state.lisp --- GLUT Window state setting and retrieval API.
;;;
;;; Copyright (c) 2006, Alexey Dvoychenkov
;;; Copyright (c) 2006, Luis Oliveira  <loliveira@common-lisp.net>
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

;;; Unimplemented freeglut extensions:
;;;
;;; FGAPI void*   FGAPIENTRY glutGetWindowData( void );
;;; FGAPI void    FGAPIENTRY glutSetWindowData(void* data);
;;; FGAPI void*   FGAPIENTRY glutGetMenuData( void );
;;; FGAPI void    FGAPIENTRY glutSetMenuData(void* data);

;;; Setting Options

(defparameter *window-close-action* nil)

;; freeglut ext
(defcenum (options %gl:enum)
  (:init-window-x #x01F4)
  :init-window-y
  :init-window-width
  :init-window-height
  :init-display-mode
  :action-on-window-close
  (:multisample 128)
  (:rendering-context #x01FD)
  :direct-rendering
  (:window-cursor #x007A))

;;; freeglut ext
#-darwin
(defcfun ("glutSetOption" set-option) :void
  (option options)
  (value :int))

#+darwin
(defun set-option (val1 val2)
  (declare (ignore val1 val2))
  (warn "GLUT:SET-OPTION not supported in GLUT.framework"))

;;; Also provide some utility functions around glutSetOption().

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

(defun set-display-mode (&rest options)
  (set-option :init-display-mode
              (foreign-bitfield-value 'display-mode options)))

(defun set-action-on-window-close (action)
  #-darwin
  (set-option :action-on-window-close
              (foreign-enum-value 'window-close-behaviour action))
  (setf *window-close-action* action))

(defun set-rendering-context (option)
  (set-option :rendering-context
              (foreign-enum-value 'rendering-context option)))

(defun set-direct-rendering (option)
  (set-option :direct-rendering
              (foreign-enum-value 'rendering-context-options option)))

;;; Getting Options

(defcenum (get-param %gl:enum)
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
  #-darwin :rendering-context           ; freeglut ext
  :direct-rendering)

(defcfun ("glutGet" get) :int
  (query get-param))

;;; Utility functions around glutGet().

(defun getp (query)
  (if (= (get query) 0)
      nil
      t))

(defun get-window-cursor ()
  (foreign-enum-keyword 'cursor (get :window-cursor)))

(defun get-init-display-mode ()
  (foreign-bitfield-symbols 'display-mode (get :init-display-mode)))

;;; Other Getters

(defcenum (device-get-param %gl:enum)
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

(defcfun ("glutDeviceGet" device-get) :int
  (query device-get-param))

(defun device-getp (query)
  (if (= (device-get query) 0)
      nil
      t))

(defcenum (layer-get-param %gl:enum)
  (:overlay-possible #x0320)
  :layer-in-use
  :has-overlay
  :transparent-index
  :normal-damaged
  :overlay-damaged)

(defcfun ("glutLayerGet" layer-get) :int
  (query layer-get-param))

(defun layer-getp (query)
  (if (= (layer-get query) 0)
      nil
      t))

(defun get-layer-in-use ()
  (foreign-enum-keyword 'layer-type (layer-get :layer-in-use)))

(defcfun ("glutGetModifiers" %glutGetModifiers) :int)

(declaim (inline get-modifiers))
(defun get-modifiers ()
  (foreign-bitfield-symbols 'modifiers (%glutGetModifiers)))

;;; No idea if this is more efficient space-wise...
(declaim (inline get-modifier-values))
(defun get-modifier-values ()
  (let ((mask (%glutGetModifiers)))
    (values (= 1 (logand mask 1))    ; shift
            (= 2 (logand mask 2))    ; ctrl
            (= 4 (logand mask 4))))) ; alt

(defcfun ("glutExtensionSupported" extension-supported-p) :boolean
  (extension-name :string))

;;; freeglut ext
(defcfun ("glutGetProcAddress" get-proc-address) :pointer
  (proc-name :string))