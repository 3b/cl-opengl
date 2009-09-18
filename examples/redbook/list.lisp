;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; list.lisp --- Lisp version of list.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates how to make and execute a
;;; display list.  Note that attributes, such as current
;;; color and matrix, are changed.

(in-package #:cl-glut-examples)

(defclass list-window (glut:window)
  ((list-name :accessor list-name :initform nil))
  (:default-initargs
   :width 600 :height 50 :title "list.lisp" :mode '(:single :rgb)))

(defmethod glut:display-window :before ((w list-window))
  (unless (list-name w)
    (setf (list-name w) (gl:gen-lists 1)))
  (gl:with-new-list ((list-name w) :compile)
    (gl:color 1 0 0)                    ; red
    (gl:with-primitives :triangles
      (gl:vertex 0 0)
      (gl:vertex 1 0)
      (gl:vertex 0 1))
    (gl:translate 1.5 0 0))             ; move position
  (gl:shade-model :flat))

(defmethod glut:display ((w list-window))
  (gl:load-identity)
  (gl:clear :color-buffer)
  (gl:color 0 1 0)                      ; current color green
  (loop repeat 10 do (gl:call-list (list-name w)))
  (gl:with-primitives :lines            ; is this line green? NO!
    (gl:vertex 0 0.5)                   ; where is the line drawn?
    (gl:vertex 15 0.5))
  (gl:flush))

(defmethod glut:reshape ((w list-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (if (<= width height)
      (glu:ortho-2d 0 2 (* -0.5 (/ height width)) (* 1.5 (/ height width)))
      (glu:ortho-2d 0 (* 2 (/ width height)) -0.5 1.5))
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((w list-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-list ()
  (glut:display-window (make-instance 'list-window)))
