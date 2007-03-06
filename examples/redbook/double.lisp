;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; double.lisp --- Lisp version of double.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This is a simple double buffered program.
;;; Pressing the left mouse button rotates the rectangle.
;;; Pressing the middle mouse button stops the rotation.

(in-package #:cl-glut-examples)

(defclass double-window (glut:window)
  ((spin :initform 0.0))
  (:default-initargs :width 250 :height 250 :pos-x 100 :pos-y 100
                     :mode '(:double :rgb) :title "double.lisp"))

(defmethod glut:display-window :before ((w double-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w double-window))
  (gl:clear :color-buffer)
  (gl:with-pushed-matrix
    (gl:rotate (slot-value w 'spin) 0 0 1)
    (gl:color 1 1 1)
    (gl:rect -25 -25 25 25))
  (glut:swap-buffers))

(defmethod glut:idle ((w double-window))
  (with-slots (spin) w
    (incf spin 2.0)
    (when (> spin 360.0)
      (decf spin 360.0))
    (glut:post-redisplay)))

(defmethod glut:reshape ((w double-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:ortho -50 50 -50 50 -1 1)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:mouse ((w double-window) button state x y)
  (declare (ignore x y))
  (case button
    (:left-button
     (when (eq state :down)
       (glut:enable-event w :idle)))
    ((:middle-button :right-button)
     (when (eq state :down)
       (glut:disable-event w :idle)))))

(defun rb-double ()
  (glut:display-window (make-instance 'double-window)))
