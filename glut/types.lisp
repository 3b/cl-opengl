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

;; XXX: fix defcenum in CFFI
(defcenum display-mode
  (:rgb 0)
  ;(:rgba 0)
  (:index 1)
  ;(:single 0)
  (:double 2)
  (:accum 4)
  (:alpha 8)
  (:depth 16)
  (:stencil 32)
  (:multisample 128)
  (:stereo 256)
  (:luminance 512))

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

(defcenum visibility-state
  :not-visible
  :visible)
