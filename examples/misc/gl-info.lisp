;;; Print some info about the GL implementation and drivers, then exit

(in-package #:cl-glut-examples)

(defclass gl-info-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "gl-info.lisp"
                     :mode '(:double :rgba)))

(defmethod glut:display-window :before ((w gl-info-window))
  ;; todo: check for extensions/versions before some of these...
  (format t "GL version: ~a~%" (gl:get* :version))
  (format t "GLSL version: ~a~%" (gl:get* :shading-language-version))
  (format t "GL vendor: ~a~%" (gl:get* :vendor))
  (format t "GL renderer: ~a~%" (gl:get* :renderer))
  (format t "GL extensions: ~a~%" (gl:get* :extensions))

  (loop for i in '(:max-3d-texture-size
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
                   :max-texture-buffer-size
                   :max-rectangle-texture-size
                   :num-extensions
                   :context-flags
                   :max-texture-units
                   :max-vertex-attribs
                   :max-vertex-uniform-components
                   :max-varying-components
                   :max-combined-texture-image-units
                   :max-vertex-texture-image-units
                   :max-texture-image-units
                   :max-texture-coords
                   :max-fragment-uniform-components
                   :min-program-texel-offset
                   :max-program-texel-offset
                   :aux-buffers
                   :max-draw-buffers
                   :max-color-attachments
                   :max-samples)
     do (format t "~s: ~s~%" i (gl:get* i))))

(defmethod glut:display ((w gl-info-window))
  (glut:destroy-current-window))

(defmethod glut:keyboard ((w gl-info-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun gl-info ()
  (glut:display-window (make-instance 'gl-info-window)))
