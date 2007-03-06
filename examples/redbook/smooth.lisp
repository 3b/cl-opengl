;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; smooth.lisp --- Lisp version of smooth.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates smooth shading.
;;; A smooth shaded polygon is drawn in a 2-D projection.

(in-package #:cl-glut-examples)

(defclass smooth-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :pos-x 100 :pos-y 100
                     :mode '(:single :rgb) :title "smooth.lisp"))

(defmethod glut:display-window :before ((w smooth-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :smooth))

(defmethod glut:display ((w smooth-window))
  (gl:clear :color-buffer)
  (gl:with-primitives :triangles
    (gl:color 1 0 0)
    (gl:vertex 5 5)
    (gl:color 0 1 0)
    (gl:vertex 25 5)
    (gl:color 0 0 1)
    (gl:vertex 5 25))
  (gl:flush))

(defmethod glut:reshape ((w smooth-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (if (<= width height)
      (glu:ortho-2d 0 30 0 (* 30 (/ height width)))
      (glu:ortho-2d 0 (* 30 (/ width height)) 0 30))
  (gl:matrix-mode :modelview))

(defmethod glut:keyboard ((w smooth-window) key x y)
  (declare (ignore x y))
  (case key
    (#\Esc (glut:destroy-current-window))))

(defun rb-smooth ()
  (glut:display-window (make-instance 'smooth-window)))
