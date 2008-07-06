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

;;; Association list mapping enums for known queries to the number of
;;; values returned by the query.  To perform a query that is not
;;; known in this table, the number of return values must be specified
;;; explicitly in the call to GET-*.
(defparameter *query-enum-sizes*
  '((:accum-alpha-bits . 1)
    (:accum-blue-bits . 1)
    (:accum-clear-value . 4)
    (:accum-green-bits . 1)
    (:accum-red-bits . 1)
    (:active-texture . 1)
    (:aliased-point-size-range . 2)
    (:aliased-line-width-range . 2)
    (:alpha-bias . 1)
    (:alpha-bits . 1)
    (:alpha-scale . 1)
    (:alpha-test . 1)
    (:alpha-test-func . 1)
    (:alpha-test-ref . 1)
    (:attrib-stack-depth . 1)
    (:auto-normal . 1)
    (:aux-buffers . 1)
    (:blend . 1)
    (:blend-color . 4)
    (:blend-equation . 1)
    (:blue-bias . 1)
    (:blue-bits . 1)
    (:blue-scale . 1)
    (:client-active-texture . 1)
    (:client-attrib-stack-depth . 1)
    (:clip-plane0 . 1)
    (:clip-plane1 . 1)
    (:clip-plane2 . 1)
    (:clip-plane3 . 1)
    (:clip-plane4 . 1)
    (:clip-plane5 . 1)
    (:color-array . 1)
    (:color-array-size . 1)
    (:color-array-stride . 1)
    (:color-array-type . 1)
    (:color-clear-value . 4)
    (:color-logic-op . 1)
    (:color-material . 1)
    (:color-material-face . 1)
    (:color-material-parameter . 1)
    (:color-matrix . 16)
    (:color-matrix-stack-depth . 1)
    (:color-table . 1)
    (:color-writemask . 4)
    (:compressed-texture . 1)
    (:convolution-1d . 1)
    (:convolution-2d . 1)
    (:cull-face . 1)
    (:cull-face-mode . 1)
    (:current-color . 4)
    (:current-index . 1)
    (:current-normal . 3)
    (:current-raster-color . 4)
    (:current-raster-distance . 1)
    (:current-raster-index . 1)
    (:current-raster-position . 4)
    (:current-raster-position-valid . 1)
    (:current-raster-texture-coords . 4)
    (:current-texture-coords . 4)
    (:depth-bias . 1)
    (:depth-bits . 1)
    (:depth-clear-value . 1)
    (:depth-func . 1)
    (:depth-range . 2)
    (:depth-scale . 1)
    (:depth-test . 1)
    (:depth-writemask . 1)
    (:dither . 1)
    (:doublebuffer . 1)
    (:draw-buffer . 1)
    (:edge-flag . 1)
    (:edge-flag-array . 1)
    (:edge-flag-array-stride . 1)
    (:feedback-buffer-size . 1)
    (:feedback-buffer-type . 1)
    (:fog . 1)
    (:fog-color . 4)
    (:fog-density . 1)
    (:fog-end . 1)
    (:fog-hint . 1)
    (:fog-index . 1)
    (:fog-mode . 1)
    (:fog-start . 1)
    (:front-face . 1)
    (:generate-mipmap-hint . 1)
    (:green-bias . 1)
    (:green-bits . 1)
    (:green-scale . 1)
    (:histogram . 1)
    (:index-array . 1)
    (:index-array-stride . 1)
    (:index-array-type . 1)
    (:index-bits . 1)
    (:index-clear-value . 1)
    (:index-logic-op . 1)
    (:index-mode . 1)
    (:index-offset . 1)
    (:index-shift . 1)
    (:index-writemask . 1)
    (:light0 . 1)
    (:light1 . 1)
    (:light2 . 1)
    (:light3 . 1)
    (:light4 . 1)
    (:light5 . 1)
    (:light6 . 1)
    (:light7 . 1)
    (:lighting . 1)
    (:light-model-ambient . 4)
    (:light-model-color-control . 1)
    (:light-model-local-viewer . 1)
    (:light-model-two-side . 1)
    (:line-smooth . 1)
    (:line-smooth-hint . 1)
    (:line-stipple . 1)
    (:line-stipple-pattern . 1)
    (:line-stipple-repeat . 1)
    (:line-width . 1)
    (:line-width-granularity . 1)
    (:line-width-range . 2)
    (:list-base . 1)
    (:list-index . 1)
    (:list-mode . 1)
    (:logic-op-mode . 1)
    (:map1-color-4 . 1)
    (:map1-grid-domain . 2)
    (:map1-grid-segments . 1)
    (:map1-index . 1)
    (:map1-normal . 1)
    (:map1-texture-coord-1 . 1)
    (:map1-texture-coord-2 . 1)
    (:map1-texture-coord-3 . 1)
    (:map1-texture-coord-4 . 1)
    (:map1-vertex-3 . 1)
    (:map1-vertex-4 . 1)
    (:map2-color-4 . 1)
    (:map2-grid-domain . 4)
    (:map2-grid-segments . 2)
    (:map2-index . 1)
    (:map2-normal . 1)
    (:map2-texture-coord-1 . 1)
    (:map2-texture-coord-2 . 1)
    (:map2-texture-coord-3 . 1)
    (:map2-texture-coord-4 . 1)
    (:map2-vertex-3 . 1)
    (:map2-vertex-4 . 1)
    (:map-color . 1)
    (:map-stencil . 1)
    (:matrix-mode . 1)
    (:max-3d-texture-size . 1)
    (:max-client-attrib-stack-depth . 1)
    (:max-attrib-stack-depth . 1)
    (:max-clip-planes . 1)
    (:max-color-matrix-stack-depth . 1)
    (:max-cube-map-texture-size . 1)
    (:max-elements-indices . 1)
    (:max-elements-vertices . 1)
    (:max-eval-order . 1)
    (:max-lights . 1)
    (:max-list-nesting . 1)
    (:max-modelview-stack-depth . 1)
    (:max-name-stack-depth . 1)
    (:max-pixel-map-table . 1)
    (:max-projection-stack-depth . 1)
    (:max-texture-size . 1)
    (:max-texture-stack-depth . 1)
    (:max-texture-units . 1)
    (:max-viewport-dims . 1)
    (:minmax . 1)
    (:modelview-matrix . 16)
    (:modelview-stack-depth . 1)
    (:name-stack-depth . 1)
    (:normal-array . 1)
    (:normal-array-stride . 1)
    (:normal-array-type . 1)
    (:normalize . 1)
    (:num-compressed-texture-format . 1)
    (:pack-alignment . 1)
    (:pack-image-height . 1)
    (:pack-lsb-first . 1)
    (:pack-row-length . 1)
    (:pack-skip-images . 1)
    (:pack-skip-pixels . 1)
    (:pack-skip-rows . 1)
    (:pack-swap-bytes . 1)
    (:perspective-correction-hint . 1)
    (:pixel-map-a-to-a-size . 1)
    (:pixel-map-b-to-b-size . 1)
    (:pixel-map-g-to-g-size . 1)
    (:pixel-map-i-to-a-size . 1)
    (:pixel-map-i-to-b-size . 1)
    (:pixel-map-i-to-g-size . 1)
    (:pixel-map-i-to-i-size . 1)
    (:pixel-map-i-to-r-size . 1)
    (:pixel-map-r-to-r-size . 1)
    (:pixel-map-s-to-s-size . 1)
    (:point-size . 1)
    (:point-size-granularity . 1)
    (:point-size-range . 2)
    (:point-smooth . 1)
    (:point-smooth-hint . 1)
    (:polygon-mode . 2)
    (:polygon-offset-factor . 1)
    (:polygon-offset-units . 1)
    (:polygon-offset-fill . 1)
    (:polygon-offset-line . 1)
    (:polygon-offset-point . 1)
    (:polygon-smooth . 1)
    (:polygon-smooth-hint . 1)
    (:polygon-stipple . 1)
    (:post-color-matrix-color-table . 1)
    (:post-color-matrix-red-bias . 1)
    (:post-color-matrix-green-bias . 1)
    (:post-color-matrix-blue-bias . 1)
    (:post-color-matrix-alpha-bias . 1)
    (:post-color-matrix-red-scale . 1)
    (:post-color-matrix-green-scale . 1)
    (:post-color-matrix-blue-scale . 1)
    (:post-color-matrix-alpha-scale . 1)
    (:post-convolution-color-table . 1)
    (:post-convolution-red-bias . 1)
    (:post-convolution-green-bias . 1)
    (:post-convolution-blue-bias . 1)
    (:post-convolution-alpha-bias . 1)
    (:post-convolution-red-scale . 1)
    (:post-convolution-green-scale . 1)
    (:post-convolution-blue-scale . 1)
    (:post-convolution-alpha-scale . 1)
    (:projection-matrix . 16)
    (:projection-stack-depth . 1)
    (:read-buffer . 1)
    (:red-bias . 1)
    (:red-bits . 1)
    (:red-scale . 1)
    (:render-mode . 1)
    (:rescale-normal . 1)
    (:rgba-mode . 1)
    (:sample-buffers . 1)
    (:sample-coverage-value . 1)
    (:sample-coverage-invert . 1)
    (:samples . 1)
    (:scissor-box . 4)
    (:scissor-test . 1)
    (:selection-buffer-size . 1)
    (:separable-2d . 1)
    (:shade-model . 1)
    (:smooth-line-width-range . 2)
    (:smooth-line-width-granularity . 1)
    (:smooth-point-size-range . 2)
    (:smooth-point-size-granularity . 1)
    (:stencil-bits . 1)
    (:stencil-clear-value . 1)
    (:stencil-fail . 1)
    (:stencil-func . 1)
    (:stencil-pass-depth-fail . 1)
    (:stencil-pass-depth-pass . 1)
    (:stencil-ref . 1)
    (:stencil-test . 1)
    (:stencil-value-mask . 1)
    (:stencil-writemask . 1)
    (:stereo . 1)
    (:subpixel-bits . 1)
    (:texture-1d . 1)
    (:texture-binding-1d . 1)
    (:texture-2d . 1)
    (:texture-binding-2d . 1)
    (:texture-3d . 1)
    (:texture-binding-3d . 1)
    (:texture-binding-cube-map . 1)
    (:texture-compression-hint . 1)
    (:texture-coord-array . 1)
    (:texture-coord-array-size . 1)
    (:texture-coord-array-stride . 1)
    (:texture-coord-array-type . 1)
    (:texture-cube-map . 1)
    (:texture-gen-q . 1)
    (:texture-gen-r . 1)
    (:texture-gen-s . 1)
    (:texture-gen-t . 1)
    (:texture-matrix . 16)
    (:texture-stack-depth . 1)
    (:transpose-color-matrix . 16)
    (:transpose-modelview-matrix . 16)
    (:transpose-projection-matrix . 16)
    (:transpose-texture-matrix . 16)
    (:unpack-alignment . 1)
    (:unpack-image-height . 1)
    (:unpack-lsb-first . 1)
    (:unpack-row-length . 1)
    (:unpack-skip-images . 1)
    (:unpack-skip-pixels . 1)
    (:unpack-skip-rows . 1)
    (:unpack-swap-bytes . 1)
    (:vertex-array . 1)
    (:vertex-array-size . 1)
    (:vertex-array-stride . 1)
    (:vertex-array-type . 1)
    (:viewport . 4)
    (:zoom-x . 1)
    (:zoom-y . 1)))

;;; Return the default array size for a state query enum.
(defun query-enum-size (value)
  (or (cdr (assoc value *query-enum-sizes*))
      (error "Unknown query enum: ~A" value)))

;;; Define a query function NAME that calls the OpenGL function FN,
;;; passing an array of foreign type TYPE.  The elements of the
;;; foreign array are converted back to Lisp values by first
;;; dereferencing the buffer.
(defmacro define-query-function (name fn type)
  `(defun ,name (value &optional (count (query-enum-size value)))
     (declare (fixnum count))
     (with-foreign-object (buf ',type count)
       (,fn value buf)
       (if (> count 1)
           (let ((result (make-array count)))
             (dotimes (i count)
               (setf (aref result i) (mem-aref buf ',type i)))
             result)
           (mem-ref buf ',type)))))

;;; Define query functions for the basic types.
(define-query-function get-boolean %gl:get-boolean-v %gl:boolean)
(define-query-function get-integer %gl:get-integer-v %gl:int)
(define-query-function get-float %gl:get-float-v %gl:float)
(define-query-function get-double %gl:get-double-v %gl:double)

;;; Wrapper around GET-INTEGER when the result should be interpreted
;;; as an enumerated constant.
(defun get-enum (value &optional (count (query-enum-size value)))
  (let ((result (get-integer value count)))
    (if (vectorp result)
        (map 'vector (lambda (x) (foreign-enum-keyword 'enum x)) result)
        (foreign-enum-keyword 'enum result))))

;;; FIXME: Enable/Disable do not belong here, but I can't find the proper
;;; place to put them. They appear the first time in 2.11.3, but that's
;;; about normal transformations.

;; external
(defun enable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%gl:enable cap)))

;; external
(defun disable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%gl:disable cap)))

;; external
(definline enabledp (cap)
  (%gl:is-enabled cap))

;;; 6.1.11 Pointer and String Queries

;;; FIXME: missing glGetPointer

(import-export %gl:get-string)

;; external
(defun major-version ()
  (multiple-value-bind (num characters-read)
      (parse-integer (get-string :version) :end 1)
    (declare (ignore characters-read))
    num))

;; external
(defun minor-version ()
  (multiple-value-bind (num characters-read)
      (parse-integer (get-string :version) :start 2 :end 3)
    (declare (ignore characters-read))
    num))

;; external
(defun extension-present-p (name)
  (search name (%gl:get-string :extensions)))

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

(defun make-bitfield (enum-name attributes)
  (apply #'logior 0 (mapcar (lambda (x)
                              (foreign-enum-value enum-name x))
                            attributes)))

;; external
(defun push-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%gl:push-attrib (make-bitfield '%gl:enum attributes)))

(define-compiler-macro push-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%gl:push-attrib ,(make-bitfield '%gl:enum attributes))
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
  (%gl:push-client-attrib (make-bitfield '%gl:enum attributes)))

(define-compiler-macro push-client-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%gl:push-client-attrib ,(make-bitfield '%gl:enum attributes))
      form))

(import-export %gl:pop-client-attrib)

(defmacro with-pushed-client-attrib ((&rest attributes) &body body)
  `(progn
     (push-client-attrib ,@attributes)
     (multiple-value-prog1 (progn ,@body)
       (pop-client-attrib))))
