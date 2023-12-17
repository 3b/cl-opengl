;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-

(in-package #:cl-glut-examples)

(gl:define-gl-array-format position-color
  (gl:vertex :type :float :components (x y))
  (gl:color :type :unsigned-char :components (r g b)))

(defclass opengl-array-window (glut:window)
  ((vertex-array :accessor vertex-array
                 :initform (gl:alloc-gl-array 'position-color 5))
   (indices-array :accessor indices-array
                  :initform (gl:alloc-gl-array :unsigned-short 10)))
  (:default-initargs :title "opengl-array.lisp"))

(defmethod glut:display-window :before ((w opengl-array-window))
  (dotimes (i 5)
    (let ((phi (float (+ (/ pi 2) (* (/ i 5) (* 2 pi))) 0.0)))
      ;; vertices
      (setf (gl:glaref (vertex-array w) i 'x) (cos phi))
      (setf (gl:glaref (vertex-array w) i 'y) (sin phi))
      ;; indices
      (setf (gl:glaref (indices-array w) (* 2 i)) i)
      (setf (gl:glaref (indices-array w) (1+ (* 2 i))) (mod (+ i 2) 5))
      ;; colors
      (setf (gl:glaref (vertex-array w) i 'r) 255)
      (setf (gl:glaref (vertex-array w) i 'g) 0)
      (setf (gl:glaref (vertex-array w) i 'b) 0)))
  (gl:clear-color 0 0 0 0))

(defmethod glut:display ((w opengl-array-window))
  (gl:clear :color-buffer)
  (gl:enable-client-state :vertex-array)
  (gl:enable-client-state :color-array)
  (gl:bind-gl-vertex-array (vertex-array w))
  (gl:draw-elements :lines (indices-array w))
  (gl:flush))

(defmethod glut:close ((w opengl-array-window))
  (gl:free-gl-array (vertex-array w))
  (gl:free-gl-array (indices-array w)))

(defun misc-opengl-array ()
  (glut:display-window (make-instance 'opengl-array-window)))
