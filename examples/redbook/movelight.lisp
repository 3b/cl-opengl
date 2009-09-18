;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; movelight.lisp --- Lisp version of movelight.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates when to issue lighting and
;;; transformation commands to render a model with a light
;;; which is moved by a modeling transformation (rotate or
;;; translate).  The light position is reset after the modeling
;;; transformation is called.  The eye position does not change.
;;;
;;; A sphere is drawn using a grey material characteristic.
;;; A single light source illuminates the object.
;;;
;;; Interaction:  pressing the left mouse button alters
;;; the modeling transformation (x rotation) by 30 degrees.
;;; The scene is then redrawn with the light in a new position.

(in-package #:cl-glut-examples)

(defclass movelight-window (glut:window)
  ((spin :initform 0))
  (:default-initargs :width 500 :height 500 :pos-x 100 :pos-y 100
                     :mode '(:single :rgb :depth) :title "movelight.lisp"))

(defmethod glut:display-window :before ((w movelight-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :smooth)
  (gl:enable :lighting)
  (gl:enable :light0)
  (gl:enable :depth-test))

;;; Here is where the light position is reset after the modeling
;;; transformation (GL:ROTATE) is called.  This places the
;;; light at a new position in world coordinates.  The cube
;;; represents the position of the light.
(defmethod glut:display ((w movelight-window))
  (gl:clear :color-buffer :depth-buffer)
  (gl:with-pushed-matrix
    (glu:look-at 0 0 5 0 0 0 0 1 0)
    (gl:with-pushed-matrix
      (gl:rotate (slot-value w 'spin) 1 0 0)
      (gl:light :light0 :position #(0 0 1.5 1))
      (gl:translate 0 0 1.5)
      (gl:disable :lighting)
      (gl:color 0 1 1)
      (glut:wire-cube 0.1)
      (gl:enable :lighting))
    (glut:solid-torus 0.275 0.85 8 15))
  (gl:flush))

(defmethod glut:reshape ((w movelight-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 40 (/ width height) 1 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:mouse ((w movelight-window) button state x y)
  (declare (ignore x y))
  (when (and (eq button :left-button) (eq state :down))
    (with-slots (spin) w
      (setf spin (mod (+ spin 30) 360)))
    (glut:post-redisplay)))

(defmethod glut:keyboard ((w movelight-window) key x y)
  (declare (ignore x y))
  (case key
    (#\Esc (glut:destroy-current-window))))

(defun rb-movelight ()
  (glut:display-window (make-instance 'movelight-window)))
