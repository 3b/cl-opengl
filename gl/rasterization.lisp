;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; Copyright (c) 2004, Oliver Markovic <entrox@entrox.org> 
;;;   All rights reserved. 
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;;  o Redistributions of source code must retain the above copyright notice,
;;;    this list of conditions and the following disclaimer. 
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution. 
;;;  o Neither the name of the author nor the names of the contributors may be
;;;    used to endorse or promote products derived from this software without
;;;    specific prior written permission. 
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(in-package :cl-opengl)

;;;
;;; Chapter 3 - Rasterization
;;;

;;;
;;; 3.3 Points
;;;

(declaim (inline point-size))
(defun point-size (size)
  (%glPointSize (float size)))

(defun point-parameter (pname value)
  (ecase pname
    ((:point-size-min :point-size-max :point-fade-threshold-size)
     (%glPointParameterf pname (float value)))
    (:point-sprite-coord-origin
     (%glPointParameteri pname (foreign-enum-value 'point-sprite-coord-origin value)))
    (:point-distance-attenuation
     (with-foreign-object (p 'float 3)
       (dotimes (i 3)
         (setf (mem-aref p 'float i) (float (elt value i))))
       (%glPointParameterfv pname p)))))


;;;
;;; 3.4 Line Segments
;;;

(declaim (inline line-width))
(defun line-width (width)
  (%glLineWidth (float width)))

(declaim (inline line-stipple))
(defun line-stipple (factor pattern)
  (%glLineStipple factor pattern))



;;;
;;; 3.5 Polygons
;;;

;;; 3.5.1 Basic Polygon Rasterization

(defun cull-face (face)
  (%glCullFace face))


;;; 3.5.4 Options Controlling Polygon Rasterization

(declaim (inline polygon-mode))
(defun polygon-mode (face mode)
  (%glPolygonMode face mode))

(declaim (inline polygon-offset))
(defun polygon-offset (factor units)
  (%glPolygonOffset (float factor) (float units)))



;;;
;;; 3.6 Pixel Rectangles
;;;

(defun pixel-store (pname value)
  (ecase pname
    ((:unpack-swap-bytes :unpack-lsb-first)
     (%glPixelStorei pname (if value 1 0)))
    ((:unpack-row-length :unpack-skip-rows :unpack-skip-pixels
      :unpack-alignment :unpack-image-height :unpack-skip-images)
     (%glPixelStorei pname value))))

(defun pixel-transfer (pname value)
  (case pname
    ((:map-color :map-stencil)
     (%glPixelTransferi pname (if value 1 0)))
    ((:index-shift :index-offset)
     (%glPixelTransferi pname value))
    (t
     (%glPixelTransferf pname value))))

(defun pixel-map (map values)
  (let ((n (length values)))
    (with-foreign-object (p 'float n)
      (dotimes (i n)
        (setf (mem-aref p 'float i) (float (elt values i))))
      (%glPixelMapfv map n p))))





(defcfun ("glColorTable" %glColorTable) :void
  (target color-table-name)
  (internal-format pixel-data-internal-format)
  (width sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))


;;;
;;; 3.8 Texturing
;;;


;;; 3.8.1 Texture image specification

(defun internal-format->int (format)
  (if (keywordp format)
      (foreign-enum-value 'pixel-data-internal-format format)
      (if (and (numberp format) (< 0 format 5))
          format
          (error "Internal format must be either a keyword or an integer in the range [1,4]."))))

(defun tex-image-2d (target level internal-format width height border format type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%glTexImage2D target level internal-size width height border format type data )
        (with-pixel-array (array type data)
          (%glTexImage2D target level internal-size width height border format type array)))))



;;; 3.8.4 Texture parameters

(defun tex-parameter (target pname param)
  (ecase pname
    ((:texture-wrap-s :texture-wrap-t :texture-wrap-r)
     (%glTexParameteri target pname (foreign-enum-value 'texture-wrap-mode param)))
    (:texture-min-filter
     (%glTexParameteri target pname (foreign-enum-value 'texture-min-filter param)))
    (:texture-mag-filter
     (%glTexParameteri target pname (foreign-enum-value 'texture-mag-filter param)))
    (:texture-border-color
     (with-foreign-object (array 'float 4)
       (dotimes (i 4)
         (setf (mem-aref array 'float i) (float (aref param i))))
       (%glTexParameterfv target pname array)))
    ((:texture-priority :texture-min-lod :texture-max-lod)
     (%glTexParameterf target pname (float param)))
    ((:texture-base-level :texture-lod-bias)
     (%glTexParameteri target pname (truncate param)))
    (:depth-texture-mode
     (%glTexParameteri target pname (foreign-enum-value 'depth-texture-mode param)))
    (:texture-compare-mode
     (%glTexParameteri target pname (foreign-enum-value 'texture-compare-mode param)))
    (:texture-compare-func
     (%glTexParameteri target pname (foreign-enum-value 'compare-func param)))
    (:generate-mipmap
     (%glTexParameteri target pname (if param 1 0)))))


;;; 3.8.12 Texture Objects

;; external
(defcfun ("glBindTexture" bind-texture) :void
  (target texture-target)
  (handle uint))


(defcfun ("glDeleteTextures" %glDeleteTextures) :void
  (n sizei)
  (textures :pointer))

;; external
(defun delete-textures (&rest textures)
  (declare (dynamic-extent textures))
  (let ((count (length textures)))
    (with-foreign-object (texture-array 'uint count)
      (loop for tex in textures
            counting tex into i
            do (setf (mem-aref texture-array 'uint (1- i)) tex))
      (%glDeleteTextures count texture-array))
    count))


(defcfun ("glGenTextures" %glGenTextures) :void
  (n sizei)
  (textures :pointer))

;; external
(defun gen-textures (count)
  (with-foreign-object (texture-array 'uint count)
    (%glGenTextures count texture-array)
    (loop for i below count
          collecting (mem-aref texture-array 'uint i))))


;;;
;;; 3.10 Fog
;;;

;; external
(defun fog (pname param)
  (ecase pname
    (:fog-mode
     (%glFogi pname (foreign-enum-value 'fog-mode param)))
    (:fog-coord-src
     (%glFogi pname (foreign-enum-value 'fog-coord-src param)))
    ((:fog-density :fog-start :fog-end)
     (%glFogf pname (float param)))))
