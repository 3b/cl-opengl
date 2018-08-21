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

(in-package #:cl-opengl)

;;;
;;; Chapter 3 - Rasterization
;;;

;;;
;;; 3.3 Points
;;;

(import-export %gl:point-size)

(defun point-parameter (pname value)
  (ecase pname
    ((:point-size-min :point-size-max :point-fade-threshold-size)
     (%gl:point-parameter-f pname value))
    (:point-sprite-coord-origin
     (%gl:point-parameter-i pname (foreign-enum-value '%gl:enum value)))
    (:point-distance-attenuation
     (with-foreign-object (p '%gl:float 3)
       (dotimes (i 3)
         (setf (mem-aref p '%gl:float i) (elt value i)))
       (%gl:point-parameter-fv pname p)))))

;;;
;;; 3.4 Line Segments
;;;

(import-export %gl:line-width
               %gl:line-stipple)

;;;
;;; 3.5 Polygons
;;;

;;; 3.5.1 Basic Polygon Rasterization

(import-export %gl:cull-face)

;;; 3.5.2 Stippling

(defun polygon-stipple (pattern)
  (with-opengl-sequence (p '%gl:ubyte pattern)
    (%gl:polygon-stipple p)))

;;; 3.5.4 Options Controlling Polygon Rasterization

(import-export %gl:polygon-mode %gl:polygon-offset)

;;;
;;; 3.6 Pixel Rectangles
;;;

;;; 3.6.1 Pixel Storage Modes

(defun pixel-store (pname value)
  (ecase pname
    ((:unpack-swap-bytes :unpack-lsb-first
      :pack-swap-bytes :pack-lsb-first)
     (%gl:pixel-store-i pname (if value 1 0)))
    ((:unpack-row-length :unpack-skip-rows :unpack-skip-pixels
      :unpack-alignment :unpack-image-height :unpack-skip-images
      :pack-row-length :pack-skip-rows :pack-skip-pixels
      :pack-alignment :pack-image-height :pack-skip-images)
     (%gl:pixel-store-i pname value))))

;;; 3.6.3 Pixel Transfer Modes

(defun pixel-transfer (pname value)
  (case pname
    ((:map-color :map-stencil)
     (%gl:pixel-transfer-i pname (if value 1 0)))
    ((:index-shift :index-offset)
     (%gl:pixel-transfer-i pname value))
    (t
     (%gl:pixel-transfer-f pname value))))

(defun pixel-map (map values)
  (let ((n (length values)))
    (with-foreign-object (p '%gl:float n)
      (dotimes (i n)
        (setf (mem-aref p '%gl:float i) (elt values i)))
      (%gl:pixel-map-fv map n p))))

;;; 3.6.4 Rasterization of Pixel Rectangles

(defun draw-pixels (width height format type data)
  (with-pixel-array (array type data)
    (%gl:draw-pixels width height format type array)))

;;;
;;; 3.8 Texturing
;;;

(defun active-texture (texture)
  (typecase texture
    ;; allow specifying a texture unit directly by # (0=:texture0,
    ;; 1=:texture1,etc)
    ((integer 0 #.(1- (foreign-enum-value '%gl:enum :texture0)))
     (%gl:active-texture (+ texture
                            #.(foreign-enum-value '%gl:enum :texture0))))
    (t (%gl:active-texture texture))))

;;; 3.8.1 Texture image specification

(defun internal-format->int (format)
  (if (keywordp format)
      (foreign-enum-value '%gl:enum format)
      (if (and (numberp format) (< 0 format 5))
          format
          (error "Internal format must be either a keyword or an integer ~
                  in the range [1,4]."))))

(defun tex-image-3d (target level internal-format width height depth border
                     format type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%gl:tex-image-3d
         target level internal-size width height depth border format type data)
        (if data
            (with-pixel-array (array type data)
              (%gl:tex-image-3d target level internal-size width
                                height depth border format type array))
            (%gl:tex-image-3d target level internal-size width height
                              depth border format type (cffi:null-pointer))))))

(defun tex-image-2d (target level internal-format width height border format
                     type data &key raw)
  ;; if RAW is true, assume DATA is an (UNSIGNED-BYTE 8) vector containing
  ;; appropriately formatted data for specified TYPE
  (let ((internal-size (internal-format->int internal-format)))
    (cond
      ((pointerp data)
       (%gl:tex-image-2d target level internal-size width height border format
                         type data))
      ((and data raw)
       (check-type data (simple-array (unsigned-byte 8) (*)))
       (with-pixel-array (array :unsigned-byte data)
         (%gl:tex-image-2d target level internal-size width height border
                           format type array)))
      (data
       (with-pixel-array (array type data)
         (%gl:tex-image-2d target level internal-size width height border
                           format type array)))
      (t
       (%gl:tex-image-2d target level internal-size width height border
                         format type (cffi:null-pointer))))))

(defun tex-image-1d (target level internal-format width border format type data)
  (let ((internal-size (internal-format->int internal-format)))
    (if (pointerp data)
        (%gl:tex-image-1d target level internal-size width border format
                          type data)
        (if data
            (with-pixel-array (array type data)
              (%gl:tex-image-1d target level internal-size width border format
                                type array))
              (%gl:tex-image-1d target level internal-size width border format
                                type (cffi:null-pointer))))))

;;; 3.8.2 Alternate Texture Image Specification Commands

(defun copy-tex-image-2d (target level internal-format x y width height border)
  (%gl:copy-tex-image-2d target level (internal-format->int internal-format)
                         x y width height border))

(defun copy-tex-image-1d (target level internal-format x y width border)
  (%gl:copy-tex-image-1d target level (internal-format->int internal-format)
                         x y width border))

(defun tex-sub-image-1d (target level xoffset width format type data)
  (if (pointerp data)
      (%gl:tex-sub-image-1d target level xoffset width format type data)
      (with-pixel-array (array type data)
        (%gl:tex-sub-image-1d target level xoffset width format type array))))

(defun tex-sub-image-2d (target level xoffset yoffset width height format type
                         data)
  (if (pointerp data)
      (%gl:tex-sub-image-2d target level xoffset yoffset width height format
                            type data)
      (with-pixel-array (array type data)
        (%gl:tex-sub-image-2d target level xoffset yoffset width height format
                              type array))))

(defun tex-sub-image-3d (target level xoffset yoffset zoffset width height
                         depth format type data)
  (if (pointerp data)
      (%gl:tex-sub-image-3d target level xoffset yoffset zoffset width height
                            depth format type data)
      (with-pixel-array (array type data)
        (%gl:tex-sub-image-3d target level xoffset yoffset zoffset width
                              height depth format type array))))

(import-export %gl:copy-tex-sub-image-1d
               %gl:copy-tex-sub-image-2d
               %gl:copy-tex-sub-image-3d)

;;; 3.8.3 Compressed Texture Images

(defun compressed-tex-image-1d (target level internal-format width border
                                data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-image-1d target level internal-format
                                   width border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-image-1d target level internal-format
                                     width border image-size array))))

(defun compressed-tex-image-2d (target level internal-format width height border
                                data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-image-2d target level internal-format
                                   width height border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-image-2d target level internal-format
                                     width height border image-size array))))

(defun compressed-tex-image-3d (target level internal-format width height depth
                                border data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-image-3d target level internal-format width
                                   height depth border image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-image-3d target level internal-format width
                                     height depth border image-size array))))

(defun compressed-tex-sub-image-1d (target level xoffset width format
                                    data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-sub-image-1d target level xoffset width
                                       format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-sub-image-1d target level xoffset width
                                         format image-size array))))

(defun compressed-tex-sub-image-2d (target level xoffset yoffset width height
                                    format data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-sub-image-2d target level xoffset yoffset width height
                                       format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-sub-image-2d target level xoffset yoffset width height
                                         format image-size array))))

(defun compressed-tex-sub-image-3d (target level xoffset yoffset zoffset width height
                                    depth format data &optional (image-size (length data)))
  (if (pointerp data)
      (%gl:compressed-tex-sub-image-3d target level xoffset yoffset zoffset width
                                       height depth format image-size data)
      (with-pixel-array (array :unsigned-byte data)
        (%gl:compressed-tex-sub-image-3d target level xoffset yoffset zoffset width
                                         height depth format image-size array))))

;;; 3.8.4 Texture parameters

(macrolet ((body (target i f fv &optional tex)
             `(ecase pname
                ;; valid for both
                ((:texture-wrap-s :texture-wrap-t :texture-wrap-r)
                 (,i ,target pname (foreign-enum-value '%gl:enum param)))
                ((:texture-min-filter :texture-mag-filter)
                 (,i ,target pname (foreign-enum-value '%gl:enum param)))
                (:texture-border-color
                 (with-foreign-object (array '%gl:float 4)
                   (dotimes (i 4)
                     (setf (mem-aref array '%gl:float i) (elt param i)))
                   (,fv ,target pname array)))
                ((:texture-min-lod :texture-max-lod)
                 (,f ,target pname param))
                ((:texture-lod-bias)
                 (,i ,target pname (truncate param)))
                ((:texture-compare-mode :texture-compare-func)
                 (,i ,target pname (foreign-enum-value '%gl:enum param)))
                (:texture-max-anisotropy-ext
                 (,f ,target pname param))
                (:texture-cube-map-seamless
                 (,i ,target pname (if param 1 0)))
                ;; tex only
                ,@(when tex
                    `(((:texture-base-level :texture-max-level
                        :virtual-page-size-index-arb)
                       (,i ,target pname (truncate param)))
                      ((:texture-swizzle-r :texture-swizzle-g
                        :texture-swizzle-b :texture-swizzle-a)
                       (,i ,target pname (foreign-enum-value '%gl:enum param)))
                      ((:generate-mipmap :texture-sparse-arb)
                       (,i ,target pname (if param 1 0)))
                      ((:depth-texture-mode
                        :depth-stencil-texture-mode)
                       (,i ,target pname (foreign-enum-value '%gl:enum param)))
                      ((:texture-priority )
                       (,f ,target pname param)))))))
  (defun tex-parameter (target pname param)
    (body target %gl:tex-parameter-i %gl:tex-parameter-f %gl:tex-parameter-fv
          t))
  (defun sampler-parameter (sampler pname param)
    (body sampler
          %gl:sampler-parameter-i %gl:sampler-parameter-f %gl:sampler-parameter-fv))
  (defun texture-parameter (texture pname param)
    (body texture %gl:texture-parameter-i
          %gl:texture-parameter-f %gl:texture-parameter-fv
          t)))


;;; 3.8.12 Texture Objects

(import-export %gl:bind-texture)

(defun delete-textures (textures)
  (with-opengl-sequence (array '%gl:uint textures)
    (%gl:delete-textures (length textures) array)))

(defun delete-texture (texture)
  (delete-textures (list texture)))

(defun gen-textures (count)
  (with-foreign-object (texture-array '%gl:uint count)
    (%gl:gen-textures count texture-array)
    (loop for i below count
          collecting (mem-aref texture-array '%gl:uint i))))

(defun gen-texture ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl:gen-textures 1 array)
    (mem-aref array '%gl:uint 0)))

(defun create-textures (target count)
  (with-foreign-object (texture-array '%gl:uint count)
    (%gl:create-textures target count texture-array)
    (loop for i below count
          collecting (mem-aref texture-array '%gl:uint i))))

(defun create-texture (target)
  (with-foreign-object (array '%gl:uint 1)
    (%gl:create-textures target 1 array)
    (mem-aref array '%gl:uint 0)))

(import-export %gl:bind-sampler)

(defun delete-samplers (samplers)
  (with-opengl-sequence (array '%gl:uint samplers)
    (%gl:delete-samplers (length samplers) array)))

(defun delete-sampler (sampler)
  (delete-samplers (list sampler)))

(defun gen-samplers (count)
  (with-foreign-object (sampler-array '%gl:uint count)
    (%gl:gen-samplers count sampler-array)
    (loop for i below count
          collecting (mem-aref sampler-array '%gl:uint i))))

(defun gen-sampler ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl:gen-samplers 1 array)
    (mem-aref array '%gl:uint 0)))

(defun create-samplers (count)
  (with-foreign-object (samplers '%gl:uint count)
    (%gl:create-samplers count samplers)
    (loop for i below count
          collecting (mem-aref samplers '%gl:uint i))))

(defun create-sampler ()
  (with-foreign-object (samplers '%gl:uint 1)
    (%gl:create-samplers 1 samplers)
    (mem-aref samplers '%gl:uint 0)))


;;; The following two functions look awkward to use, so we'll provide the two
;;; lispier functions TEXTURE-RESIDENT-P and PRIORITIZE-TEXTURE, which can be
;;; used in mapping functions or like (every #'texture-resident-p texture-list).

;;; TODO: check whether the new gl:boolean semantics didn't break
;;; these functions.

(defun are-textures-resident (textures)
  (let ((count (length textures)))
    (with-opengl-sequence (texture-array '%gl:uint textures)
      (with-foreign-object (residence-array '%gl:boolean count)
        (if (%gl:are-textures-resident count texture-array residence-array)
            (loop for i below count
                  collecting (mem-aref residence-array '%gl:boolean i))
            t)))))

(defun prioritize-textures (textures priorities)
  (let ((texture-count (length textures))
        (priority-count (length priorities)))
    (when (/= texture-count priority-count)
      (error "There needs to be an equal number of textures and priorities."))
    (with-opengl-sequence (texture-array '%gl:uint textures)
      (with-opengl-sequence (priority-array '%gl:clampf priorities)
        (%gl:prioritize-textures texture-count texture-array priority-array)))))


(defun texture-resident-p (texture)
  (with-foreign-objects ((texture-pointer '%gl:uint)
                         (residence-pointer '%gl:boolean))
    (setf (mem-ref texture-pointer '%gl:uint) texture)
    (%gl:are-textures-resident 1 texture-pointer residence-pointer)))

(defun prioritize-texture (texture priority)
  (with-foreign-objects ((texture-pointer '%gl:uint)
                         (priority-pointer '%gl:clampf))
    (setf (mem-ref texture-pointer '%gl:uint) texture
          (mem-ref priority-pointer '%gl:clampf) priority)
    (%gl:prioritize-textures 1 texture-pointer priority-pointer)))


;;; 3.8.13 Texture Environments and Texture Functions

;;; Ye gods, have mercy!

(defun tex-env (target pname value)
  (let (pname-value)
    (ecase target
      (:texture-filter-control
       (setf pname-value (foreign-enum-value '%gl:enum pname))
       (ecase pname
         (:texture-lod-bias (%gl:tex-env-f target pname-value value))))

      (:texture-env
       (setf pname-value (foreign-enum-value '%gl:enum pname))
       (ecase pname
         (:texture-env-mode
          (%gl:tex-env-i target pname-value
                         (foreign-enum-value '%gl:enum value)))
         (:texture-env-color
          (with-foreign-object (p '%gl:float 4)
            (dotimes (i 4)
              (setf (mem-aref p '%gl:float i) (elt value i)))
            (%gl:tex-env-fv target pname-value p)))
         (:combine-rgb
          (%gl:tex-env-i target pname-value
                         (foreign-enum-value '%gl:enum value)))
         (:combine-alpha
          (%gl:tex-env-i target pname-value
                         (foreign-enum-value '%gl:enum value)))))

     (:point-sprite
      (setf pname-value (foreign-enum-value '%gl:enum pname))
      (ecase pname
        (:coord-replace (%gl:tex-env-i target pname-value (if value 1 0))))))))

;;; texture queries
(macrolet ((with-getters ((f i &rest vars) &body body)
             `(macrolet ((floats (c)
                           `(with-foreign-object (buf '%gl:float ,c)
                              (,',f ,@',vars pname buf)
                              ,(if (= c 1)
                                   `(mem-aref buf '%gl:float 0)
                                   `(loop for i below ,c
                                          collect (mem-aref buf '%gl:float i)))))
                         (ints (c)
                           `(with-foreign-object (buf '%gl:int ,c)
                              (,',i ,@',vars pname buf)
                              ,(if (= c 1)
                                   `(mem-aref buf '%gl:int 0)
                                   `(loop for i below ,c
                                          collect (mem-aref buf '%gl:int i)))))
                         (enums (c)
                           `(with-foreign-object (buf '%gl:enum ,c)
                              (,',i ,@',vars pname buf)
                              ,(if (= c 1)
                                   `(mem-aref buf '%gl:enum 0)
                                   `(loop for i below ,c
                                          collect (mem-aref buf '%gl:enum i)))))
                         (bool (c)
                           `(with-foreign-object (buf '%gl:int ,c)
                              (,',i ,@',vars pname buf)
                              ,(if (= c 1)
                                   `(not (zerop (mem-aref buf '%gl:int 0)))
                                   `(loop for i below ,c
                                          collect (not (zerop (mem-aref buf '%gl:int i))))))))
                ,@body)))

  (defun get-tex-parameter (target pname)
    (with-getters (%gl:get-tex-parameter-fv %gl:get-tex-parameter-iv target)
      #1=(ecase pname
           ((:depth-stencil-texture-mode
             :texture-mag-filter :texture-min-filter
             :texture-swizzle-r :texture-swizzle-g
             :texture-swizzle-b :texture-swizzle-a
             :texture-wrap-s :texture-wrap-t :texture-wrap-r
             :texture-compare-mode :texture-compare-func
             :texture-immutable-format)
            (enums 1))
           ((:texture-swizzle-rgba)
            (enums 4))
           ((:texture-base-level :texture-max-level
             :texture-view-min-level :texture-view-num-levels
             :texture-view-min-layer :texture-view-num-layers
             :texture-immutable-levels)
            (ints 1))
           ((:texture-min-lod :texture-max-lod
             :texture-max-anisotropy :texture-max-anisotropy-ext)
            (floats 1))
           ((:texture-border-color)
            (floats 4)))))

  (defun get-texture-parameter (texture pname)
    (with-getters (%gl:get-texture-parameter-fv
                   %gl:get-texture-parameter-iv
                   texture)
      #1#))

  (defun get-tex-level-parameter (target level pname)
    (with-getters (%gl:get-tex-level-parameter-fv
                   %gl:get-tex-level-parameter-iv
                   target level)
      #2=(ecase pname
           (:texture-internal-format
            (let ((a (ints 1)))
              (if (<= a 4)
                  a
                  (cffi:foreign-enum-keyword '%gl::enum a))))
           ((:texture-red-type :texture-green-type :texture-blue-type
                               :texture-alpha-type :texture-depth-type)
            (enums 1))
           ((:texture-compressed)
            (bool 1))
           ((:texture-width :texture-height :texture-depth
                            :texture-red-size :texture-green-size :texture-blue-size
             :texture-alpha-size :texture-depth-size
             :texture-compressed-image-size
                            :texture-buffer-offset :texture-buffer-size)
            (ints 1)))))

  (defun get-texture-level-parameter (texture level pname)
    (with-getters (%gl:get-texture-level-parameter-fv
                   %gl:get-texture-level-parameter-iv
                   texture level)
      #2#)))

;;;
;;; 3.10 Fog
;;;

(defun fog (pname param)
  (ecase pname
    (:fog-color
     (with-foreign-object (c '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref c '%gl:float i) (elt param i)))
       (%gl:fog-fv pname c)))
    (:fog-mode
     (%gl:fog-i pname (foreign-enum-value '%gl:enum param)))
    (:fog-coord-src
     (%gl:fog-i pname (foreign-enum-value '%gl:enum param)))
    ((:fog-density :fog-start :fog-end)
     (%gl:fog-f pname param))))


;;; 3.12.2 Shader Execution

;;; TODO: make these use :STRING
(defun get-frag-data-location (program name)
  (with-foreign-string (s name)
    (%gl:get-frag-data-location program s)))

(defun bind-frag-data-location (program color name)
  (with-foreign-string (s name)
    (%gl:bind-frag-data-location program color s)))


(defun get-frag-data-location-ext (program name)
  (with-foreign-string (s name)
    (%gl:get-frag-data-location-ext program s)))

(defun bind-frag-data-location-ext (program color name)
  (with-foreign-string (s name)
    (%gl:bind-frag-data-location-ext program color s)))
