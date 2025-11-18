(in-package #:cl-opengl-examples/core)

(defvar *quad*
  (list (coerce (vector -1.0 2.0 0.0   0.0 1.0  1.0 1.0 1.0 1.0
                        1.0 2.0 0.0    1.0 1.0  1.0 1.0 1.0 1.0
                        1.0 0.0 0.0    1.0 0.0  1.0 1.0 1.0 1.0
                        -1.0 0.0 0.0   0.0 0.0  1.0 1.0 1.0 1.0
                        ;; fake reflection
                        -1.0 0.0 0.0   0.0 0.0  1.0 1.0 1.0 0.7
                        1.0 0.0 0.0    1.0 0.0  1.0 1.0 1.0 0.7
                        1.0 -1.0 0.0   1.0 0.5  1.0 1.0 1.0 0.0
                        -1.0 -1.0 0.0  0.5 1.0  1.0 1.0 1.0 0.0)
                '(simple-array single-float 1))
        (coerce '(0 1 2
                  0 2 3
                  4 5 6
                  4 6 7)
                '(simple-array (unsigned-byte 16) 1))))

(defclass rtt (core-example)
  ((texture :accessor texture)
   (framebuffer :accessor framebuffer)
   (texture-projection :reader texture-projection
                       :initform (perspective 50 1 0.5 20))
   (teapot-rotation-x :accessor teapot-rotation-x :initform 0.0)
   (teapot-rotation-y :accessor teapot-rotation-y :initform 0.0)
   (teapot-rotation-z :accessor teapot-rotation-z :initform 0.0)
   (quad-rotation :accessor quad-rotation :initform 0.0)))

(defmethod resume ((rtt rtt))
  ;; reset any global state assumed by drawing code
  (when (eql (api rtt) :gl)
    (gl:enable :multisample))
  (gl:enable :depth-test)
  (gl:front-face :ccw)
  (gl:bind-texture :texture-2d (texture rtt)))

(defmethod init-gl ((rtt rtt))
  (let ((framebuffer (gl:gen-framebuffer))
        (depthbuffer (gl:gen-renderbuffer))
        (texture (gl:gen-texture)))
    ;; setup framebuffer
    (gl:bind-framebuffer :framebuffer framebuffer)

    ;; setup texture and attach it to the framebuffer
    (gl:bind-texture :texture-2d texture)
    (gl:tex-parameter :texture-2d :texture-min-filter :linear-mipmap-linear)
    (gl:tex-parameter :texture-2d :texture-mag-filter :linear)
    (gl:tex-parameter :texture-2d :texture-max-anisotropy
                      (gl:get-integer :max-texture-max-anisotropy))
    (gl:tex-image-2d :texture-2d 0 :rgba 512 512 0
                     :rgba :unsigned-byte (cffi:null-pointer))
    (gl:generate-mipmap :texture-2d)
    (gl:bind-texture :texture-2d 0)
    (gl:framebuffer-texture-2d :framebuffer
                               :color-attachment0
                               :texture-2d
                               texture
                               0)

    ;; setup depth-buffer and attach it to the framebuffer
    (gl:bind-renderbuffer :renderbuffer depthbuffer)
    (gl:renderbuffer-storage :renderbuffer :depth-component24 512 512)
    (gl:framebuffer-renderbuffer :framebuffer
                                 :depth-attachment
                                 :renderbuffer
                                 depthbuffer)

    ;; validate framebuffer
    (let ((framebuffer-status (gl:check-framebuffer-status :framebuffer)))
      (unless (gl::enum= framebuffer-status :framebuffer-complete)
        (error "Framebuffer not complete: ~A." framebuffer-status)))

    (setf (texture rtt) texture
          (framebuffer rtt) framebuffer))
  (add-program rtt :textured
               :vertex *vertex/tex* :fragment *fragment/tex*
               :verbose t)
  (add-program rtt :lit
               :vertex *vertex/lit* :fragment *fragment/lit*
               :verbose t)
  (add-vao rtt :teapot *teapot* *vertex-format/lit*)
  (add-vao rtt :quad *quad* *vertex-format/tex*)
  (with-program (rtt :lit)
    (gl:uniformf (uniform-location :light0pos) 0 1 1 0)

    (gl:uniform-matrix-4fv (uniform-location :projectionmatrix)
                           (texture-projection rtt)
                           nil)
    (gl:uniform-matrix-4fv (uniform-location :viewmatrix)
                           (sb-cga:identity-matrix)
                           nil)
    ;; gl defaults
    (gl:uniformf (uniform-location :sceneAmbient) 0.2 0.2 0.2)
    (gl:uniformf (uniform-location :light0Ambient) 0.0 0.0 0.0)
    (gl:uniformf (uniform-location :light0Diffuse) 1.0 1.0 1.0)
    (gl:uniformf (uniform-location :light0Specular) 1.0 1.0 1.0)
    (gl:uniformf (uniform-location :light0SpotDirection) 0.0 0.0 1.0)
    (gl:uniformf (uniform-location :light0SpotExponent) 0.0)
    (gl:uniformf (uniform-location :light0SpotCutoff) 180.0)
    (gl:uniformf (uniform-location :light0Attenuation) 1 0 0)
    ;; set light color
    (gl:uniformf (uniform-location :light0Diffuse) 0.2 0.4 0.6))
  (with-program (rtt :textured)
    (setf (view rtt) (sb-cga:identity-matrix))
    (gl:uniformi (uniform-location :tex) 0))
  (resume rtt))

(defmethod reshape :after ((rtt rtt) w h)
  (setf (projection rtt) (perspective 50 (/ w h) 0.5 20)))

(defmethod key ((rtt rtt) key)
  (case key
    ))

(defun draw-teapot (rtt)
  (let ((dt (* 60 (dt rtt))))
    (incf-mod-360 (teapot-rotation-x rtt) (* 0.01 dt))
    (incf-mod-360 (teapot-rotation-y rtt) (* 0.05 dt))
    (incf-mod-360 (teapot-rotation-z rtt) (* 0.03 dt)))
  (with-program (rtt :lit)
    (gl:clear-color 0 0.3 0.5 1.0)
    (gl:clear :color-buffer :depth-buffer)

    (gl:disable :blend)
    (gl:enable :depth-test :cull-face)

    (let ((mm (sb-cga:matrix* (translate 0 0 -4)
                              (rotate* (teapot-rotation-x rtt) 1 0 0)
                              (rotate* (teapot-rotation-y rtt) 0 1 0)
                              (rotate* (teapot-rotation-z rtt) 0 0 1)
                              ;; model is rotated relative to freeglut
                              ;;version, but doesn't really matter...
                              ;; (rotate* -90 0 1 0)
                              (sb-cga:scale* 1.3 1.3 1.3))))
      (gl:uniform-matrix-4fv (uniform-location :modelmatrix)
                             mm
                             nil)
      (gl:uniform-matrix-3fv (uniform-location :normalMatrix)
                             (normal-matrix3 mm) nil))
    (gl:vertex-attrib 2 1.0 1.0 1.0 1.0)

    (draw-vao rtt :teapot)))

(defun draw-spinning-quad (rtt)
  ;; 1 RPM
  (incf-mod-360 (quad-rotation rtt) (* 0.1 60 (dt rtt)))
  ;;(gl:clear-color (* 0.125 (abs (sin (now rtt)))) 0 0 1.0)
  (gl:clear-color 0 0 0 1.0)
  (gl:clear :color-buffer :depth-buffer)
  (gl:disable :cull-face)
  (gl:enable :blend :depth-test)
  (gl:blend-func :src-alpha :one-minus-src-alpha)

  (gl:bind-texture :texture-2d (texture rtt))
  ;; the teapot texture gets regenerated every frame, so we also need to
  ;; recalculate the mipmaps every frame since trilinear filtering is enabled.
  (gl:generate-mipmap :texture-2d)

  (with-program (rtt :textured)
    (gl:uniform-matrix-4fv (uniform-location :projectionmatrix)
                           (projection rtt)
                           nil)
    (gl:uniform-matrix-4fv (uniform-location :viewmatrix)
                           (sb-cga:translate* 0.0 -1.0 -3.0)
                           nil)
    (gl:uniform-matrix-4fv (uniform-location :modelMatrix)
                           (rotate* (quad-rotation rtt) 0.0 1.0 0.0)
                           nil)
    (draw-vao rtt :quad)))

(defmethod draw ((rtt rtt) now)
  ;; We render the teapot in the first pass. To do this, we switch to our
  ;; custom framebuffer, set the viewport to the texture size and render it
  ;; normally.
  (gl:bind-framebuffer :framebuffer (framebuffer rtt))
  (gl:viewport 0 0 512 512)
  (draw-teapot rtt)

  ;; Now that the texture has been updated, we can draw the spinning quad(s) in
  ;; the second pass. We want to render into the window, so we need to bind to
  ;; the default framebuffer, which always has the ID 0.
  (gl:bind-framebuffer :framebuffer 0)
  (gl:viewport 0 0 (width rtt) (height rtt))
  (draw-spinning-quad rtt))
