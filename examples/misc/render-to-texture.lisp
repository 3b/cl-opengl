;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; render-to-texture.lisp --- Simple usage of the EXT_framebuffer_object extension

(in-package #:cl-glut-examples)

(defclass render-to-texture-window (glut:window)
  ((texture :accessor texture)
   (framebuffer :accessor framebuffer))
  (:default-initargs :width 640 :height 480 :title "render-to-texture.lisp"
                     :mode '(:double :rgb :depth :multisample)))

;;; Do initialization here:
;;;
;;; In order to render to a texture, we need to setup a complete framebuffer,
;;; which consists of color-buffers, a depth-buffer and a stencil-buffer.
;;; In our simple case, we setup a texture as color-buffer and add a 24-bit
;;; depth-buffer so we can render the teapot correctly. We don't attach a
;;; stencil-buffer since it isn't needed in this simple example.
(defmethod glut:display-window :before ((w render-to-texture-window))
  (let ((framebuffer (first (gl:gen-framebuffers-ext 1)))
        (depthbuffer (first (gl:gen-renderbuffers-ext 1)))
        (texture (first (gl:gen-textures 1))))
    ;; setup framebuffer
    (gl:bind-framebuffer-ext :framebuffer-ext framebuffer)

    ;; setup texture and attach it to the framebuffer
    (gl:bind-texture :texture-2d texture)
    (gl:tex-parameter :texture-2d :texture-min-filter :linear-mipmap-linear)
    (gl:tex-parameter :texture-2d :texture-mag-filter :linear)
    (gl:tex-image-2d :texture-2d 0 :rgba 512 512 0 :rgba :unsigned-byte (cffi:null-pointer))
    (gl:generate-mipmap-ext :texture-2d)
    (gl:bind-texture :texture-2d 0)
    (gl:framebuffer-texture-2d-ext :framebuffer-ext
                                   :color-attachment0-ext
                                   :texture-2d
                                   texture
                                   0)

    ;; setup depth-buffer and attach it to the framebuffer
    (gl:bind-renderbuffer-ext :renderbuffer-ext depthbuffer)
    (gl:renderbuffer-storage-ext :renderbuffer-ext :depth-component24 512 512)
    (gl:framebuffer-renderbuffer-ext :framebuffer-ext
                                     :depth-attachment-ext
                                     :renderbuffer-ext
                                     depthbuffer)

    ;; validate framebuffer
    (let ((framebuffer-status (gl:check-framebuffer-status-ext :framebuffer-ext)))
      (unless (gl::enum= framebuffer-status :framebuffer-complete-ext)
        (error "Framebuffer not complete: ~A." framebuffer-status)))

    (setf (texture w) texture
          (framebuffer w) framebuffer))

  (gl:enable :depth-test :multisample))

(defmethod glut:display ((window render-to-texture-window))
  (gl:load-identity)

  ;; We render the teapot in the first pass. To do this, we switch to our
  ;; custom framebuffer, set the viewport to the texture size and render it
  ;; normally.
  (gl:bind-framebuffer-ext :framebuffer-ext (framebuffer window))
  (gl:viewport 0 0 512 512)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 50 1 0.5 20)
  (gl:matrix-mode :modelview)

  (draw-teapot)

  ;; Now that the texture has been updated, we can draw the spinning quad(s) in
  ;; the second pass. We want to render into the window, so we need to bind to
  ;; the default framebuffer, which always has the ID 0.
  (gl:bind-framebuffer-ext :framebuffer-ext 0)
  (gl:viewport 0 0 (glut:width window) (glut:height window))
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 50 (/ (glut:width window) (glut:height window)) 0.5 20)
  (gl:matrix-mode :modelview)

  (draw-spinning-quad (texture window))

  (glut:swap-buffers))

(defmethod glut:idle ((window render-to-texture-window))
  (glut:post-redisplay))

(defmethod glut:reshape ((window render-to-texture-window) width height)
  (setf (glut:width window) width
        (glut:height window) height))

(defmethod glut:keyboard ((window render-to-texture-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun render-to-texture ()
  (glut:display-window (make-instance 'render-to-texture-window)))


;;; FIXME: the rotations are dependent on the frame rate.
;;; I'd need to calculate the frametime, but I'm too lazy right now.

(defparameter *teapot-rotation-x* 0.0)
(defparameter *teapot-rotation-y* 0.0)
(defparameter *teapot-rotation-z* 0.0)

(defun draw-teapot ()
  (gl:clear-color 0 0.3 0.5 1.0)
  (gl:clear :color-buffer :depth-buffer)

  (gl:disable :blend :texture-2d)
  (gl:enable :lighting :light0 :depth-test)

  (gl:color-material :front :ambient-and-diffuse)

  (gl:light :light0 :position '(0 1 1 0))
  (gl:light :light0 :diffuse '(0.2 0.4 0.6 0))

  (gl:load-identity)
  (gl:translate 0 0 -4)
  (gl:rotate *teapot-rotation-x* 1 0 0)
  (gl:rotate *teapot-rotation-y* 0 1 0)
  (gl:rotate *teapot-rotation-z* 0 0 1)

  (gl:color 1 1 1)
  (glut:solid-teapot 1.3)

  (incf *teapot-rotation-x* 0.01)
  (incf *teapot-rotation-y* 0.05)
  (incf *teapot-rotation-z* 0.03))


(defparameter *quad-rotation* 0.0)

(defun draw-spinning-quad (texture)
  (gl:clear-color 0 0 0 0)
  (gl:clear :color-buffer :depth-buffer)

  (gl:disable :lighting)
  (gl:enable :blend :texture-2d :depth-test)
  (gl:blend-func :src-alpha :one)

  (gl:load-identity)
  (gl:translate 0 -1 -3)
  (gl:rotate *quad-rotation* 0 1 0)

  (gl:bind-texture :texture-2d texture)

  ;; the teapot texture gets regenerated every frame, so we also need to
  ;; recalculate the mipmaps every frame since trilinear filtering is enabled.
  (gl:generate-mipmap-ext :texture-2d)

  ;; draw textured quad
  (gl:color 1 1 1)
  (gl:with-primitives :quads
    (gl:tex-coord 0 1)
    (gl:vertex -1 2)
    (gl:tex-coord 1 1)
    (gl:vertex 1 2)
    (gl:tex-coord 1 0)
    (gl:vertex 1 0)
    (gl:tex-coord 0 0)
    (gl:vertex -1 0))

  ;; draw fake reflection
  (gl:with-primitives :quads
    (gl:color 1 1 1 0.7)
    (gl:tex-coord 0 0)
    (gl:vertex -1 0)
    (gl:tex-coord 1 0)
    (gl:vertex 1 0)
    (gl:tex-coord 1 0.5)
    (gl:color 1 1 1 0)
    (gl:vertex 1 -1)
    (gl:tex-coord 0 0.5)
    (gl:vertex -1 -1))
  (incf *quad-rotation* 0.1))
