;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; clip.lisp --- Lisp version of clip.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates arbitrary clipping planes.

(in-package #:cl-glut-examples)

(defclass clip-window (glut:window)
  ()
  (:default-initargs :pos-x 100 :pos-y 100 :width 500 :height 500
                     :mode '(:single :rgb) :title "clip.lisp"))

(defmethod glut:display-window :before ((w clip-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat))

(defmethod glut:display ((w clip-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:with-pushed-matrix
    (gl:translate 0 0 -5)
    ;; clip lower half -- y < 0
    (gl:clip-plane :clip-plane0 '(0 1 0 0))
    (gl:enable :clip-plane0)
    ;; clip left half -- x < 0
    (gl:clip-plane :clip-plane1 '(1 0 0 0))
    (gl:enable :clip-plane1)
    ;; sphere
    (gl:rotate 90 1 0 0)
    (glut:wire-sphere 1 20 16))
  (gl:flush))

(defmethod glut:reshape ((w clip-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 60 (/ width height) 1 20)
  (gl:matrix-mode :modelview))

(defmethod glut:keyboard ((w clip-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-clip ()
  (glut:display-window (make-instance 'clip-window)))
