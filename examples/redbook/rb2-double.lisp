;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; rb1-double.lisp --- Lisp version of double.c (Red Book examples)

(in-package #:redbook-examples)

(defclass double-window (glut:window)
  ((spin :initform 0.0)))

(defmethod initialize-instance :after ((w double-window) &key)
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w double-window))
  (gl:clear :color-buffer-bit)
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

(defun rb2 ()
  (glut:init-display-mode :double :rgb)
  (make-instance 'double-window
                 :width 250 :height 250
                 :pos-x 100 :pos-y 100
                 :title "rb2-double.lisp"
                 :events '(:display :reshape :mouse))
  (glut:main-loop))
