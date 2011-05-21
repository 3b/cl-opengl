;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; package.lisp --- Package definition for cl-glu.
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

(defpackage #:cl-glu
  (:nicknames #:glu)
  (:use #:cl #:cffi)
  (:export
   ;;# Functions
   #:quadric-texture
   #:quadric-orientation
   #:quadric-normals
   #:quadric-draw-style
   #:new-quadric
   #:delete-quadric
   #:quadric-normals
   #:sphere
   #:cylinder
   #:disk
   #:partial-disk
   #:build-2d-mipmaps
   #:get-string
   #:check-extension
   #:scale-image
   #:ortho-2d
   #:perspective
   #:look-at
   #:pick-matrix
   #:project
   #:un-project
   #:un-project4
   ;; Tessellation
   #:tessellator
   #:tess-delete
   ;; Tessellator methods
   #:tess-begin-polygon
   #:tess-begin-contour
   #:tess-vertex
   #:tess-end-contour
   #:tess-end-polygon
   #:tess-begin
   #:tess-error
   #:tess-end
   #:tess-property
   ;; Tessellator callbacks
   #:begin-data-callback
   #:edge-flag-data-callback
   #:end-data-callback
   #:vertex-data-callback
   #:error-data-callback
   #:combine-data-callback
   ;; Tessellator macros
   #:with-tess-polygon
   #:with-tess-contour))
