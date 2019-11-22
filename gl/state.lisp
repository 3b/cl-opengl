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

(definline enabledp-i (cap index)
  (%gl:is-enabled-i cap index))

;;; 6.1.1 Simple queries

;;; Association list mapping enums for known queries to the number and type of
;;; values returned by the query.  To perform a query that is not
;;; known in this table, the number of return values must be specified
;;; explicitly in the call to GET-*.
;;;  size can be a keyword, in which case actual size is (get-integer size 1)
;; (name type count &optional max)
;; NAME is enum to query
;; TYPE is things like :integer, :float, etc possibly with -i or /i suffix
;;   to indicate indexed variants (-i is for indexed queries only, /i
;;   for queries that can be used with or without an index)
;; COUNT is number of values expected (returned as an array if more than 1)
;; MAX is optional value or enum to query to determine highest valid
;;   index for -i variants (not used currently, but useful fo dumping
;;   current state for debugging, or possible future function to retrieve
;;   all values for a -i query at once)
(defparameter *query-enum-sizes*
  '(;; 6.8 (table # from opengl 4.2 compat profile spec)
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
    (:patch-vertices :integer 1)
    (:patch-default-outer-level :float 4)
    (:patch-default-inner-level :float 2)
    ;; 6.9
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
    ;; 6.10
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
    ;; 6.11
    (:vertex-attrib-array-enabled :vertex-attrib-boolean 1 :max-vertex-attribs)
    (:vertex-attrib-array-size :vertex-attrib-integer 1 :max-vertex-attribs)
    (:vertex-attrib-array-stride :vertex-attrib-integer 1 :max-vertex-attribs)
    (:vertex-attrib-array-type :vertex-attrib-enum 1 :max-vertex-attribs)
    (:vertex-attrib-array-normalized :vertex-attrib-boolean 1 :max-vertex-attribs)
    (:vertex-attrib-array-integer :vertex-attrib-boolean 1 :max-vertex-attribs)
    (:vertex-attrib-array-divisor :vertex-attrib-integer 1 :max-vertex-attribs)
    (:vertex-attrib-array-pointer :vertex-attrib-pointer 1 :max-vertex-attribs)
    (:edge-flag-array :enable 1)
    (:edge-flag-array-stride :integer 1)
    (:edge-flag-array-pointer :pointer 1)
    ;; 6.12
    (:vertex-array-buffer-binding :integer 1)
    (:normal-array-buffer-binding :integer 1)
    (:color-array-buffer-binding :integer 1)
    (:index-array-buffer-binding :integer 1)
    (:texture-coord-array-buffer-binding :integer 1)
    (:edge-flag-array-buffer-binding :integer 1)
    (:secondary-color-array-buffer-binding :integer 1)
    (:fog-coordinate-array-buffer-binding :integer 1)
    (:element-array-buffer-binding :integer 1)
    (:vertex-attrib-array-buffer-binding :vertex-attrib-integer 1)
    ;; 6.13
    (:client-active-texture :enum 1)
    (:array-buffer-binding :integer 1)
    (:draw-indirect-buffer-binding :integer 1)
    (:vertex-array-binding :integer 1)
    (:primitive-restart :enable 1)
    (:primitive-restart-index :integer 1)
    ;; 6.14
    ;; 6.15
    (:color-matrix :float 16)
    (:transpose-color-matrix :float 16)
    (:modelview-matrix :float 16)
    (:transpose-modelview-matrix :float 16)
    (:projection-matrix :float 16)
    (:transpose-projection-matrix :float 16)
    (:texture-matrix :float 16)
    (:transpose-texture-matrix :float 16)
    (:viewport :float/i 4 :max-viewports)
    (:depth-range :float/i 2 :max-viewports)
    (:color-matrix-stack-depth :integer 1)
    (:modelview-stack-depth :integer 1)
    (:projection-stack-depth :integer 1)
    (:texture-stack-depth :integer 1)
    (:matrix-mode :enum 1)
    (:normalize :enable 1)
    (:rescale-normal :enable 1)
    (:clip-plane :clip-plane-i 4 :max-clip-planes)
    (:clip-plane0 :clip-plane 4)
    (:clip-plane1 :clip-plane 4)
    (:clip-plane2 :clip-plane 4)
    (:clip-plane3 :clip-plane 4)
    (:clip-plane4 :clip-plane 4)
    (:clip-plane5 :clip-plane 4)
    (:clip-distance :clip-distance-i 1 :max-clip-distances)
    (:clip-distance0 :enable 1)
    (:clip-distance1 :enable 1)
    (:clip-distance2 :enable 1)
    (:clip-distance3 :enable 1)
    (:clip-distance4 :enable 1)
    (:clip-distance5 :enable 1)
    (:clip-distance6 :enable 1)
    (:clip-distance7 :enable 1)
    (:depth-clamp :enable 1)
    (:transform-feedback-binding :integer 1)
    ;; 6.16
    (:fog-color :float 4)
    (:fog-index :float 1)
    (:fog-density :float 1)
    (:fog-start :float 1)
    (:fog-end :float 1)
    (:fog-mode :enum 1)
    (:fog :enable 1)
    (:fog-coordinate-source :enum 1)
    (:color-sum :enable 1)
    (:shade-model :enum 1)
    (:clamp-vertex-color :enum 1)
    (:clamp-fragment-color :enum 1)
    (:clamp-read-color :enum 1)
    (:provoking-vertex :enum 1)
    ;; 6.17
    (:lighting :enable 1)
    (:color-material :enable 1)
    (:color-material-parameter :enum 1)
    (:color-material-face :enum 1)
    ;; :ambient, :diffuse, etc. getMaterialfv need param
    (:light-model-ambient :float 4)
    (:light-model-local-viewer :boolean 1)
    (:light-model-two-side :boolean 1)
    (:light-model-color-control :enum 1)
    ;; 6.18
    ;; :ambient, :diffuse, etc. getLightfv need param (and conflict
    ;; with getMaterialfv)
    (:light :light-enable-i 1 :max-lights)
    (:light0 :enable 1)
    (:light1 :enable 1)
    (:light2 :enable 1)
    (:light3 :enable 1)
    (:light4 :enable 1)
    (:light5 :enable 1)
    (:light6 :enable 1)
    (:light7 :enable 1)
    ;; :color-indexes from getMaterialfv needs extra arg
    ;; 6.19
    (:rasterizer-discard :enable 1)
    (:point-size :float 1)
    (:point-smooth :enable 1)
    (:point-sprite :enable 1)
    (:point-size-min :float 1)
    (:point-size-max :float 1)
    (:point-fade-threshold-size :float 1)
    (:point-distance-attenuation :float 3)
    (:point-sprite-coord-origin :enum 1)
    (:line-width :float 1)
    (:line-smooth :enable 1)
    (:line-stipple-pattern :integer 1)
    (:line-stipple-repeat :integer 1)
    (:line-stipple :enable 1)
    ;; 6.20
    (:cull-face :enable 1)
    (:cull-face-mode :enum 1)
    (:front-face :enum 1)
    (:polygon-smooth :enable 1)
    (:polygon-mode :enum 2)
    (:polygon-offset-factor :float 1)
    (:polygon-offset-units :float 1)
    (:polygon-offset-point :enable 1)
    (:polygon-offset-line :enable 1)
    (:polygon-offset-fill :enable 1)
    (:polygon-stipple :enable 1)
    ;; 6.21
    (:multisample :enable 1)
    (:sample-alpha-to-coverage :enable 1)
    (:sample-alpha-to-one :enable 1)
    (:sample-coverage :enable 1)
    (:sample-coverage-value :float 1)
    (:sample-coverage-invert :boolean 1)
    (:sample-shading :enable 1)
    (:min-sample-shading-value :float 1)
    (:sample-mask :enable 1)
    (:sample-mask-value :integer-i 1 :max-sample-mask-words)
    ;; 6.22
    (:texture-1d :enable 1)
    (:texture-2d :enable 1)
    (:texture-3d :enable 1)
    (:texture-cube-map :enable 1)
    (:texture-binding-1d :integer 1)
    (:texture-binding-2d :integer 1)
    (:texture-binding-3d :integer 1)
    (:texture-binding-1d-array :integer 1)
    (:texture-binding-2d-array :integer 1)
    (:texture-binding-cube-map-array :integer 1)
    (:texture-binding-rectangle :integer 1)
    (:texture-binding-buffer :integer 1)
    (:texture-binding-cube-map :integer 1)
    (:texture-binding-2d-multisample :integer 1)
    (:texture-binding-2d-multisample-array :integer 1)
    ;; 6.23
    (:sampler-binding :integer 1)
    ;; get-tex-image stuff needs extra args
    ;; 6.24
    ;; get-tex-parameter stuff needs extra args
    ;; 6.25
    ;; get-tex-level-parameter stuff needs extra args
    ;; 6.26
    ;; get-sampler-parameter stuff needs extra args
    ;; 6.27
    (:active-texture :enum 1)
    ;; get-tex-env stuff needs extra args
    (:texture-gen-q :enable 1)
    (:texture-gen-r :enable 1)
    (:texture-gen-s :enable 1)
    (:texture-gen-t :enable 1)
    ;; get-tex-gen stuff needs extra args
    ;; 6.28
    ;; get-tex-env needs extra args
    ;; 6.29
    (:scissor-test :enable/i 1 :max-viewports)
    (:scissor-box :integer/i 4 :max-viewports)
    (:alpha-test :enable 1)
    (:alpha-test-func :enum 1)
    (:alpha-test-ref :integer 1)
    (:stencil-test :enable 1)
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
    (:depth-test :enable 1)
    (:depth-func :enum 1)
    ;; 6.30
    (:blend :enable/i 1 :max-draw-buffers)
    ;; ? (:blend-src :enum 1)
    (:blend-src-rgb :enum/i 1 :max-draw-buffers)
    (:blend-src-alpha :enum/i 1 :max-draw-buffers)
    ;; ? (:blend-dst :enum 1)
    (:blend-dst-rgb :enum/i 1 :max-draw-buffers)
    (:blend-dst-alpha :enum/i 1 :max-draw-buffers)
    (:blend-equation-rgb :enum/i 1 :max-draw-buffers)
    (:blend-equation-alpha :enum/i 1 :max-draw-buffers)
    (:blend-color :float 4)
    (:framebuffer-srgb :enable 1)
    (:dither :enable 1)
    (:index-logic-op :enable 1)
    (:color-logic-op :enable 1)
    (:logic-op-mode :enum 1)
    ;; 6.31
    (:index-writemask :integer 1)
    (:color-writemask :boolean/i 4 :max-draw-buffers)
    (:depth-writemask :boolean 1)
    (:stencil-writemask :integer 1)
    (:stencil-back-writemask :integer 1)
    (:color-clear-value :float 4)
    (:index-clear-value :float 1) ;;integer?
    (:depth-clear-value :float 1)
    (:stencil-clear-value :integer 1)
    (:accum-clear-value :float 4)
    ;; 6.32
    (:draw-framebuffer-binding :integer 1)
    (:read-framebuffer-binding :integer 1)
    ;; 6.33
    (:draw-buffer   :draw-buffer/i 1 :max-draw-buffers)
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
    ;; 6.34
    ;; get-framebuffer-attachment-parameter-iv need extra args
    ;; 6.35
    (:renderbuffer-binding :integer 1)
    ;; 6.36
    ;; get-renderbuffer-parameter-iv need extra args
    ;; 6.37
    (:unpack-swap-bytes :boolean 1)
    (:unpack-lsb-first :boolean 1)
    (:unpack-image-height :integer 1)
    (:unpack-skip-images :integer 1)
    (:unpack-row-length :integer 1)
    (:unpack-skip-rows :integer 1)
    (:unpack-skip-pixels :integer 1)
    (:unpack-alignment :integer 1)
    (:unpack-compressed-block-width :integer 1)
    (:unpack-compressed-block-height :integer 1)
    (:unpack-compressed-block-depth :integer 1)
    (:unpack-compressed-block-size :integer 1)
    (:pixel-unpack-buffer-binding :integer 1)
    ;; 6.38
    (:pack-swap-bytes :boolean 1)
    (:pack-lsb-first :boolean 1)
    (:pack-image-height :integer 1)
    (:pack-skip-images :integer 1)
    (:pack-row-length :integer 1)
    (:pack-skip-rows :integer 1)
    (:pack-skip-pixels :integer 1)
    (:pack-alignment :integer 1)
    (:pack-compressed-block-width :integer 1)
    (:pack-compressed-block-height :integer 1)
    (:pack-compressed-block-depth :integer 1)
    (:pack-compressed-block-size :integer 1)
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
    ;; 6.39
    (:color-table :enable 1)
    (:post-convolution-color-table :enable 1)
    (:post-color-matrix-color-table :enable 1)
    ;; get-color-table, get-color-table-parameter ...
    ;; 6.40
    (:convolution-1d :enable 1)
    (:convolution-2d :enable 1)
    (:separable-2d :enable 1)
    ;; 6.41
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
    (:histogram :enable 1)
    ;; 6.42
    (:minmax :enable 1)
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
    ;; 6.43
    (:map1-vertex-3 :enable 1)
    (:map1-vertex-4 :enable 1)
    (:map1-index :enable 1)
    (:map1-color-4 :enable 1)
    (:map1-normal :enable 1)
    (:map1-texture-coord-1 :enable 1)
    (:map1-texture-coord-2 :enable 1)
    (:map1-texture-coord-3 :enable 1)
    (:map1-texture-coord-4 :enable 1)
    (:map2-vertex-3 :enable 1)
    (:map2-vertex-4 :enable 1)
    (:map2-index :enable 1)
    (:map2-color-4 :enable 1)
    (:map2-normal :enable 1)
    (:map2-texture-coord-1 :enable 1)
    (:map2-texture-coord-2 :enable 1)
    (:map2-texture-coord-3 :enable 1)
    (:map2-texture-coord-4 :enable 1)
    (:map1-grid-domain :float 2)
    (:map2-grid-domain :float 4)
    (:map1-grid-segments :float 1)
    (:map2-grid-segments :float 2)
    (:auto-normal :enable 1)
    ;; 6.44
    ;; get-shader-iv, get-shader-info-log, get-shader-source, need extra args
    ;; 6.45
    ;; get-program-pipeline-iv get-program-pipeline-info-log need extra args
    ;; 6,46
    (:current-program :integer 1)
    (:program-pipeline-binding :integer 1)
    ;; get-program-iv etc need extra args
    ;; 6.47
    ;; 6.48
    ;; 6.49
    (:uniform-buffer-binding :integer/i 1 :max-uniform-buffer-bindings)
    (:uniform-buffer-start :integer64-i 1 :max-uniform-buffer-bindings)
    (:uniform-buffer-size :integer64-i 1 :max-uniform-buffer-bindings)
    ;; get-program, get-active-uniforms, get-active-uniform-block
    ;; 6.50
    ;; 6.51
    ;; 6.52
    ;; get-program-stage, get-active-subroutine-uniform,
    ;; get-active-subroutine-name,
    ;; 6.53
    ;; get-active-atomic-counter-buffer-bindings, ...
    ;; 6.54
    (:vertex-program-two-side :enable 1)
    (:current-vertex-attrib :vertex-attrib-float 4 :max-vertex-attribs)
    (:program-point-size :enable 1)
    ;; 6.55
    ;; get-query-object
    ;; 6.56
    (:image-binding-name :integer-i 1 :max-image-units)
    (:image-binding-level :integer-i 1 :max-image-units)
    (:image-binding-layered :boolean-i 1 :max-image-units)
    (:image-binding-layer :integer-i 1 :max-image-units)
    (:image-binding-access :enum-i 1 :max-image-units)
    (:image-binding-format :enum-i 1 :max-image-units)
    ;; 6.57
    (:transform-feedback-buffer-binding :integer/i 1 :max-transform-feedback-buffers)
    (:transform-feedback-buffer-start :integer64-i 1 :max-transform-feedback-buffers)
    (:transform-feedback-buffer-size :integer64-i 1 :max-transform-feedback-buffers)
    (:transform-feedback-buffer-paused :boolean 1)
    (:transform-feedback-buffer-active :boolean 1)
    ;; 6.58
    (:atomic-counter-buffer-binding :integer/i 1 :max-atomic-counter-buffer-bindings)
    (:atomic-counter-buffer-start :integer64-i 1 :max-atomic-counter-buffer-bindings)
    (:atomic-counter-buffer-size :integer64-i 1 :max-atomic-counter-buffer-bindings)
    ;; 6.59
    ;; get-sync
    ;; 6.60
    (:perspective-correction-hint :enum 1)
    (:point-smooth-hint :enum 1)
    (:line-smooth-hint :enum 1)
    (:polygon-smooth-hint :enum 1)
    (:fog-hint :enum 1)
    (:generate-mipmap-hint :enum 1)
    (:texture-compression-hint :enum 1)
    (:fragment-shader-derivative-hint :enum 1)
    ;; 6.61
    (:max-lights :integer 1)
    (:max-clip-distances :integer 1)
    (:max-cull-distances :integer 1)
    (:max-combined-clip-and-cull-distances :integer 1)
    (:max-clip-planes :integer 1)
    (:max-color-matrix-stack-depth :integer 1)
    (:max-modelview-stack-depth :integer 1)
    (:max-projection-stack-depth :integer 1)
    (:max-texture-stack-depth :integer 1)
    (:subpixel-bits :integer 1)
    (:primitive-restart-for-patches-supported :boolean 1)
    (:max-3d-texture-size :integer 1)
    (:max-texture-size :integer 1)
    (:max-array-texture-layers :integer 1)
    (:max-texture-lod-bias :float 1)
    (:max-cube-map-texture-size :integer 1)
    (:max-renderbuffer-size :integer 1)
    ;; 6.62
    (:max-pixel-map-table :integer 1)
    (:max-name-stack-depth :integer 1)
    (:max-list-nesting :integer 1)
    (:max-eval-order :integer 1)
    (:max-viewport-dims :float 2)
    (:max-viewports :integer 1)
    (:viewport-subpixel-bits :integer 1)
    (:viewport-bounds-range :float 2)
    (:layer-provoking-vertex :enum 1)
    (:viewport-index-provoking-vertex :enum 1)
    (:max-attrib-stack-depth :integer 1)
    (:max-client-attrib-stack-depth :integer 1)
    (:aliased-point-size-range :float 2)
    (:point-size-range :float 2)
    (:point-size-granularity :float 1)
    ;; ?
    (:smooth-point-size-range :float 2) ;?
    (:smooth-point-size-granularity :float 1)
    (:line-width-range :float 2)
    (:line-width-granularity :float 1)
    ;; 6.63
    (:aliased-line-width-range :float 2)
    (:smooth-line-width-range :float 2)
    (:smooth-line-width-granularity :float 1)
    ;; get-convolution-parameter
    (:max-elements-indices :integer 1)
    (:max-elements-vertices :integer 1)
    (:max-vertex-attrib-relative-offset :integer 1)
    (:max-vertex-attrib-bindings :integer 1)
    (:max-vertex-attrib-stride :integer 1)
    (:compressed-texture-formats :enum :num-compressed-texture-formats)
    (:num-compressed-texture-formats :integer 1)
    (:max-texture-buffer-size :integer 1)
    (:max-rectangle-texture-size :integer 1)
    (:program-binary-formats :enum :num-program-binary-formats)
    (:num-program-binary-formats :integer 1)
    (:shader-binary-formats :enum :num-shader-binary-formats)
    (:num-shader-binary-formats :integer 1)
    (:shader-compiler :boolean 1)
    (:min-map-buffer-alignment :integer 1)
    (:texture-buffer-offset-alignment :integer 1)
    ;; 6.64
    (:extensions :extensions/i 1 :num-extensions)
    (:num-extensions :integer 1)
    (:major-version :integer 1)
    (:minor-version :integer 1)
    (:context-flags :integer 1)
    (:renderer :string 1)
    (:shading-language-version :string 1)
    (:num-shading-language-versions :integer 1)
    (:vendor :string 1)
    (:version :string 1)
    ;; ?
    (:max-texture-units :integer 1)
    ;; 6.65
    (:max-vertex-attribs :integer 1)
    (:max-vertex-uniform-components :integer 1)
    (:max-vertex-uniform-vectors :integer 1)
    (:max-vertex-uniform-blocks :integer 1)
    (:max-vertex-output-components :integer 1)
    (:max-vertex-texture-image-units :integer 1)
    (:max-vertex-atomic-counter-buffers :integer 1)
    (:max-vertex-atomic-counters :integer 1)
    (:max-vertex-shader-storage-blocks :integer 1)
    ;; 6.66
    (:max-tess-gen-level :integer 1)
    (:max-patch-vertices :integer 1)
    (:max-tess-control-uniform-components :integer 1)
    (:max-tess-evaluation-uniform-components :integer 1)
    (:max-tess-control-texture-image-units :integer 1)
    (:max-tess-evaluation-texture-image-units :integer 1)
    (:max-tess-control-output-components :integer 1)
    (:max-tess-patch-components :integer 1)
    (:max-tess-control-total-output-components :integer 1)
    (:max-tess-evaluation-output-components :integer 1)
    (:max-tess-control-input-components :integer 1)
    (:max-tess-evaluation-input-components :integer 1)
    (:max-tess-control-uniform-blocks :integer 1)
    (:max-tess-evaluation-uniform-blocks :integer 1)
    (:max-tess-control-atomic-counter-buffers :integer 1)
    (:max-tess-evaluation-atomic-counter-buffers :integer 1)
    (:max-tess-control-atomic-counters :integer 1)
    (:max-tess-evaluation-atomic-counters :integer 1)
    (:max-tess-control-shader-storage-blocks :integer 1)
    (:max-tess-evaluation-shader-storage-blocks :integer 1)
    ;; 6.67
    (:max-geometry-uniform-components :integer 1)
    (:max-geometry-uniform-blocks :integer 1)
    (:max-geometry-input-components :integer 1)
    (:max-geometry-output-components :integer 1)
    (:max-geometry-output-vertices :integer 1)
    (:max-geometry-total-output-components :integer 1)
    (:max-geometry-texture-image-units :integer 1)
    (:max-geometry-shader-invocations :integer 1)
    (:max-vertex-streams :integer 1)
    (:max-geometry-atomic-counter-buffers :integer 1)
    (:max-geometry-atomic-counters :integer 1)
    (:max-geometry-shader-storage-blocks :integer 1)
    ;; 6.68
    (:max-fragment-uniform-components :integer 1)
    (:max-fragment-uniform-vectors :integer 1)
    (:max-fragment-uniform-blocks :integer 1)
    (:max-fragment-input-components :integer 1)
    (:max-texture-image-units :integer 1)
    (:min-program-texture-gather-offset :integer 1)
    (:max-program-texture-gather-offset :integer 1)
    (:max-texture-units :integer 1)
    (:max-texture-coords :integer 1)
    (:max-fragment-atomic-counter-buffers :integer 1)
    (:max-fragment-atomic-counters :integer 1)
    (:max-fragment-shader-storage-blocks :integer 1)
    ;; 6.69
    (:min-program-texel-offset :integer 1)
    (:max-program-texel-offset :integer 1)
    (:max-uniform-buffer-bindings :integer 1)
    (:max-uniform-block-size :integer 1)
    (:uniform-buffer-offset-alignment :integer 1)
    (:max-combined-uniform-blocks :integer 1)
    (:max-varying-components :integer 1)
    (:max-varying-vectors :integer 1)
    (:max-combined-texture-image-units :integer 1)
    (:max-subroutines :integer 1)
    (:max-subroutine-uniform-locations :integer 1)
    (:max-uniform-locations :integer 1)
    (:max-atomic-counter-buffer-bindings :integer 1)
    (:max-atomic-counter-buffer-size :integer 1)
    (:max-combined-atomic-counter-buffers :integer 1)
    (:max-combined-atomic-counters :integer 1)
    (:max-shader-storage-buffer-bindings :integer 1)
    (:max-shader-storage-block-size :integer64 1)
    (:max-combined-shader-storage-blocks :integer 1)
    (:shader-storage-buffer-offset-alignment :integer 1)
    ;; 6.70
    (:max-image-units :integer 1)
    (:max-combined-shader-output-resources :integer 1)
    (:max-combined-image-units-and-fragment-outputs :integer 1)
    (:max-image-samples :integer 1)
    (:max-vertex-image-uniforms :integer 1)
    (:max-tess-control-image-uniforms :integer 1)
    (:max-tess-evaluation-image-uniforms :integer 1)
    (:max-geometry-image-uniforms :integer 1)
    (:max-fragment-image-uniforms :integer 1)
    (:max-combined-image-uniforms :integer 1)
    (:max-combined-vertex-uniform-components :integer 1)
    (:max-combined-geometry-uniform-components :integer 1)
    (:max-combined-tess-control-uniform-components :integer 1)
    (:max-combined-tess-evaluation-uniform-components :integer 1)
    (:max-combined-fragment-uniform-components :integer 1)
    ;; 6.71
    (:max-sample-mask-words :integer 1)
    (:max-samples :integer 1)
    (:max-color-texture-samples :integer 1)
    (:max-depth-texture-samples :integer 1)
    (:max-integer-samples :integer 1)
    (:quads-follow-provoking-vertex-convention :boolean 1)
    ;; (:query-counter-bits :... 1) ;; %gl:get-query-iv
    (:max-server-wait-timeout :integer64 1)
    (:min-fragment-interpolation-offset :float 1)
    (:max-fragment-interpolation-offset :float 1)
    (:fragment-interpolation-offset-bits :integer 1)
    ;; 6.72
    ;; get-internal-format-iv
    ;; 6.73
    (:max-transform-feedback-interleaved-components :integer 1)
    (:max-transform-feedback-separate-attribs :integer 1)
    (:max-transform-feedback-separate-components :integer 1)
    (:max-transform-feedback-buffers :integer 1)
    ;; 6.74
    (:aux-buffers :integer 1)
    (:max-draw-buffers :integer 1)
    (:max-dual-source-draw-buffers :integer 1)
    (:rgba-mode :boolean 1)
    (:index-mode :boolean 1)
    (:doublebuffer :boolean 1)
    (:stereo :boolean 1)
    (:sample-buffers :integer 1)
    (:samples :integer 1)
    (:sample-position :multisample-i 2 :samples)
    (:max-color-attachments :integer 1)
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
    (:implementation-color-read-type :enum 1)
    (:implementation-color-read-format :enum 1)
    ;; 6.75
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
    ;; getQueryiv
    (:copy-read-buffer :integer 1)
    (:copy-write-buffer :integer 1)
    (:texture-cube-map-seamless :enable 1)
    ;; #15 ARB_vertex_blend has state, but is ancient, skipping for now...
    ;; #26 ARB_vertex_program, also ancient...
    ;; #39 ARB_color_buffer_float
    (:rgba-float-mode-arb :boolean 1)
    ;; #51 ARB_texture_buffer_object core in 3.1
    (:texture-buffer-data-store-binding-arb :integer 1) ;; uses get-tex-level-parameter in core version
    (:texture-buffer-format-arb :enum 1)
    (:texture-buffer-arb :integer 1)
    ;; #104 ARB_debug_output
    ;; (probably requires a debug context to get support for extension)
    (:debug-callback-function-arb :pointer 1)
    (:debug-callback-user-param-arb :pointer 1)
    (:debug-logged-messages-arb :integer 1)
    (:debug-next-logged-message-length-arb :integer 1)
    (:debug-output-synchronous-arb :enable 1)
    (:max-debug-message-length-arb :integer 1)
    (:max-debug-logged-messages-arb :integer 1)
    ;; #105 ARB_robustness
    (:reset-notification-strategy-arb :enum 1)
    ;; 4.3 - table 23.61 / 4.5 - table 23.74
    (:max-compute-work-group-count :integer-i 3)
    (:max-compute-work-group-size :integer-i 3)
    (:max-compute-work-group-invocations :integer 1) ;; not in .spec files?
    (:max-compute-local-invocations :integer 1) ;; not documented?
    (:max-compute-uniform-blocks :integer 1)
    (:max-compute-texture-image-units :integer 1)
    (:max-compute-atomic-counter-buffers :integer 1)
    (:max-compute-atomic-counters :integer 1)
    (:max-compute-shared-memory-size :integer 1)
    (:max-compute-uniform-components :integer 1)
    (:max-compute-image-uniforms :integer 1)
    (:max-combined-compute-uniform-components :integer 1)
    (:max-compute-shader-storage-blocks :integer 1)
    ;; 4.5 - table 23.80
    (:max-debug-message-length :integer 1)
    (:max-debug-logged-messages :integer 1)
    (:max-debug-group-stack-depth :integer 1)
    (:max-label-length :integer 1)
    ;; 4.5 - table 23.81
    (:max-framebuffer-width :integer 1)
    (:max-framebuffer-height :integer 1)
    (:max-framebuffer-layers :integer 1)
    (:max-framebuffer-samples :integer 1)
    ;; (:query-counter-bits :query ?) getQueryiv
    ;;
    (:timestamp :integer64 1)
    ;; ARB_sparse_texture
    (:max-sparse-texture-size-arb :integer 1)
    (:max-sparse-3d-texture-size-arb :integer 1)
    (:max-sparse-array-texture-layers-arb :integer 1)
    (:sparse-texture-full-array-cube-mipmaps-arb :boolean 1)
    ;; ext_texture_filter_anisotropic / GL 4.6
    (:max-texture-max-anisotropy-ext :float 1)
    (:max-texture-max-anisotropy :float 1)))

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
(define-query-function get-integer-64 %gl:get-integer-64-v %gl:int64)
(define-query-function get-float %gl:get-float-v %gl:float single-float)
(define-query-function get-double %gl:get-double-v %gl:double double-float)
(define-query-function get-pointer %gl:get-pointer-v :pointer)

;;; Define an indexed query function NAME that calls the OpenGL
;;; function FN, passing an array of foreign type TYPE.  The elements
;;; of the foreign array are converted back to Lisp values by first
;;; dereferencing the buffer.
(defmacro define-indexed-query-function (name fn type &optional (lisp-type t))
  `(defun ,name (value index &optional (count (query-enum-size value)))
     (declare (fixnum count))
     (with-foreign-object (buf ',type count)
       (,fn value index buf)
       (if (> count 1)
           (let ((result (make-array count :element-type ',lisp-type)))
             (dotimes (i count)
               (setf (aref result i) (mem-aref buf ',type i)))
             result)
           (mem-ref buf ',type)))))

;;; Define query functions for the basic types.
;;; fixme: should these be named get-*-indexed instead of get-*-i?
(define-indexed-query-function get-boolean-i %gl:get-boolean-i-v %gl:boolean)
(define-indexed-query-function get-integer-i %gl:get-integer-i-v %gl:int)
(define-indexed-query-function get-integer-64-i %gl:get-integer-64-i-v %gl:int64)
(define-indexed-query-function get-float-i %gl:get-float-i-v %gl:float single-float)
(define-indexed-query-function get-double-i %gl:get-double-i-v %gl:double double-float)

(defmacro define-vertex-attrib-query-function (name fn type &optional (lisp-type t))
  `(defun ,name (index pname &optional (count (query-enum-size pname)))
     (declare (fixnum count))
     (with-foreign-object (buf ',type count)
       (,fn index pname buf)
       (if (> count 1)
           (let ((result (make-array count :element-type ',lisp-type)))
             (dotimes (i count)
               (setf (aref result i) (mem-aref buf ',type i)))
             result)
           (mem-ref buf ',type)))))

(define-vertex-attrib-query-function get-vertex-attrib-boolean
    %gl:get-vertex-attrib-iv %gl:boolean)
(define-vertex-attrib-query-function get-vertex-attrib-integer
    %gl:get-vertex-attrib-iv %gl:int)
(define-vertex-attrib-query-function get-vertex-attrib-float
    %gl:get-vertex-attrib-fv %gl:float single-float)
(define-vertex-attrib-query-function get-vertex-attrib-pointer
    %gl:get-vertex-attrib-pointer-v :pointer)

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

(defun get-enum-i (value index &optional (count (query-enum-size value)))
  (let ((result (get-integer-i value index count)))
    (if (vectorp result)
        (map 'vector #'try-to-parse-enum result)
        (try-to-parse-enum result))))

(defun get-vertex-attrib-enum (index pname
                               &optional (count (query-enum-size pname)))
  (let ((result (get-vertex-attrib-integer index pname count)))
    (if (vectorp result)
        (map 'vector #'try-to-parse-enum result)
        (try-to-parse-enum result))))


(import-export %gl:get-string)
(import-export %gl:get-string-i)

(defun get-clip-plane (plane)
  (with-foreign-object (buf '%gl:double 4)
    (%gl:get-clip-plane plane buf)
    (let ((result (make-array 4 :element-type 'double-float)))
      (dotimes (i 4)
        (setf (aref result i) (mem-aref buf '%gl:double i)))
      result)))

(defun get-multisample (pname index)
  (with-foreign-object (buf '%gl:float 2)
    (%gl:get-multisample-fv pname index buf)
    (let ((result (make-array 2 :element-type 'single-float)))
      (dotimes (i 2)
        (setf (aref result i) (mem-aref buf '%gl:float i)))
      result)))

(defun get-internal-format (target format pname)
  ;; just always using 64bit query for now
  (flet ((get1 (pn)
           (cffi:with-foreign-object (p '%gl:int64)
             (%gl:get-internal-format-i64v target format pn 8 p)
             (cffi:mem-ref p '%gl:int64))))
    (ecase pname
      ;; int
      ((:num-sample-counts
        :internalformat-red-size :internalformat-green-size
        :internalformat-blue-size :internalformat-alpha-size
        :internalformat-depth-size :internalformat-stencil-size
        :internalformat-shared-size
        :max-width :max-height :max-layers
        :max-combined-dimensions ;; 64bit
        :image-texel-size :texture-compressed-block-width
        :texture-compressed-block-height
        :texture-compressed-block-size
        :num-virtual-page-sizes-arb)
       (get1 pname))
      ;; counted
      ((:samples)
       (let ((s (get1 :num-sample-counts)))
         (cffi:with-foreign-object (p '%gl:int64 s)
           (%gl:get-internal-format-i64v target format pname (* s 8) p)
           (loop for i below s
                 collect (cffi:mem-aref p '%gl:int64 i)))))
      ((:virtual-page-size-x-arb :virtual-page-size-y-arb
        :virtual-page-size-z-arb)
       (let ((s (get1 :num-virtual-page-sizes-arb)))
         (cffi:with-foreign-object (p '%gl:int64 s)
           (%gl:get-internal-format-i64v target format pname (* s 8) p)
           (loop for i below s
                 collect (cffi:mem-aref p '%gl:int64 i)))))
      ;; enum
      ((:internalformat-preferred :internalformat-red-type
        :internalformat-green-type :internalformat-blue-type
        :internalformat-alpha-type :internalformat-depth-type
        :internalformat-stencil-type :read-pixels-format
        :read-pixels-type :texture-image-format
        :texture-image-type :get-texture-image-format
        :get-texture-image-type :image-compatibility-class
        :image-pixel-format :image-pixel-type
        :image-format-compatibility-type :view-compatibility-class)
       (try-to-parse-enum (get1 pname)))
      ;; enum/generalized boolean
      ;; (ex. :full-support/:caveat-support/:none, none to NIL)
      ((:framebuffer-renderable :framebuffer-renderable-layered
        :framebuffer-blend :read-pixels
        :manual-generate-mipmap :color-encoding
        :srgb-read :srgb-write
        :vertex-texture :tess-control-texture
        :tess-evaluation-texture :geometry-texture
        :fragment-texture :compute-texture
        :texture-shadow :texture-gather
        :texture-gather-shadow :shader-image-load
        :shader-image-store :shader-image-atomic
        :simultaneous-texture-and-depth-test
                                :simultaneous-texture-and-stencil-test
        :simultaneous-texture-and-depth-write
                                :simultaneous-texture-and-stencil-write
        :clear-buffer :texture-view
        :clear-texture :filter)
       (let ((e (try-to-parse-enum (get1 pname))))
         (if (eq e :none)
             nil
             e)))
      ;; boolean
      ((:internalformat-supported
        :color-components :depth-components
        :stencil-components :color-renderable
        :depth-renderable :stencil-renderable
        :mipmap :texture-compressed)
       (let ((e (get1 pname)))
         (ecase e
           (1 t)
           (0 nil)))))))


;;; generic get that handles type and number of values for known enums
;;; fixme: better name?
(defun get* (name &optional (index 0 indexp))
  (destructuring-bind (enum type size &optional max)
      (assoc name *query-enum-sizes*)
    (declare (ignore enum max))
    (when (keywordp size)
      (setf size (get-integer size 1)))
    (when (plusp size)
      (ecase type
        (:boolean (get-boolean name size))
        (:integer (get-integer name size))
        (:integer64 (get-integer-64 name size))
        (:float (get-float name size))
        (:enable (enabledp name))
        (:enum (get-enum name size))
        (:string (get-string name))
        (:pointer (get-pointer name size))
        (:error (get-error))
        (:clip-plane (get-clip-plane name))
        ;; queries that can be used indexed or unindexed
        ;; (indexed version usually needs newer GL version, so
        ;;  don't want to just call the indexed query with 0
        ;;  when no index was provided)
        (:integer/i (if indexp
                        (get-integer-i name index size)
                        (get-integer name size)))
        (:integer64/i (if indexp
                          (get-integer-64-i name index size)
                          (get-integer-64 name size)))
        (:float/i (if indexp
                      (get-float-i name index size)
                      (get-float name size)))
        (:enable/i (if indexp
                       (enabledp-i name index)
                       (enabledp name)))
        (:enum/i (if indexp
                     (get-enum-i name index size)
                     (get-enum name size)))
        (:boolean/i (if indexp
                        (get-boolean-i name index size)
                        (get-boolean name size)))
        (:extensions/i (if indexp
                           (get-string-i name index)
                           (get-string name)))
        (:draw-buffer/i
         (if indexp
             (get-enum (+ (foreign-enum-value '%gl:enum :draw-buffer0) index)
                       size)
             (get-enum name size)))
        ;; queries that require an index (but default to 0)
        (:integer-i (get-integer-i name index size))
        (:integer64-i (get-integer-64-i name index size))
        (:enum-i (get-enum-i name index size))
        (:boolean-i (get-boolean-i name index size))
        (:string-i (get-string-i name index))
        (:multisample-i (get-multisample name index))
        (:vertex-attrib-integer (get-vertex-attrib-integer index name size))
        (:vertex-attrib-enum (get-vertex-attrib-enum index name size))
        (:vertex-attrib-boolean (get-vertex-attrib-boolean index name size))
        (:vertex-attrib-pointer (get-vertex-attrib-pointer index name size))
        (:vertex-attrib-float (get-vertex-attrib-float index name size))

        ;; some fake 'indexed' queries for queries that usually use a set of
        ;; :foo0 .. :fooN enums, which can also be used as :foo0 + N
        (:clip-plane-i
         (get-clip-plane (+ (foreign-enum-value '%gl:enum :clip-plane0)
                            index)))
        (:clip-distance-i
         (enabledp (+ (foreign-enum-value '%gl:enum :clip-distance0) index))
         size)
        (:light-enable-i (enabledp (+ (foreign-enum-value '%gl:enum :light0)
                                      index))
                         size)))))

;;; compiler macro to open code values for enums known at compile time
(define-compiler-macro get* (&whole form name &optional (index 0 indexp))
  (if (and (constantp name) (keywordp name)
           (assoc name *query-enum-sizes*))
      (destructuring-bind (enum type size &optional max)
          (assoc name *query-enum-sizes*)
        (declare (ignore enum max))
        `(let ((size ,(if (keywordp size) `(get-integer ,size 1) size)))
           (declare (ignorable size))
           ;; fixme: get rid of this duplicated code somehow?
           ,(ecase type
              (:boolean `(get-boolean ,name size))
              (:integer `(get-integer ,name size))
              (:integer64 `(get-integer-64 ,name size))
              (:float `(get-float ,name size))
              (:enable `(enabledp ,name))
              (:enum `(get-enum ,name size))
              (:string `(get-string ,name))
              (:pointer `(get-pointer ,name size))
              (:error `(get-error))
              (:clip-plane `(get-clip-plane ,name))
              ;; queries that can be used indexed or unindexed
              ;; (indexed version usually needs newer GL version, so
              ;;  don't want to just call the indexed query with 0
              ;;  when no index was provided)
              (:integer/i (if indexp
                              `(get-integer-i ,name ,index size)
                              `(get-integer ,name size)))
              (:integer64/i (if indexp
                                `(get-integer-64-i ,name ,index size)
                                `(get-integer-64 ,name size)))
              (:float/i (if indexp
                            `(get-float-i ,name ,index size)
                            `(get-float ,name size)))
              (:enable/i (if indexp
                             `(enabledp-i ,name ,index)
                             `(enabledp ,name)))
              (:enum/i (if indexp
                           `(get-enum-i ,name ,index size)
                           `(get-enum ,name size)))
              (:boolean/i (if indexp
                              `(get-boolean-i ,name ,index size)
                              `(get-boolean ,name size)))
              (:extensions/i (if indexp
                                 `(get-string-i ,name ,index)
                                 `(get-string ,name)))
              (:draw-buffer/i
               (if indexp
                   `(get-enum `(+ ,(foreign-enum-value '%gl:enum :draw-buffer0) index)
                              size)
                   `(get-enum ,name size)))
              ;; queries that require an index (but default to 0)
              (:integer-i `(get-integer-i ,name ,index size))
              (:integer64-i `(get-integer-64-i ,name ,index size))
              (:enum-i `(get-enum-i ,name ,index size))
              (:boolean-i `(get-boolean-i ,name ,index size))
              (:string-i `(get-string-i ,name ,index))
              (:multisample-i `(get-multisample ,name ,index))
              (:vertex-attrib-integer `(get-vertex-attrib-integer ,index ,name size))
              (:vertex-attrib-enum `(get-vertex-attrib-enum ,index ,name size))
              (:vertex-attrib-boolean `(get-vertex-attrib-boolean ,index ,name size))
              (:vertex-attrib-pointer `(get-vertex-attrib-pointer ,index ,name size))
              (:vertex-attrib-float `(get-vertex-attrib-float ,index ,name size))

              ;; some fake 'indexed' queries for queries that usually use a set of
              ;; :foo0 .. :fooN enums, which can also be used as :foo0 + N
              (:clip-plane-i
               `(get-clip-plane (+ ,(foreign-enum-value '%gl:enum :clip-plane0)
                                   ,index)))
              (:clip-distance-i
               `(enabledp (+ ,(foreign-enum-value '%gl:enum :clip-distance0)
                             ,index))
               size)
              (:light-enable-i `(enabledp (+ ,(foreign-enum-value '%gl:enum :light0)
                                             ,index))
               size))))
      form))


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
(defun extension-list ()
  (let* ((extension-string (get-string :extensions)))
    (loop for start = nil then (1+ end)
          for end = -1 then (or (position #\space extension-string
                                           :start start)
                                 (length extension-string))
          when (and start (/= start end))
            collect (subseq extension-string start end)
          while (< end (length extension-string)))))

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
    ((:delete-status :compile-status :completion-status-khr)
     ;; Return a boolean for these.
     (plusp (get-shader-aux shader pname :int)))
    (otherwise
     (get-shader-aux shader pname :int))))

(import-export %gl:is-program)

(define-get-function get-program-aux (program pname)
  (%gl:get-program-iv :int int))

(defun get-program (program pname)
  (case pname
    ((:delete-status :link-status :validate-status :completion-status-khr)
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
    (if (zerop info-log-length)
        ""
        (with-foreign-object (info-log '%gl:char info-log-length)
          (%gl:get-shader-info-log shader info-log-length (null-pointer)
                                   info-log)
          (foreign-string-to-lisp info-log)))))

(defun get-program-info-log (program)
  "Returns as a string the entire info log for PROGRAM"
  (let ((info-log-length (get-program program :info-log-length)))
    (if (zerop info-log-length)
        ""
        (with-foreign-object (info-log '%gl:char info-log-length)
          (%gl:get-program-info-log program info-log-length (null-pointer)
                                    info-log)
          (foreign-string-to-lisp info-log)))))

(defun get-shader-source (shader)
  "Returns as a string the entire source of SHADER"
  (let ((source-length (get-shader shader :shader-source-length)))
    (if (zerop source-length)
        ""
        (with-foreign-object (source '%gl:char source-length)
          (%gl:get-shader-source shader source-length (null-pointer) source)
          (foreign-string-to-lisp source)))))

(defun get-program-resource-index (program interface name)
  (cffi:with-foreign-string (s name)
    (let ((i (%gl:get-program-resource-index program interface s)))
      (if (eql i #.(cffi:foreign-enum-value '%gl:enum :invalid-index))
          nil
          i))))

(import-export %gl:shader-storage-block-binding)

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
                         ((eq x :gl-version) `(gl-version))
                         ((eq x :glsl-version) `(glsl-version))
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
