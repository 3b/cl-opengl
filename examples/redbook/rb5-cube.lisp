;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; rb5-cube.lisp --- Lisp version of cube.c (Red Book examples)

(in-package #:redbook-examples)

(defclass cube-window (glut:window)
  ())

(defmethod initialize-instance :after ((w cube-window) &key)
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w cube-window))
  (gl:clear :color-buffer-bit)
  (gl:color 1 1 1)
  (gl:load-identity) ; clear the matrix
  ;; viewing transformation
  (glu:look-at 0 0 5 0 0 0 0 1 0)
  ;; modeling transformation
  (gl:scale 1 2 1)
  (glut:wire-cube 1)
  (gl:flush))

(defmethod glut:reshape ((w cube-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:frustum -1 1 -1 1 1.5 20)
  (gl:matrix-mode :modelview))

(defmethod glut:keyboard ((w cube-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:leave-main-loop)))

(defun rb5 ()
  (glut:init-display-mode :single :rgb)
  (make-instance 'cube-window
                 :width 500 :height 500
                 :title "rb5-cube.lisp"
                 :events '(:display :reshape :keyboard))
  (glut:main-loop))