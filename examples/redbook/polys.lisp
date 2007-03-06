;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; polys.lisp --- Lisp version of polys.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates polygon stippling.

(in-package #:cl-glut-examples)

(defclass polys-window (glut:window)
  ()
  (:default-initargs :width 350 :height 150 :title "polys.lisp"
                     :mode '(:single :rgb)))

(defmethod glut:display-window :before ((w polys-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defparameter *fly*
  #(#x00 #x00 #x00 #x00 #x00 #x00 #x00 #x00
    #x03 #x80 #x01 #xC0 #x06 #xC0 #x03 #x60
    #x04 #x60 #x06 #x20 #x04 #x30 #x0C #x20
    #x04 #x18 #x18 #x20 #x04 #x0C #x30 #x20
    #x04 #x06 #x60 #x20 #x44 #x03 #xC0 #x22
    #x44 #x01 #x80 #x22 #x44 #x01 #x80 #x22
    #x44 #x01 #x80 #x22 #x44 #x01 #x80 #x22
    #x44 #x01 #x80 #x22 #x44 #x01 #x80 #x22
    #x66 #x01 #x80 #x66 #x33 #x01 #x80 #xCC
    #x19 #x81 #x81 #x98 #x0C #xC1 #x83 #x30
    #x07 #xe1 #x87 #xe0 #x03 #x3f #xfc #xc0
    #x03 #x31 #x8c #xc0 #x03 #x33 #xcc #xc0
    #x06 #x64 #x26 #x60 #x0c #xcc #x33 #x30
    #x18 #xcc #x33 #x18 #x10 #xc4 #x23 #x08
    #x10 #x63 #xC6 #x08 #x10 #x30 #x0c #x08
    #x10 #x18 #x18 #x08 #x10 #x00 #x00 #x08))

(defparameter *halftone*
  #(#xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55
    #xAA #xAA #xAA #xAA #x55 #x55 #x55 #x55))

(defmethod glut:display ((w polys-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  ;; Draw one solid, unstippled rectangles then two
  ;; stippled rectangles.
  (gl:rect 25 25 125 125)
  (gl:enable :polygon-stipple)
  (gl:polygon-stipple *fly*)
  (gl:rect 125 25 225 125)
  (gl:polygon-stipple *halftone*)
  (gl:rect 225 25 325 125)
  (gl:disable :polygon-stipple)
  (gl:flush))

(defmethod glut:reshape ((w polys-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w polys-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-polys ()
  (glut:display-window (make-instance 'polys-window)))
