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

(in-package #:cl-opengl3)

;;;
;;; Chapter 3 - Rasterization
;;;

;;;
;;; 3.3 Points
;;;

(import-export %gl3:point-size)

(defun point-parameter (pname value)
  (ecase pname
    ((:point-size-min :point-size-max :point-fade-threshold-size)
     (%gl3:point-parameter-f pname value))
    (:point-sprite-coord-origin
     (%gl3:point-parameter-i pname (foreign-enum-value '%gl3:enum value)))
    (:point-distance-attenuation
     (with-foreign-object (p '%gl3:float 3)
       (dotimes (i 3)
         (setf (mem-aref p '%gl3:float i) (elt value i)))
       (%gl3:point-parameter-fv pname p)))))

;;;
;;; 3.4 Line Segments
;;;

(import-export %gl3:line-width)

;;;
;;; 3.5 Polygons
;;;

;;; 3.5.1 Basic Polygon Rasterization

(import-export %gl3:cull-face)

;;; 3.5.4 Options Controlling Polygon Rasterization

(import-export %gl3:polygon-mode
               %gl3:polygon-offset)

;;;
;;; 3.6 Pixel Rectangles
;;;

;;; 3.6.1 Pixel Storage Modes

(defun pixel-store (pname value)
  (ecase pname
    ((:unpack-swap-bytes :unpack-lsb-first)
     (%gl3:pixel-store-i pname (if value 1 0)))
    ((:unpack-row-length :unpack-skip-rows :unpack-skip-pixels
      :unpack-alignment :unpack-image-height :unpack-skip-images)
     (%gl3:pixel-store-i pname value))))


;;;
;;; 3.8 Texturing
;;;

;;; 3.8.1 Texture image specification

(defun internal-format->int (format)
  (if (keywordp format)
      (foreign-enum-value '%gl3:enum format)
      (if (and (numberp format) (< 0 format 5))
          format
          (error "Internal format must be either a keyword or an integer ~
                  in the range [1,4]."))))

(defun tex-image-3d (target level internal-format width height depth border
                     format type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%gl3:tex-image-3d
         target level internal-size width height depth border format type data)
        (with-pixel-array (array type data)
          (%gl3:tex-image-3d target level internal-size width
                            height depth border format type array)))))

(defun tex-image-2d (target level internal-format width height border format
                     type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%gl3:tex-image-2d target level internal-size width height border format
                          type data)
        (with-pixel-array (array type data)
          (%gl3:tex-image-2d target level internal-size width height border
                            format type array)))))

(defun tex-image-1d (target level internal-format width border format type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%gl3:tex-image-1d target level internal-size width border format
                          type data)
        (with-pixel-array (array type data)
          (%gl3:tex-image-1d target level internal-size width border format
                            type array)))))

;;; 3.8.2 Alternate Texture Image Specification Commands

(defun copy-tex-image-2d (target level internal-format x y width height border)
  (%gl3:copy-tex-image-2d target level (internal-format->int internal-format)
                         x y width height border))

(defun copy-tex-image-1d (target level internal-format x y width border)
  (%gl3:copy-tex-image-1d target level (internal-format->int internal-format)
                         x y width border))

(defun tex-sub-image-1d (target level xoffset width format type data)
  (if (pointerp data)
      (%gl3:tex-sub-image-1d target level xoffset width format type data)
      (with-pixel-array (array type data)
        (%gl3:tex-sub-image-1d target level xoffset width format type array))))

(defun tex-sub-image-2d (target level xoffset yoffset width height format type
                         data)
  (if (pointerp data)
      (%gl3:tex-sub-image-2d target level xoffset yoffset width height format
                            type data)
      (with-pixel-array (array type data)
        (%gl3:tex-sub-image-2d target level xoffset yoffset width height format
                              type array))))

(defun tex-sub-image-3d (target level xoffset yoffset zoffset width height
                         depth format type data)
  (if (pointerp data)
      (%gl3:tex-sub-image-3d target level xoffset yoffset zoffset width height
                            depth format type data)
      (with-pixel-array (array type data)
        (%gl3:tex-sub-image-3d target level xoffset yoffset zoffset width
                              height depth format type array))))

(import-export %gl3:copy-tex-sub-image-1d
               %gl3:copy-tex-sub-image-2d
               %gl3:copy-tex-sub-image-3d)

;;; 3.8.3 Compressed Texture Images

(defun compressed-tex-image-1d (target level internal-format width border
                                data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-image-1d target level internal-format
                                   width border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-image-1d target level internal-format
                                     width border image-size array))))

(defun compressed-tex-image-2d (target level internal-format width height border
                                data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-image-2d target level internal-format
                                   width height border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-image-2d target level internal-format
                                     width height border image-size array))))

(defun compressed-tex-image-3d (target level internal-format width height depth
                                border data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-image-3d target level internal-format width
                                   height depth border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-image-3d target level internal-format width
                                     height depth border image-size array))))

(defun compressed-tex-sub-image-1d (target level xoffset width format
                                    data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-sub-image-1d target level xoffset width
                                       format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-sub-image-1d target level xoffset width
                                         format image-size array))))

(defun compressed-tex-sub-image-2d (target level xoffset yoffset width height
                                    format data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-sub-image-2d target level xoffset yoffset width height
                                       format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-sub-image-2d target level xoffset yoffset width height
                                         format image-size array))))

(defun compressed-tex-sub-image-3d (target level xoffset yoffset zoffset width height
                                    depth format data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl3:compressed-tex-sub-image-3d target level xoffset yoffset zoffset width
                                       height depth format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl3:compressed-tex-sub-image-3d target level xoffset yoffset zoffset width
                                         height depth format image-size array))))

;;; 3.8.4 Texture parameters

(defun tex-parameter (target pname param)
  (ecase pname
    ((:texture-wrap-s :texture-wrap-t :texture-wrap-r)
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:texture-min-filter
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:texture-mag-filter
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:texture-border-color
     (with-foreign-object (array '%gl3:float 4)
       (dotimes (i 4)
         (setf (mem-aref array '%gl3:float i) (elt param i)))
       (%gl3:tex-parameter-fv target pname array)))
    ((:texture-priority :texture-min-lod :texture-max-lod)
     (%gl3:tex-parameter-f target pname param))
    ((:texture-base-level :texture-lod-bias)
     (%gl3:tex-parameter-i target pname (truncate param)))
    (:depth-texture-mode
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:texture-compare-mode
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:texture-compare-func
     (%gl3:tex-parameter-i target pname (foreign-enum-value '%gl3:enum param)))
    (:generate-mipmap
     (%gl3:tex-parameter-i target pname (if param 1 0)))
    (:texture-max-anisotropy-ext
     (%gl3:tex-parameter-f target pname param))))

;;; 3.8.12 Texture Objects

(import-export %gl3:bind-texture)

(defun delete-textures (textures)
  (with-opengl-sequence (array '%gl3:uint textures)
    (%gl3:delete-textures (length textures) array)))

(defun gen-textures (count)
  (with-foreign-object (texture-array '%gl3:uint count)
    (%gl3:gen-textures count texture-array)
    (loop for i below count
          collecting (mem-aref texture-array '%gl3:uint i))))


;;; 3.8.13 Texture Environments and Texture Functions

;;; Ye gods, have mercy!

(defun tex-env (target pname value)
  (let (pname-value)
    (ecase target
      (:texture-filter-control
       (setf pname-value (foreign-enum-value '%gl3:enum pname))
       (ecase pname
         (:texture-lod-bias (%gl3:tex-env-f target pname-value value))))

      (:texture-env
       (setf pname-value (foreign-enum-value '%gl3:enum pname))
       (ecase pname
         (:texture-env-mode
          (%gl3:tex-env-i target pname-value
                         (foreign-enum-value '%gl3:enum value)))
         (:texture-env-color
          (with-foreign-object (p '%gl3:float 4)
            (dotimes (i 4)
              (setf (mem-aref p '%gl3:float i) (elt value i)))
            (%gl3:tex-env-fv target pname-value p)))
         (:combine-rgb
          (%gl3:tex-env-i target pname-value
                         (foreign-enum-value '%gl3:enum value)))
         (:combine-alpha
          (%gl3:tex-env-i target pname-value
                         (foreign-enum-value '%gl3:enum value)))))

     (:point-sprite
      (setf pname-value (foreign-enum-value '%gl3:enum pname))
      (ecase pname
        (:coord-replace (%gl3:tex-env-i target pname-value (if value 1 0))))))))


;;; 3.12.2 Shader Execution

;;; TODO: make these use :STRING
(defun get-frag-data-location (program name)
  (with-foreign-string (s name)
    (%gl3:get-frag-data-location program s)))

(defun bind-frag-data-location (program color name)
  (with-foreign-string (s name)
    (%gl3:bind-frag-data-location program color s)))


(defun get-frag-data-location-ext (program name)
  (with-foreign-string (s name)
    (%gl3:get-frag-data-location-ext program s)))

(defun bind-frag-data-location-ext (program color name)
  (with-foreign-string (s name)
    (%gl3:bind-frag-data-location-ext program color s)))
