(in-package #:cl-opengl-examples/core/glut)

(defclass gears-window (glut:window x:gears)
  ()
  (:default-initargs :title "Gears" :mode '(:double :rgb :depth)))

(defmethod glut:display-window :before ((window gears-window))
  #+windows
  (let ((p (glut:get-proc-address "wglSwapIntervalEXT")))
    (unless (cffi:null-pointer-p p)
      (cffi:foreign-funcall-pointer p () :int 1 :int)))
  #+unix
  (let ((p (glut:get-proc-address "glxSwapIntervalEXT")))
    (unless (cffi:null-pointer-p p)
      (cffi:foreign-funcall-pointer p () :int 1 :int)))
  (x:init-gl window))

(defmethod glut:display ((window gears-window))
  (x:draw window (/ (coerce (get-internal-real-time) 'double-float)
                    #.(coerce internal-time-units-per-second 'double-float)))
  (glut:swap-buffers))

(defmethod glut:idle ((window gears-window))
  (glut:post-redisplay))

(defmethod glut:keyboard ((window gears-window) key x y)
  (declare (ignore x y))
  (if (eql key #\esc)
      (glut:destroy-current-window)
      (x:key window key)))

(defmethod glut:special ((window gears-window) special-key x y)
  (declare (ignore x y))
  (x:key window special-key))

(defmethod glut:reshape ((w gears-window) width height)
  (x:reshape w width height))

(defmethod glut:visibility ((w gears-window) state)
  (case state
    (:visible (glut:enable-event w :idle))
    (t (glut:disable-event w :idle))))

(defun gears ()
  (glut:display-window (print (make-instance 'gears-window :width 640 :height 480))))

#++
(gears)
