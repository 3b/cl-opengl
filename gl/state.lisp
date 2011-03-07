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
;;; Chapter 6 - State and State Requests
;;;
;;; 6.1 Querying GL State
;;;

;;; 6.1.1 Simple queries

;;; Association list mapping enums for known queries to the number and type of
;;; values returned by the query.  To perform a query that is not
;;; known in this table, the number of return values must be specified
;;; explicitly in the call to GET-*.
;;;  size can be a keyword, in which case actual size is (get-integer size 1)
(defparameter *query-enum-sizes*
  ;; missing/mismatches compared to old data:
  ;;:COMPRESSED-TEXTURE . 1  ---- doesn't exist?
  ;;:MAX-VIEWPORT-DIMS . 1 ---- should be 2?
  ;;:NUM-COMPRESSED-TEXTURE-FORMAT . 1 ---- typo, should be _formats ?
  '(
    (:current-color :float 4)
    (:current-secondary-color :float 4)
    (:current-index :integer 1)
    (:current-texture-coords :float 4)
    (:current-normal :float 3)
    (:current-fog-coordinate :float 1)
    (:current-raster-position :float 4)
    (:current-raster-distance :float 1)
    (:current-raster-color :float 4)
    (:current-raster-secondary-color :float 4)
    (:current-raster-index :integer 1)
    (:current-raster-texture-coords :float 4)
    (:current-raster-position-valid :boolean 1)
    (:edge-flag :boolean 1)
    (:vertex-array :enable 1)
    (:vertex-array-size :integer 1)
    (:vertex-array-type :enum 1)
    (:vertex-array-stride :integer 1)
    (:vertex-array-pointer :pointer 1)
    (:normal-array :enable 1)
    (:normal-array-type :enum 1)
    (:normal-array-stride :integer 1)
    (:normal-array-pointer :pointer 1)
    (:fog-coordinate-array :enable 1)
    (:fog-coordinate-array-type :enum 1)
    (:fog-coordinate-array-stride :integer 1)
    (:fog-coordinate-array-pointer :pointer 1)
    (:color-array :enable 1)
    (:color-array-size :integer 1)
    (:color-array-type :enum 1)
    (:color-array-stride :integer 1)
    (:color-array-pointer :pointer 1)
    (:secondary-color-array :enable 1)
    (:secondary-color-array-size :integer 1)
    (:secondary-color-array-type :enum 1)
    (:secondary-color-array-stride :integer 1)
    (:secondary-color-array-pointer :pointer 1)
    (:index-array :enable 1)
    (:index-array-type :enum 1)
    (:index-array-stride :integer 1)
    (:index-array-pointer :pointer 1)
    (:texture-coord-array :enable 1)
    (:texture-coord-array-size :integer 1)
    (:texture-coord-array-type :enum 1)
    (:texture-coord-array-stride :integer 1)
    (:texture-coord-array-pointer :pointer 1)
    (:edge-flag-array :enable 1)
    (:edge-flag-array-stride :integer 1)
    (:edge-flag-array-pointer :pointer 1)
    (:vertex-array-buffer-binding :integer 1)
    (:normal-array-buffer-binding :integer 1)
    (:color-array-buffer-binding :integer 1)
    (:index-array-buffer-binding :integer 1)
    (:texture-coord-array-buffer-binding :integer 1)
    (:edge-flag-array-buffer-binding :integer 1)
    (:secondary-color-array-buffer-binding :integer 1)
    (:fog-coordinate-array-buffer-binding :integer 1)
    (:element-array-buffer-binding :integer 1)
    (:vertex-array-binding :integer 1)
    (:client-active-texture :enum 1)
    (:array-buffer-binding :integer 1)
    (:color-matrix :float 16)
    (:transpose-color-matrix :float 16)
    (:modelview-matrix :float 16)
    (:transpose-modelview-matrix :float 16)
    (:projection-matrix :float 16)
    (:transpose-projection-matrix :float 16)
    (:texture-matrix :float 16)
    (:transpose-texture-matrix :float 16)
    (:viewport :integer 4)
    (:depth-range :float 2)
    (:color-matrix-stack-depth :integer 1)
    (:modelview-stack-depth :integer 1)
    (:projection-stack-depth :integer 1)
    (:texture-stack-depth :integer 1)
    (:matrix-mode :enum 1)
    (:normalize :enable 1)
    (:rescale-normal :enable 1)
    (:fog-color :float 4)
    (:fog-index :float 1 );integer?
    (:fog-density :float 1)
    (:fog-start :float 1)
    (:fog-end :float 1)
    (:fog-mode :enum 1)
    (:fog :enable 1)
    (:fog-coordinate-source :enum 1)
    (:color-sum :enable 1)
    (:shade-model :enum 1)
    (:clamp-vertex-color :enum 1 )
    (:clamp-fragment-color :enum 1)
    (:clamp-read-color :enum 1)
    (:lighting :enable 1)
    (:color-material :enable 1)
    (:color-material-parameter :enum 1)
    (:color-material-face :enum 1)
    (:light-model-ambient :float 4)
    (:light-model-local-viewer :boolean 1)
    (:light-model-two-side :boolean 1)
    (:light-model-color-control :enum 1)
    (:point-size :float 1)
    (:point-size-min :float 1)
    (:point-size-max :float 1)
    (:point-fade-threshold-size :float 1)
    (:point-distance-attenuation :float 3)
    (:point-sprite-coord-origin :enum 1)
    (:line-width :float 1)
    (:line-stipple-pattern :integer 1 )
    (:line-stipple-repeat :integer 1)
    (:cull-face-mode :enum 1)
    (:front-face :enum 1)
    (:polygon-mode :enum 2)
    (:polygon-offset-factor :float 1)
    (:polygon-offset-units :float 1)
    (:sample-coverage-value :float 1)
    (:sample-coverage-invert :boolean 1)
    (:texture-binding-1d :integer 1)
    (:texture-binding-2d :integer 1)
    (:texture-binding-3d :integer 1)
    (:texture-binding-1d-array :integer 1)
    (:texture-binding-2d-array :integer 1)
    (:texture-binding-cube-map :integer 1)
    (:active-texture :enum 1)
    (:scissor-box :integer 4)
    (:alpha-test-func :enum 1)
    (:alpha-test-ref :integer 1)
    (:stencil-func :enum 1)
    (:stencil-value-mask :integer 1)
    (:stencil-ref :integer 1)
    (:stencil-fail :enum 1)
    (:stencil-pass-depth-fail :enum 1)
    (:stencil-pass-depth-pass :enum 1)
    (:stencil-back-func :enum 1)
    (:stencil-back-value-mask :integer 1)
    (:stencil-back-ref :integer 1)
    (:stencil-back-fail :enum 1)
    (:stencil-back-pass-depth-fail :enum 1)
    (:stencil-back-pass-depth-pass :enum 1)
    (:depth-func :enum 1)
    (:blend-src :enum 1)
    (:blend-src-rgb :enum 1)
    (:blend-src-alpha :enum 1)
    (:blend-dst :enum 1)
    (:blend-dst-rgb :enum 1)
    (:blend-dst-alpha :enum 1)
    (:blend-equation :enum 1)
    (:blend-equation :enum 1)
    (:blend-equation-alpha :enum 1)
    (:blend-color :float 4)
    (:logic-op-mode :enum 1)
    (:index-writemask :integer 1)
    (:color-writemask :boolean 4 ) ;;get-boolean-i-v?
    (:depth-writemask :boolean 1)
    (:stencil-writemask :integer 1)
    (:stencil-back-writemask :integer 1)
    (:color-clear-value :float 4)
    (:index-clear-value :float 1) ;;integer?
    (:depth-clear-value :float 1)
    (:stencil-clear-value :integer 1)
    (:accum-clear-value :float 4)
    (:draw-framebuffer-binding :integer 1)
    (:read-framebuffer-binding :integer 1)
    (:draw-buffer   :enum 1)
    (:draw-buffer0  :enum 1)
    (:draw-buffer1  :enum 1)
    (:draw-buffer2  :enum 1)
    (:draw-buffer3  :enum 1)
    (:draw-buffer4  :enum 1)
    (:draw-buffer5  :enum 1)
    (:draw-buffer6  :enum 1)
    (:draw-buffer7  :enum 1)
    (:draw-buffer8  :enum 1)
    (:draw-buffer9  :enum 1)
    (:draw-buffer10 :enum 1)
    (:draw-buffer11 :enum 1)
    (:draw-buffer12 :enum 1)
    (:draw-buffer13 :enum 1)
    (:draw-buffer14 :enum 1)
    (:draw-buffer15 :enum 1)
    (:read-buffer   :enum 1)
    (:renderbuffer-binding :integer 1)
    (:unpack-swap-bytes :boolean 1)
    (:unpack-lsb-first :boolean 1)
    (:unpack-image-height :integer 1)
    (:unpack-skip-images :integer 1)
    (:unpack-row-length :integer 1)
    (:unpack-skip-rows :integer 1)
    (:unpack-skip-pixels :integer 1)
    (:unpack-alignment :integer 1)
    (:pack-swap-bytes :boolean 1)
    (:pack-lsb-first :boolean 1)
    (:pack-image-height :integer 1)
    (:pack-skip-images :integer 1)
    (:pack-row-length :integer 1)
    (:pack-skip-rows :integer 1)
    (:pack-skip-pixels :integer 1)
    (:pack-alignment :integer 1)
    (:pixel-pack-buffer-binding :integer 1)
    (:pixel-unpack-buffer-binding :integer 1)
    (:map-color :boolean 1)
    (:map-stencil :boolean 1)
    (:index-shift :integer 1)
    (:index-offset :integer 1)
    (:red-scale :float 1)
    (:green-scale :float 1)
    (:blue-scale :float 1)
    (:alpha-scale :float 1)
    (:depth-scale :float 1)
    (:red-bias :float 1)
    (:green-bias :float 1)
    (:blue-bias :float 1)
    (:alpha-bias :float 1)
    (:depth-bias :float 1)
    (:post-convolution-red-scale :float 1)
    (:post-convolution-green-scale :float 1)
    (:post-convolution-blue-scale :float 1)
    (:post-convolution-alpha-scale :float 1)
    (:post-convolution-red-bias :float 1)
    (:post-convolution-green-bias :float 1)
    (:post-convolution-blue-bias :float 1)
    (:post-convolution-alpha-bias :float 1)
    (:post-color-matrix-red-scale :float 1)
    (:post-color-matrix-green-scale :float 1)
    (:post-color-matrix-blue-scale :float 1)
    (:post-color-matrix-alpha-scale :float 1)
    (:post-color-matrix-red-bias :float 1)
    (:post-color-matrix-green-bias :float 1)
    (:post-color-matrix-blue-bias :float 1)
    (:post-color-matrix-alpha-bias :float 1)
    (:zoom-x :float 1)
    (:zoom-y :float 1)
    (:pixel-map-i-to-i-size :integer 1)
    (:pixel-map-s-to-s-size :integer 1)
    (:pixel-map-i-to-r-size :integer 1)
    (:pixel-map-i-to-g-size :integer 1)
    (:pixel-map-i-to-b-size :integer 1)
    (:pixel-map-i-to-a-size :integer 1)
    (:pixel-map-r-to-r-size :integer 1)
    (:pixel-map-g-to-g-size :integer 1)
    (:pixel-map-b-to-b-size :integer 1)
    (:pixel-map-a-to-a-size :integer 1)
    (:map1-vertex-3 :boolean 1)
    (:map1-vertex-4 :boolean 1)
    (:map1-index :boolean 1)
    (:map1-color-4 :boolean 1)
    (:map1-normal :boolean 1)
    (:map1-texture-coord-1 :boolean 1)
    (:map1-texture-coord-2 :boolean 1)
    (:map1-texture-coord-3 :boolean 1)
    (:map1-texture-coord-4 :boolean 1)
    (:map2-vertex-3 :boolean 1)
    (:map2-vertex-4 :boolean 1)
    (:map2-index :boolean 1)
    (:map2-color-4 :boolean 1)
    (:map2-normal :boolean 1)
    (:map2-texture-coord-1 :boolean 1)
    (:map2-texture-coord-2 :boolean 1)
    (:map2-texture-coord-3 :boolean 1)
    (:map2-texture-coord-4 :boolean 1)
    (:map1-grid-domain :float 2)
    (:map2-grid-domain :float 4)
    (:map1-grid-segments :float 1)
    (:map2-grid-segments :float 2)
    (:current-program :integer 1)
    (:transform-feedback-buffer-binding :integer-i 1)
    (:transform-feedback-buffer-start :integer-i 1)
    (:transform-feedback-buffer-size :integer-i 1)
    (:max-transform-feedback-interleaved-components :integer 1)
    (:max-transform-feedback-separate-attribs :integer 1)
    (:max-transform-feedback-separate-components :integer 1)
    (:perspective-correction-hint :enum 1)
    (:point-smooth-hint :enum 1)
    (:line-smooth-hint :enum 1)
    (:polygon-smooth-hint :enum 1)
    (:fog-hint :enum 1)
    (:generate-mipmap-hint :enum 1)
    (:texture-compression-hint :enum 1)
    (:fragment-shader-derivative-hint :enum 1)
    (:max-lights :integer 1)
    (:max-clip-planes :integer 1)
    (:max-color-matrix-stack-depth :integer 1)
    (:max-modelview-stack-depth :integer 1)
    (:max-projection-stack-depth :integer 1)
    (:max-texture-stack-depth :integer 1)
    (:subpixel-bits :integer 1)
    (:max-3d-texture-size :integer 1)
    (:max-texture-size :integer 1)
    (:max-array-texture-layers :integer 1)
    (:max-texture-lod-bias :float 1)
    (:max-cube-map-texture-size :integer 1)
    (:max-renderbuffer-size :integer 1)
    (:max-pixel-map-table :integer 1)
    (:max-name-stack-depth :integer 1)
    (:max-list-nesting :integer 1)
    (:max-eval-order :integer 1)
    (:max-viewport-dims :integer 2)
    (:max-attrib-stack-depth :integer 1)
    (:max-client-attrib-stack-depth :integer 1)
    (:aliased-point-size-range :float 2)
    (:point-size-range :float 2)
    (:point-size-granularity :float 1)
    (:smooth-point-size-range :float 2)
    (:smooth-point-size-granularity :float 1)
    (:aliased-line-width-range :float 2)
    (:line-width-range :float 2)
    (:line-width-granularity :float 1)
    (:smooth-line-width-range :float 2)
    (:smooth-line-width-granularity :float 1)
    (:max-elements-indices :integer 1)
    (:max-elements-vertices :integer 1)
    (:compressed-texture-formats :enum :num-compressed-texture-formats)
    (:num-compressed-texture-formats :integer 1)
    (:max-texture-buffer-size :integer 1)
    (:max-rectangle-texture-size :integer 1)
    (:extensions :string 1)
    (:num-extensions :integer 1)
    (:major-version :integer 1)
    (:minor-version :integer 1)
    (:context-flags :integer 1)
    (:renderer :string 1)
    (:shading-language-version :string 1)
    (:vendor :string 1)
    (:version :string 1)
    (:max-texture-units :integer 1)
    (:max-vertex-attribs :integer 1)
    (:max-vertex-uniform-components :integer 1)
    (:max-varying-components :integer 1)
    (:max-combined-texture-image-units :integer 1)
    (:max-vertex-texture-image-units :integer 1)
    (:max-texture-image-units :integer 1)
    (:max-texture-coords :integer 1)
    (:max-fragment-uniform-components :integer 1)
    (:min-program-texel-offset :integer 1)
    (:max-program-texel-offset :integer 1)
    (:aux-buffers :integer 1)
    (:max-draw-buffers :integer 1)
    (:rgba-mode :boolean 1)
    (:index-mode :boolean 1)
    (:doublebuffer :boolean 1)
    (:stereo :boolean 1)
    (:sample-buffers :integer 1)
    (:samples :integer 1)
    (:max-color-attachments :integer 1)
    (:max-samples :integer 1)
    (:red-bits :integer 1)
    (:green-bits :integer 1)
    (:blue-bits :integer 1)
    (:alpha-bits :integer 1)
    (:index-bits :integer 1)
    (:depth-bits :integer 1)
    (:stencil-bits :integer 1)
    (:accum-red-bits :integer 1)
    (:accum-green-bits :integer 1)
    (:accum-blue-bits :integer 1)
    (:accum-alpha-bits :integer 1)
    (:list-base :integer 1)
    (:list-index :integer 1)
    (:list-mode :enum 1)
    (:attrib-stack-depth :integer 1)
    (:client-attrib-stack-depth :integer 1)
    (:name-stack-depth :integer 1)
    (:render-mode :enum 1)
    (:selection-buffer-pointer :pointer 1)
    (:selection-buffer-size :integer 1)
    (:feedback-buffer-pointer :pointer 1)
    (:feedback-buffer-size :integer 1)
    (:feedback-buffer-type :enum 1)
    (:error :error 1)
    ;;
    (:alpha-test :boolean 1)
    (:auto-normal :boolean 1)
    (:blend :boolean 1)
    (:clip-plane0 :boolean 1)
    (:clip-plane1 :boolean 1)
    (:clip-plane2 :boolean 1)
    (:clip-plane3 :boolean 1)
    (:clip-plane4 :boolean 1)
    (:clip-plane5 :boolean 1)
    (:color-logic-op :boolean 1)
    (:color-table :boolean 1)
    (:convolution-1d :boolean 1)
    (:convolution-2d :boolean 1)
    (:cull-face :boolean 1)
    (:depth-test :boolean 1)
    (:dither :boolean 1)
    (:histogram :boolean 1)
    (:index-logic-op :boolean 1)
    (:light0 :boolean 1)
    (:light1 :boolean 1)
    (:light2 :boolean 1)
    (:light3 :boolean 1)
    (:light4 :boolean 1)
    (:light5 :boolean 1)
    (:light6 :boolean 1)
    (:light7 :boolean 1)
    (:line-smooth :boolean 1)
    (:line-stipple :boolean 1)
    (:minmax :boolean 1)
    (:point-smooth :boolean 1)
    (:polygon-offset-fill :boolean 1)
    (:polygon-offset-line :boolean 1)
    (:polygon-offset-point :boolean 1)
    (:polygon-smooth :boolean 1)
    (:polygon-stipple :boolean 1)
    (:post-color-matrix-color-table :boolean 1)
    (:post-convolution-color-table :boolean 1)
    (:scissor-test :boolean 1)
    (:separable-2d :boolean 1)
    (:stencil-test :boolean 1)
    (:texture-1d :boolean 1)
    (:texture-2d :boolean 1)
    (:texture-3d :boolean 1)
    (:texture-cube-map :boolean 1)
    (:texture-gen-q :boolean 1)
    (:texture-gen-r :boolean 1)
    (:texture-gen-s :boolean 1)
    (:texture-gen-t :boolean 1)
    ))

;;; Return the default array size for a state query enum.
(defun query-enum-size (value)
  (let ((count (or (third (assoc value *query-enum-sizes*))
                   (error "Unknown query enum: ~A" value))))
    (if (keywordp count)
        (get-integer count 1)
        count)))

;;; Define a query function NAME that calls the OpenGL function FN,
;;; passing an array of foreign type TYPE.  The elements of the
;;; foreign array are converted back to Lisp values by first
;;; dereferencing the buffer.
(defmacro define-query-function (name fn type &optional (lisp-type t))
  `(defun ,name (value &optional (count (query-enum-size value)))
     (declare (fixnum count))
     (with-foreign-object (buf ',type count)
       (,fn value buf)
       (if (> count 1)
           (let ((result (make-array count :element-type ',lisp-type)))
             (dotimes (i count)
               (setf (aref result i) (mem-aref buf ',type i)))
             result)
           (mem-ref buf ',type)))))

;;; Define query functions for the basic types.
(define-query-function get-boolean %gl:get-boolean-v %gl:boolean)
(define-query-function get-integer %gl:get-integer-v %gl:int)
(define-query-function get-float %gl:get-float-v %gl:float single-float)
(define-query-function get-double %gl:get-double-v %gl:double double-float)
(define-query-function get-pointer %gl:get-pointer-v :pointer)

(defun try-to-parse-enum (value)
  (or (foreign-enum-keyword '%gl:enum value :errorp nil)
      value))


;;; Wrapper around GET-INTEGER when the result should be interpreted
;;; as an enumerated constant.
(defun get-enum (value &optional (count (query-enum-size value)))
  (let ((result (get-integer value count)))
    (if (vectorp result)
        (map 'vector #'try-to-parse-enum result)
        (try-to-parse-enum result))))


(import-export %gl:get-string)

;;; generic get that handles type and number of values for known enums
;;; fixme: better name?
(defun get* (name)
  (destructuring-bind (enum type size)
      (assoc name *query-enum-sizes*)
    (declare (ignore enum))
    (when (keywordp size)
      (setf size (get-integer size 1)))
    (ecase type
      (:boolean (get-boolean name size))
      (:integer (get-integer name size))
      (:float (get-float name size))
      ;(:integer-i (format nil " don't know how to get ~s, type~s~%" enum type))
      (:enable (enabledp name))
      (:enum (get-enum name size))
      (:string (get-string name ))
      (:pointer (get-pointer name size))
      (:error (get-error)))))

;;; compiler macro to open code values for enums known at compile time
(define-compiler-macro get* (&whole form name)
  (if (and (constantp name) (keywordp name)
           (assoc name *query-enum-sizes*))
      (destructuring-bind (e type count)
          (assoc name *query-enum-sizes*)
        (declare (ignore e))
        `(let ((size ,(if (keywordp count) `(get-integer ,count 1) count)))
           (declare (ignorable size))
           , (ecase type
               (:boolean `(get-boolean ,name size))
               (:integer `(get-integer ,name size))
               (:float `(get-float ,name size))
               ;;(:integer-i (format nil " don't know how to get ~s, type~s~%" enum type))
               (:pointer `(get-pointer ,name size))
               (:enum `(get-enum ,name size))
               (:enable `(enabledp ,name))
               (:string `(get-string ,name ))
               (:error `(get-error)))))
      form))


;;; FIXME: Enable/Disable do not belong here, but I can't find the proper
;;; place to put them. They appear the first time in 2.11.3, but that's
;;; about normal transformations.

;; external
(defun enable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%gl:enable cap)))

(define-compiler-macro enable (&rest caps)
  `(progn
     ,@(loop for cap in caps
          for v = (when (keywordp cap)
                    (foreign-enum-value '%gl:enum cap :errorp nil))
          when v collect `(%gl:enable ,v)
          else collect `(%gl:enable ,cap))))

;; external
(defun disable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%gl:disable cap)))

(define-compiler-macro disable (&rest caps)
  `(progn
     ,@(loop for cap in caps
          for v = (when (keywordp cap)
                    (foreign-enum-value '%gl:enum cap :errorp nil))
          when v collect `(%gl:disable ,v)
          else collect `(%gl:disable ,cap))))

;; external
(definline enabledp (cap)
  (%gl:is-enabled cap))

;;; 6.1.11 Pointer and String Queries

;;; FIXME: missing glGetPointer

;(import-export %gl:get-string)

;; external
(defun gl3-major-version ()
  (get-integer :major-version))

;; external
(defun gl3-minor-version ()
  (get-integer :minor-version))

(defun parse-gl-version-string-values (string)
  ;; major version is integer value up to first #\.
  ;; minor version is integer from first #\. to a #\. or #\space
  (let ((dot (position #\. string)))
    (values
     (values (parse-integer string :end dot :junk-allowed t)) ; major
     (if dot ; minor
         (values (parse-integer string :start (1+ dot) :junk-allowed t))
         0))))

(defun parse-gl-version-string-float (string)
  (let* ((dot nil)
         (end (position-if-not (lambda (c) (or (digit-char-p c)
                                               (and (char= c #\.)
                                                    (not dot)
                                                    (setf dot t))))
                               string)))
    (values (read-from-string string nil 0.0 :end end))))

;; external
(defun gl-version ()
  (parse-gl-version-string-float (get-string :version)))



;; external
(defun major-version ()
  (values (parse-gl-version-string-values (get-string :version))))


;; external
(defun minor-version ()
  (nth-value 1 (parse-gl-version-string-values (get-string :version))))

;; external
(defun glsl-version ()
  (parse-gl-version-string-float (get-string :shading-language-version)))

;; external
(defun glsl-major-version ()
  (values (parse-gl-version-string-values (get-string :shading-language-version))))

;; external
(defun glsl-minor-version ()
  (nth-value 1 (parse-gl-version-string-values (get-string :shading-language-version))))




;; external
(defun gl3-extension-present-p (name)
  "Check for presence of extension NAME useing only non-deprecated gl3
functionality. Currently not implemented for speed, so don't use in
inner loops."
  (loop for i below (get-integer :num-extensions)
     when (string= name (%gl:get-string-i :extensions i))
     return t
     finally (return nil)))


;; external
(defun extension-present-p (name)
  "Check for presence of extension NAME in gl extension list, not
currently implemented for speed, so avoid in inner loops"
  ;; gl3 deprecates the :extensions argument to get-string, so we
  ;; use the new gl3 methods in a gl3+ context
  (if (>= (major-version) 3)
      (gl3-extension-present-p name)
      ;; we can't just search here, since we don't want to match substrings
      ;; it would possibly be cleaner to split up the extension list and
      ;; cache it if there is a good way to tell when to invalidate the
      ;; cache
      (unless (find #\space name)
        (let* ((extension-string (get-string :extensions))
               (start (search name extension-string))
               (end (when start (+ start (length name)))))
          (and start
               (or (zerop start)
                   (char= #\space (char extension-string (1- start))))
               (or (= end (length extension-string))
                   (and (< end (length extension-string))
                        (char= #\space (char extension-string end)))))))))


;;; 6.1.14 Shader and Program Queries

(import-export %gl:is-shader)

(define-get-function get-shader-aux (shader pname)
  (%gl:get-shader-iv :int int))

(defun get-shader (shader pname)
  (case pname
    ((:delete-status :compile-status)
     ;; Return a boolean for these.
     (plusp (get-shader-aux shader pname :int)))
    (otherwise
     (get-shader-aux shader pname :int))))

(import-export %gl:is-program)

(define-get-function get-program-aux (program pname)
  (%gl:get-program-iv :int int))

(defun get-program (program pname)
  (case pname
    ((:delete-status :link-status :validate-status)
     ;; Return a boolean for these.
     (plusp (get-program-aux program pname :int)))
    (otherwise
     (get-program-aux program pname :int))))

(define-get-function get-active-uniform-block-aux
    (program uniformblockindex pname)
  (%gl:get-active-uniform-block-iv :int int))

(defun get-active-uniform-block (program block-index pname)
  (case pname
    ((:uniform-block-referenced-by-vertex-shader
      :uniform-block-referenced-by-fragment-shader
      :uniform-block-referenced-by-geometry-shader
      :uniform-block-referenced-by-tess-control-shader
      :uniform-block-referenced-by-tess-evaluation-shader)
     (plusp (get-active-uniform-block-aux program block-index pname :int)))
    ((:uniform-block-active-uniform-indices)
     (let ((i-count (get-active-uniform-block-aux
                     program block-index :uniform-block-active-uniforms
                     :int)))
       (ensure-list (get-active-uniform-block-aux program block-index
                                                  pname :int i-count))))
    (otherwise
     (get-active-uniform-block-aux program block-index pname :int))))

(defun get-active-uniform-block-name (program block-index)
  (let ((name-length (get-active-uniform-block program block-index
                                               :uniform-block-name-length)))
    (with-foreign-objects ((characters-written '%gl:sizei)
                           (name '%gl:char name-length))
      (%gl:get-active-uniform-block-name program block-index name-length
                                         characters-written name)
      (when (< 0 (mem-ref characters-written '%gl:sizei))
        (foreign-string-to-lisp name)))))

(defun get-attached-shaders (program)
  "Returns a list of the shaders attached to PROGRAM"
  (let ((max-shaders (get-program program :attached-shaders)))
    (with-foreign-object (shaders '%gl:uint max-shaders)
      (%gl:get-attached-shaders program max-shaders (null-pointer) shaders)
      (loop for i below max-shaders
            collecting (mem-aref shaders '%gl:uint i)))))

(defun get-shader-info-log (shader)
  "Returns as a string the entire info log for SHADER"
  (let ((info-log-length (get-shader shader :info-log-length)))
    (with-foreign-object (info-log '%gl:char info-log-length)
      (%gl:get-shader-info-log shader info-log-length (null-pointer) info-log)
      (foreign-string-to-lisp info-log))))

(defun get-program-info-log (program)
  "Returns as a string the entire info log for PROGRAM"
  (let ((info-log-length (get-program program :info-log-length)))
    (with-foreign-object (info-log '%gl:char info-log-length)
      (%gl:get-program-info-log program info-log-length (null-pointer) info-log)
      (foreign-string-to-lisp info-log))))

(defun get-shader-source (shader)
  "Returns as a string the entire source of SHADER"
  (let ((source-length (get-shader shader :shader-source-length)))
    (with-foreign-object (source '%gl:char source-length)
      (%gl:get-shader-source shader source-length (null-pointer) source)
      (foreign-string-to-lisp source))))

;;; 6.1.15 Saving and Restoring State

;;not used anymore?
;;(defun make-bitfield (enum-name attributes)
;;  (apply #'logior 0 (mapcar (lambda (x)
;;                              (foreign-enum-value enum-name x))
;;                            attributes)))

;; external
(defun push-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%gl:push-attrib attributes))

(define-compiler-macro push-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%gl:push-attrib ,(foreign-bitfield-value '%gl:AttribMask attributes))
      form))

(import-export %gl:pop-attrib)

(defmacro with-pushed-attrib ((&rest attributes) &body body)
  `(progn
     (push-attrib ,@attributes)
     (multiple-value-prog1 (progn ,@body)
       (pop-attrib))))

;; external
(defun push-client-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%gl:push-client-attrib attributes))

(define-compiler-macro push-client-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%gl:push-client-attrib ,(foreign-bitfield-value '%gl:ClientAttribMask attributes))
      form))

(import-export %gl:pop-client-attrib)

(defmacro with-pushed-client-attrib ((&rest attributes) &body body)
  `(progn
     (push-client-attrib ,attributes)
     (multiple-value-prog1 (progn ,@body)
       (pop-client-attrib))))

;;; not sure these are actually useful, so not exported for now...

(defmacro features-present-p (&body options)
  "Returns true if any of the forms in body are true after substitution for
:major :minor as major and minor version, and \"ARB_foo\" for presence of
named GL extension
 ex: (features-present-p (> :major 3) (and (> :major 2) \"ARB_texture_rg\"))"
  (labels ((build-tests (list)
             (mapcar (lambda (x)
                       (cond
                         ((stringp x) `(extension-present-p ,x))
                         ((eq x :major-version) `(major-version))
                         ((eq x :minor-version) `(minor-version))
                         ((listp x) (build-tests x))
                         (t x)))
                     list)))
    `(or ,@(build-tests options))))

;;; throw an error if gl version isn't high enough, or required
;;; extensions are missing
;;; fixme: need better error msg, either as argument, or from parsing options?
(defmacro ensure-features (&body options)
  `(unless (features-present-p ,@options)
     (error "GL implementation doesn't meet minimum requirements, need~% ~s" '(or ,@options))))

;;(features-present-p (> :major-version 3) (and (> :major-version 2) "ARB_texture_rg"))
