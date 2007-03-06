;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; hello.lisp --- Lisp version of hello.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This is a simple, introductory OpenGL program.

;;; Declare initial window size, position, and display mode (single
;;; buffer and RGBA).  Open window with "hello" in its title bar.
;;; Call initialization routines.  Register callback function to
;;; display graphics.  Enter main loop and process events.

(in-package #:cl-glut-examples)

(defclass hello-window (glut:window)
  ()
  (:default-initargs :pos-x 100 :pos-y 100 :width 250 :height 250
                     :mode '(:single :rgb) :title "hello.lisp"))

(defmethod glut:display-window :before ((w hello-window))
  ;; Select clearing color.
  (gl:clear-color 0 0 0 0)
  ;; Initialize viewing values.
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:ortho 0 1 0 1 -1 1))

(defmethod glut:display ((w hello-window))
  (gl:clear :color-buffer)
  ;; Draw white polygon (rectangle) with corners at
  ;; (0.25, 0.25, 0.0) and (0.75, 0.75, 0.0).
  (gl:color 1 1 1)
  (gl:with-primitive :polygon
    (gl:vertex 0.25 0.25 0)
    (gl:vertex 0.75 0.25 0)
    (gl:vertex 0.75 0.75 0)
    (gl:vertex 0.25 0.75 0))
  ;; Start processing buffered OpenGL routines.
  (gl:flush))

(defun rb-hello ()
  (glut:display-window (make-instance 'hello-window)))
