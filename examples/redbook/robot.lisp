;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; robot.lisp --- Lisp version of robot.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program shows how to composite modeling transformations
;;; to draw translated and rotated hierarchical models.
;;; Interaction:  pressing the s and e keys (shoulder and elbow)
;;; alters the rotation of the robot arm.

(in-package #:cl-glut-examples)

(defclass robot-window (glut:window)
  ((shoulder :accessor shoulder :initform 0)
   (elbow :accessor elbow :initform 0))
  (:default-initargs
   :pos-x 100 :pos-y 100 :width 500 :height 500
   :mode '(:double :rgb) :title "robot.lisp"))

(defmethod glut:display-window :before ((w robot-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w robot-window))
  (gl:clear :color-buffer)
  (gl:with-pushed-matrix
    ;; first cube
    (gl:translate -1 0 0)
    (gl:rotate (shoulder w) 0 0 1)
    (gl:translate 1 0 0)
    (gl:with-pushed-matrix
      (gl:scale 2 0.4 1)
      (glut:wire-cube 1))
    ;; second cube
    (gl:translate 1 0 0)
    (gl:rotate (elbow w) 0 0 1)
    (gl:translate 1 0 0)
    (gl:with-pushed-matrix
      (gl:scale 2 0.4 1)
      (glut:wire-cube 1)))
  (glut:swap-buffers))

(defmethod glut:reshape ((w robot-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 65 (/ width height) 1 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (gl:translate 0 0 -5))

(defmethod glut:keyboard ((w robot-window) key x y)
  (declare (ignore x y))
  (flet ((update (slot n)
           (setf (slot-value w slot) (mod (+ (slot-value w slot) n) 360))
           (glut:post-redisplay)))
    (case key
      (#\s (update 'shoulder 10))
      (#\S (update 'shoulder -10))
      (#\e (update 'elbow 5))
      (#\E (update 'elbow -5))
      (#\Esc (glut:destroy-current-window)))))

(defun rb-robot ()
  (glut:display-window (make-instance 'robot-window)))
