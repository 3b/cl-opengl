;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; glut-teapot.lisp --- Simple usage of glut:solid-teapot.

(in-package #:cl-glut-examples)

(defclass glut-teapot-window (glut:window)
  ()
  (:default-initargs :width 250 :height 250 :title "glut-teapot.lisp"
                     :mode '(:single :rgb :depth)))

(defmethod glut:display-window :before ((w glut-teapot-window))
  (gl:clear-color 0 0 0 0)
  (gl:cull-face :back)
  (gl:depth-func :less)
  (gl:disable :dither)
  (gl:shade-model :smooth)
  (gl:light-model :light-model-local-viewer 1)
  (gl:color-material :front :ambient-and-diffuse)
  (gl:enable :light0 :lighting :cull-face :depth-test))

(defmethod glut:display ((window glut-teapot-window))
  (gl:load-identity)
  (gl:translate 0 0 -5)
  (gl:rotate 30 1 1 0)
  (gl:light :light0 :position '(0 1 1 0))
  (gl:light :light0 :diffuse '(0.2 0.4 0.6 0))
  (gl:clear :color-buffer :depth-buffer)
  (gl:color 1 1 1)
  (gl:front-face :cw)
  (glut:solid-teapot 1.3)
  (gl:front-face :ccw)
  (gl:flush))

(defmethod glut:reshape ((window glut-teapot-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 50 (/ width height) 0.5 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((window glut-teapot-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun glut-teapot ()
  (glut:display-window (make-instance 'glut-teapot-window)))