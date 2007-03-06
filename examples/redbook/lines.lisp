;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; lines.lisp --- Lisp version of lines.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates geometric primitives and
;;; their attributes.

(in-package #:cl-glut-examples)

(defun draw-one-line (x1 y1 x2 y2)
  (gl:with-primitives :lines
    (gl:vertex x1 y1)
    (gl:vertex x2 y2)))

(defclass lines-window (glut:window)
  ()
  (:default-initargs
   :width 400 :height 150 :pos-x 100 :pos-y 100
   :mode '(:single :rgb) :title "lines.lisp"))

(defmethod glut:display-window :before ((w lines-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w lines-window))
  (gl:clear :color-buffer)
  ;; Select white for all lines.
  (gl:color 1 1 1)
  ;; In 1st row, 3 lines, each with a different stipple.
  (gl:enable :line-stipple)
  (gl:line-stipple 1 #b0000000100000001) ; dotted
  (draw-one-line 50 125 150 125)
  (gl:line-stipple 1 #b0000000011111111) ; dashed
  (draw-one-line 150 125 250 125)
  (gl:line-stipple 1 #b0001110001000111) ; dash/dot/dash
  (draw-one-line 250 125 350 125)
  ;; In 2nd row, 3 wide lines, each with different stipple.
  (gl:line-width 5)
  (gl:line-stipple 1 #b0000000100000001) ; dotted
  (draw-one-line 50 100 150 100)
  (gl:line-stipple 1 #b0000000011111111) ; dashed
  (draw-one-line 150 100 250 100)
  (gl:line-stipple 1 #b0001110001000111) ; dash/dot/dash
  (draw-one-line 250 100 350 100)
  (gl:line-width 1)
  ;; In 3rd row, 6 lines, with dash/dot/dash stipple as part
  ;; of a single connected line strip.
  (gl:line-stipple 1 #b0001110001000111) ; dash/dot/dash
  (gl:with-primitives :line-strip
    (dotimes (i 7)
      (gl:vertex (+ 50 (* i 50)) 75)))
  ;; In 4th row, 6 independent lines with same stipple.
  (dotimes (i 6)
    (draw-one-line (+ 50 (* i 50)) 50
                   (+ 50 (* (1+ i) 50)) 50))
  ;; In 5th row, 1 line, with dash/dot/dash stipple and
  ;; a stipple repeat factor of 5.
  (gl:line-stipple 5 #b0001110001000111) ; dash/dot/dash
  (draw-one-line 50 25 350 25)
  ;; Finally,
  (gl:disable :line-stipple)
  (gl:flush))

(defmethod glut:reshape ((w lines-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w lines-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-lines ()
  (glut:display-window (make-instance 'lines-window)))
