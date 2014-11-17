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

    (loop for i in '(:max-clip-planes ;
                     ;; 23.64 implementation dependent values
                     :max-clip-distances
                     :max-cull-distances
                     :max-combined-clip-and-cull-distances
                     :subpixel-bits
                     :max-elements-indices ; :max-elements-index ?
                     :primitive-restart-for-patches-supported
                     :max-3d-texture-size
                     :max-texture-size
                     :max-array-texture-layers
                     :max-texture-lod-bias
                     :max-cube-map-texture-size
                     :max-renderbuffer-size
                     ;; 23.65 ; compat
                     :max-lights
                     :max-color-matrix-stack-depth ;; imaging subset
                     :max-modelview-stack-depth
                     :max-projection-stack-depth
                     :max-texture-stack-depth
                     :max-pixel-map-table
                     :max-name-stack-depth
                     :max-list-nesting
                     :max-eval-order
                     :max-attrib-stack-depth
                     :max-client-attrib-stack-depth
                     :aliased-point-size-range
                     ;; :max-convolution-width ;; imaging subset
                     ;; :max-convolution-height ;; imaging subset
                     ;; 23.66
                     :max-viewport-dims
                     :max-viewports
                     :viewport-subpixel-bits
                     :viewport-bounds-range
                     :layer-provoking-vertex
                     :viewport-index-provoking-vertex
                     :point-size-range
                     :point-size-granularity
                     :aliased-line-width-range
                     :smooth-line-width-range
                     :smooth-line-width-granularity
                     :max-elements-indices
                     :max-elements-vertices
                     ;; 23.67
                     :max-vertex-attrib-relative-offset
                     :max-vertex-attrib-bindings
                     :max-vertex-attrib-stride
                     :num-compressed-texture-formats
                     :compressed-texture-formats
                     :max-texture-buffer-size
                     :max-rectangle-texture-size
                     :num-program-binary-formats
                     :program-binary-formats
                     :num-shader-binary-formats
                     :shader-binary-formats
                     :shader-compiler
                     :min-map-buffer-alignment
                     :texture-buffer-offset-alignment
                     ;; 23.68 implementation dependent version and
                     ;; extension support
                     :major-version
                     :minor-version
                     :context-flags
                     ;; :extensions
                     :num-extensions
                     :renderer
                     :shading-language-version
                     :num-shading-language-versions
                     :vendor
                     :version
                     ;; 23.69 implementation dependent vertex shader limits
                     :max-vertex-attribs
                     :max-vertex-uniform-components
                     :max-vertex-uniform-vectors
                     :max-vertex-uniform-blocks
                     :max-vertex-output-components
                     :max-vertex-texture-image-units
                     :max-vertex-atomic-counter-buffers
                     :max-vertex-atomic-counters
                     :max-vertex-shader-storage-blocks
                     ;; 23.70 implementation dependent tessellation
                     ;; control shader limits
                     :max-tess-gen-level
                     :max-patch-vertices
                     :max-tess-control-uniform-components
                     :max-tess-control-texture-image-units
                     :max-tess-control-output-components
                     :max-tess-patch-components
                     :max-tess-control-total-output-components
                     :max-tess-control-input-components
                     :max-tess-control-uniform-blocks
                     :max-tess-control-atomic-counter-buffers
                     :max-tess-control-atomic-counters
                     :max-tess-control-shader-storage-blocks
                     ;; 23.71 implementation dependent tessellation
                     ;; shader limits
                     :max-tess-evaluation-uniform-components
                     :max-tess-evaluation-texture-image-units
                     :max-tess-evaluation-output-components
                     :max-tess-evaluation-input-components
                     :max-tess-evaluation-uniform-blocks
                     :max-tess-evaluation-atomic-counter-buffers
                     :max-tess-evaluation-atomic-counters
                     :max-tess-evaluation-shader-storage-blocks
                     ;; 23.72 implementation dependent geometry shader
                     ;; limits
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
                     :max-geometry-shader-storage-blocks
                     ;; 23.73 implementation dependent fragment shader
                     ;; limits
                     :max-fragment-uniform-components
                     :max-fragment-uniform-vectors
                     :max-fragment-uniform-blocks
                     :max-fragment-input-components
                     :max-texture-image-units
                     :min-program-texture-gather-offset
                     :max-program-texture-gather-offset
                     :max-texture-units ;; compat
                     :max-texture-coords ;; compat
                     :max-fragment-atomic-counter-buffers
                     :max-fragment-atomic-counters
                     :max-fragment-shader-storage-blocks
                     ;; 23.74 implementation dependent compute shader
                     ;; limits
                     :max-compute-work-group-count
                     :max-compute-work-group-size
                     :max-compute-work-group-invocations
                     :max-compute-uniform-blocks
                     :max-compute-texture-image-units
                     :max-compute-atomic-counter-buffers
                     :max-compute-atomic-counters
                     :max-compute-shared-memory-size
                     :max-compute-uniform-components
                     :max-compute-image-uniforms
                     :max-combined-compute-uniform-components
                     :max-compute-shader-storage-blocks
                     ;; 23.75 implementation dependent aggregate
                     ;; limits
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
                     :max-uniform-locations
                     ;; 23.76
                     :max-atomic-counter-buffer-bindings
                     :max-atomic-counter-buffer-size
                     :max-combined-atomic-counter-buffers
                     :max-combined-atomic-counters
                     :max-shader-storage-buffer-bindings
                     :max-shader-storage-block-size
                     :max-combined-shader-storage-blocks
                     :shader-storage-buffer-offset-alignment
                     ;; 23.77
                     :max-image-units
                     :max-combined-shader-output-resources
                     :max-image-samples
                     :max-vertex-image-uniforms
                     :max-tess-control-image-uniforms
                     :max-tess-evaluation-image-uniforms
                     :max-geometry-image-uniforms
                     :max-fragment-image-uniforms
                     :max-combined-image-uniforms
                     ;; 23.78
                     :max-combined-vertex-uniform-components
                     :max-combined-geometry-uniform-components
                     :max-combined-tess-control-uniform-components
                     :max-combined-tess-evaluation-uniform-components
                     :max-combined-fragment-uniform-components
                     ;; 23.80 implementation dependent debug output
                     ;; state
                     :max-debug-message-length
                     :max-debug-logged-messages
                     :max-debug-group-stack-depth
                     :max-label-length
                     ;; 23.81 implementation dependent values
                     :max-framebuffer-width
                     :max-framebuffer-height
                     :max-framebuffer-layers
                     :max-framebuffer-samples
                     :max-sample-mask-words
                     :max-samples
                     :max-color-texture-samples
                     :max-depth-texture-samples
                     :max-integer-samples
                     :quads-follow-provoking-vertex-convention ;; compat
                     ;; :query-counter-bits
                     :max-server-wait-timeout
                     ;; 23.82
                     :min-fragment-interpolation-offset
                     :max-fragment-interpolation-offset
                     :fragment-interpolation-offset-bits
                     :max-draw-buffers
                     :max-dual-source-draw-buffers
                     :max-color-attachments
                     ;; 23.84 implementation dependent transform
                     ;; feedback limits
                     :max-transform-feedback-interleaved-components
                     :max-transform-feedback-separate-attribs
                     :max-transform-feedback-separate-components
                     :max-transform-feedback-buffers
                     ;; ??
                     :smooth-point-size-range
                     :smooth-point-size-granularity
                     :line-width-range
                     :line-width-granularity
                     :max-combined-image-units-and-fragment-outputs
                     :aux-buffers
                     :implementation-color-read-format)
          do (format t "~s: ~a~%" i (get* i)))
    (let ((slv (ignore-errors (gl:get* :num-shading-language-versions))))
      (when slv
        (format t "shading language versions:~%~{  ~s~%~}"
                (loop for i below slv collect (gl:get-string-i :shading-language-version i)))))
    (format t "max anisotropy: ~s~%" (gl:get-float :max-texture-max-anisotropy-ext 1))
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

