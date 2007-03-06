;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; cube.lisp --- Lisp version of cube.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates a single modeling transformation,
;;; GL:SCALE and a single viewing transformation, GLU:LOOK-AT.
;;; A wireframe cube is rendered.

(in-package #:cl-glut-examples)

(defclass cube-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "cube.lisp"
                     :mode '(:single :rgb)))

(defmethod glut:display-window :before ((w cube-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w cube-window))
  (gl:clear :color-buffer)
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
    (glut:destroy-current-window)))

(defun rb-cube ()
  (glut:display-window (make-instance 'cube-window)))
