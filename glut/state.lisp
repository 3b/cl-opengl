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

;;; freeglut ext
(defcfun ("glutSetOption" set-option) :void
  (option options)
  (value :int))

;;; Also provide some utility functions around glutSetOption().

(defun set-display-mode (&rest options)
  (set-option :init-display-mode
              (foreign-bitfield-value 'display-mode options)))

(defun set-action-on-window-close (action)
  (set-option :action-on-window-close
              (foreign-enum-value 'window-close-behaviour action)))

(defun set-rendering-context (option)
  (set-option :rendering-context
              (foreign-enum-value 'rendering-context option)))

(defun set-direct-rendering (option)
  (set-option :direct-rendering
              (foreign-enum-value 'rendering-context-options option)))

;;; Getting Options

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

(defcfun ("glutDeviceGet" device-get) :int
  (query device-get-param))

(defun device-getp (query)
  (if (= (device-get query) 0)
      nil
      t))

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