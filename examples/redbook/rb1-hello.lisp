;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; rb2-hello.lisp --- Lisp version of hello.c (Red Book examples)

(in-package #:redbook-examples)

(defclass hello-window (glut:window)
  ())

(defmethod initialize-instance :after ((w hello-window) &key)
  ;; Select clearing color.
  (gl:clear-color 0 0 0 0)
  ;; Initialize viewing values.
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:ortho 0 1 0 1 -1 1))

(defmethod glut:display ((window hello-window))
  (gl:clear :color-buffer-bit)
  ;; Draw white polygon (rectangle) with corners at
  ;; (0.25, 0.25, 0.0) and (0.75, 0.75, 0.0).
  (gl:color 1 1 1)
  (gl:with-primitives :polygon
    (gl:vertex 0.25 0.25 0.0)
    (gl:vertex 0.75 0.25 0.0)
    (gl:vertex 0.75 0.75 0.0)
    (gl:vertex 0.25 0.75 0.0))
  ;; Start processing buffered OpenGL routines.
  (gl:flush))

;;; Declare initial window size, position, and display mode
;;; (single buffer and RGBA).  Open window with "hello"
;;; in its title bar.  Call initialization routines.
;;; Register callback function to display graphics.
;;; Enter main loop and process events.
(defun rb1 ()
  (glut:init-display-mode :single :rgb)
  (make-instance 'hello-window
                 :pos-x 100 :pos-y 100
                 :width 250 :height 250
                 :title "rb1-hello.lisp"
                 :events '(:display))
  (glut:main-loop))