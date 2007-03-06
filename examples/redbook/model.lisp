;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; model.lisp --- Lisp version of model.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates modeling transformations

(in-package #:cl-glut-examples)

(defclass model-window (glut:window)
  ()
  (:default-initargs :pos-x 100 :pos-y 100 :width 500 :height 500
                     :mode '(:single :rgb) :title "model.lisp"))

(defmethod glut:display-window :before ((w model-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w model-window))
  (flet ((draw-triangle ()
           (gl:with-primitives :line-loop
             (gl:vertex 0 25)
             (gl:vertex 25 -25)
             (gl:vertex -25 -25))))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  ;; triangle with solid-lines
  (gl:load-identity)
  (gl:color 1 1 1)
  (draw-triangle)
  ;; triangle with dashed-lines
  (gl:enable :line-stipple)
  (gl:line-stipple 1 #xF0F0)
  (gl:load-identity)
  (gl:translate -20 0 0)
  (draw-triangle)
  ;; triangle with long dashed-lines
  (gl:line-stipple 1 #xF00F)
  (gl:load-identity)
  (gl:scale 1.5 0.5 1.0)
  (draw-triangle)
  ;; triangle with dotted lines
  (gl:line-stipple 1 #x8888)
  (gl:load-identity)
  (gl:rotate 90 0 0 1)
  (draw-triangle)
  (gl:disable :line-stipple)
  (gl:flush)))

(defmethod glut:reshape ((w model-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (if (<= width height)
      (gl:ortho -50 50 (/ (* -50 height) width)
                (/ (* 50 height) width) -1 1)
      (gl:ortho (/ (* -50 width) height) (/ (* 50 width) height) -50
                50.0 -1 1))
  (gl:matrix-mode :modelview))

(defmethod glut:keyboard ((w model-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-model ()
  (glut:display-window (make-instance 'model-window)))
