;;; Print some info about the GL implementation and drivers, then exit

(in-package #:cl-glut-examples)

(defclass gl-info-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "gl-info.lisp"
                     :mode '(:double :rgba)))

(defparameter *gl-info-verbose* nil)

(defmethod glut:display-window :before ((w gl-info-window))
  ;; todo: check for extensions/versions before some of these...
  (flet ((get* (x &optional (j 0 jp))
            (multiple-value-bind (r e) (ignore-errors (if jp
                                                          (gl:get* x j)
                                                          (gl:get* x)))
              (or e r))))
    (format t "GL version: ~a~%" (get* :version))
    (format t "GLSL version: ~a~%" (get* :shading-language-version))
    (format t "GL vendor: ~a~%" (get* :vendor))
    (format t "GL renderer: ~a~%" (get* :renderer))
    (format t "GL extensions: ~a~%" (get* :extensions))

    (loop for i in '(:max-clip-planes
                     :max-clip-distances
                     :max-3d-texture-size
                     :max-texture-size
                     :max-array-texture-layers
                     :max-texture-lod-bias
                     :max-cube-map-texture-size
                     :max-renderbuffer-size
                     :max-pixel-map-table
                     :max-name-stack-depth
                     :max-list-nesting
                     :max-eval-order
                     :max-viewport-dims
                     :max-viewports
                     :viewport-subpixel-bits
                     :viewport-bounds-range
                     :max-attrib-stack-depth
                     :max-client-attrib-stack-depth
                     :aliased-point-size-range
                     :point-size-range
                     :point-size-granularity
                     :smooth-point-size-range
                     :smooth-point-size-granularity
                     :aliased-line-width-range
                     :line-width-range
                     :line-width-granularity
                     :smooth-line-width-range
                     :smooth-line-width-granularity
                     :max-elements-indices
                     :max-elements-vertices
                     :compressed-texture-formats
                     :num-compressed-texture-formats
                     :num-program-binary-formats
                     :program-binary-formats
                     :num-shader-binary-formats
                     :shader-binary-formats
                     :shader-compiler
                     :min-map-buffer-alignment
                     :max-texture-buffer-size
                     :max-rectangle-texture-size
                     :num-extensions
                     :context-flags
                     :max-texture-units
                     :max-vertex-attribs
                     :max-vertex-uniform-components
                     :max-vertex-uniform-vectors
                     :max-vertex-uniform-blocks
                     :max-vertex-output-components
                     :max-vertex-texture-image-units
                     :max-vertex-atomic-counter-buffers
                     :max-vertex-atomic-counters
                     :max-tess-gen-level
                     :max-patch-vertices
                     :max-tess-control-uniform-components
                     :max-tess-evaluation-uniform-components
                     :max-tess-control-texture-image-units
                     :max-tess-evaluation-texture-image-units
                     :max-tess-control-output-components
                     :max-tess-patch-components
                     :max-tess-control-total-output-components
                     :max-tess-evaluation-output-components
                     :max-tess-control-input-components
                     :max-tess-evaluation-input-components
                     :max-tess-control-uniform-blocks
                     :max-tess-evaluation-uniform-blocks
                     :max-tess-control-atomic-counter-buffers
                     :max-tess-evaluation-atomic-counter-buffers
                     :max-tess-control-atomic-counters
                     :max-tess-evaluation-atomic-counters
                     :max-geometry-uniform-components
                     :max-geometry-uniform-blocks
                     :max-geometry-input-components
                     :max-geometry-output-components
                     :max-geometry-output-vertices
                     :max-geometry-total-output-components
                     :max-geometry-texture-image-units
                     :max-geometry-shader-invocations
                     :max-vertex-streams
                     :max-geometry-atomic-counter-buffers
                     :max-geometry-atomic-counters
                     :max-fragment-uniform-components
                     :max-fragment-uniform-vectors
                     :max-fragment-uniform-blocks
                     :max-fragment-input-components
                     :max-fragment-atomic-counter-buffers
                     :max-fragment-atomic-counters
                     :min-program-texture-gather-offset
                     :max-program-texture-gather-offset
                     :max-texture-image-units
                     :max-texture-units
                     :max-texture-coords
                     :min-program-texel-offset
                     :max-program-texel-offset
                     :max-uniform-buffer-bindings
                     :max-uniform-block-size
                     :uniform-buffer-offset-alignment
                     :max-combined-uniform-blocks
                     :max-varying-components
                     :max-varying-vectors
                     :max-combined-texture-image-units
                     :max-subroutines
                     :max-subroutine-uniform-locations
                     :max-atomic-counter-buffer-bindings
                     :max-atomic-counter-buffer-size
                     :max-combined-atomic-counter-buffers
                     :max-combined-atomic-counters
                     :max-image-units
                     :max-combined-image-units-and-fragment-outputs
                     :max-image-samples
                     :max-vertex-image-uniforms
                     :max-tess-control-image-uniforms
                     :max-tess-evaluation-image-uniforms
                     :max-geometry-image-uniforms
                     :max-fragment-image-uniforms
                     :max-combined-image-uniforms
                     :max-combined-vertex-uniform-components
                     :max-combined-geometry-uniform-components
                     :max-combined-tess-control-uniform-components
                     :max-combined-tess-evaluation-uniform-components
                     :max-combined-fragment-uniform-components
                     :max-sample-mask-words
                     :max-samples
                     :max-color-texture-samples
                     :max-depth-texture-samples
                     :max-integer-samples
                     :quads-follow-provoking-vertex-convention
                     :max-server-wait-timeout
                     :min-fragment-interpolation-offset
                     :max-fragment-interpolation-offset
                     :fragment-interpolation-offset-bits
                     :max-transform-feedback-interleaved-components
                     :max-transform-feedback-separate-attribs
                     :max-transform-feedback-separate-components
                     :max-transform-feedback-buffers
                     :max-dual-source-draw-buffers
                     :aux-buffers
                     :max-draw-buffers
                     :max-color-attachments
                     :implementation-color-read-format)
          do (format t "~s: ~a~%" i (get* i)))
    (when *gl-info-verbose*
      (format t "----~%")
      (loop for (i nil nil m) in gl::*query-enum-sizes*
            do (format t "~s: ~a~%" i (get* i))
               (when m
                 (loop with max = (get* m)
                       for j below max
                       do (format t "  ~s ~s/~s: ~a~%" i j max (get* i j)))
                 )))))

(defmethod glut:display ((w gl-info-window))
  (glut:destroy-current-window))

(defmethod glut:keyboard ((w gl-info-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun gl-info (&key ((:verbose *gl-info-verbose*) nil))
  (glut:display-window (make-instance 'gl-info-window)))

