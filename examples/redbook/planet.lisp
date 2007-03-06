;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; planet.lisp --- Lisp version of planet.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program shows how to composite modeling transformations
;;; to draw translated and rotated models.
;;; Interaction:  pressing the d and y keys (day and year)
;;; alters the rotation of the planet around the sun.

(in-package #:cl-glut-examples)

(defclass planet-window (glut:window)
  ((year :accessor year :initform 0)
   (day :accessor day :initform 0))
  (:default-initargs
   :pos-x 100 :pos-y 100 :width 500 :height 500
   :mode '(:double :rgb) :title "planet.lisp"))

(defmethod glut:display-window :before ((w planet-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w planet-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:with-pushed-matrix
    ;; draw sun
    (glut:wire-sphere 1 20 16)
    ;; draw smaller planet
    (gl:rotate (year w) 0 1 0)
    (gl:translate 2 0 0)
    (gl:rotate (day w) 0 1 0)
    (glut:wire-sphere 0.2 10 8))
  (glut:swap-buffers))

(defmethod glut:reshape ((w planet-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 60 (/ width height) 1 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (glu:look-at 0 0 5 0 0 0 0 1 0))

(defmethod glut:keyboard ((w planet-window) key x y)
  (declare (ignore x y))
  (flet ((update (slot n)
           (setf (slot-value w slot) (mod (+ (slot-value w slot) n) 360))
           (glut:post-redisplay)))
    (case key
      (#\d (update 'day 10))
      (#\D (update 'day -10))
      (#\y (update 'year 5))
      (#\Y (update 'year -5))
      (#\Esc (glut:destroy-current-window)))))

(defun rb-planet ()
  (glut:display-window (make-instance 'planet-window)))
