(in-package #:cl-opengl-examples/core/glut)

(defclass render-to-texture-window (glut:window x:rtt)
  ()
  (:default-initargs :title "Render to Texture"
                     :mode '(:double :rgb :depth :multisample)))

(defmethod glut:display-window :before ((window render-to-texture-window))
  #+windows
  (let ((p (glut:get-proc-address "wglSwapIntervalEXT")))
    (unless (cffi:null-pointer-p p)
      (cffi:foreign-funcall-pointer p () :int 1 :int)))
  #+unix
  (let ((p (glut:get-proc-address "glxSwapIntervalEXT")))
    (unless (cffi:null-pointer-p p)
      (cffi:foreign-funcall-pointer p () :int 1 :int)))
  (x:init-gl window))

(defmethod glut:display ((window render-to-texture-window))
  (x:draw window (/ (coerce (get-internal-real-time) 'double-float)
                    #.(coerce internal-time-units-per-second 'double-float)))
  (glut:swap-buffers))

(defmethod glut:idle ((window render-to-texture-window))
  (glut:post-redisplay))

(defmethod glut:keyboard ((window render-to-texture-window) key x y)
  (declare (ignore x y))
  (if (eql key #\esc)
      (glut:destroy-current-window)
      (x:key window key)))

(defmethod glut:special ((window render-to-texture-window) special-key x y)
  (declare (ignore x y))
  (x:key window special-key))

(defmethod glut:reshape ((w render-to-texture-window) width height)
  (x:reshape w width height))

(defmethod glut:visibility ((w render-to-texture-window) state)
  (case state
    (:visible (glut:enable-event w :idle))
    (t (glut:disable-event w :idle))))

(defun render-to-texture ()
  (glut:display-window (make-instance 'render-to-texture-window
                                      :width 640 :height 480)))

#++
(render-to-texture)
#++
(cl-glut:show-window)
#++
(loop for i across cl-glut::*id->window*
      do (when i (glut::%close i)))
