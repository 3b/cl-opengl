;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; glut-menu.lisp --- Simple usage of glut:menu-mixin

(in-package #:cl-glut-examples)


(defclass glut-menu-window (glut:window)
  ()
  (:default-initargs :width 512 :height 512 :title "glut-menu.lisp"
                     :mode '(:single :rgb :depth)
                     :left-menu '("foo!"
                                  :bar
                                  :add-right-menu
                                  (:menu sub-menu
                                   ("1" :one)
                                   "2"
                                   :3))))

(defmethod glut:display-window :before ((w glut-menu-window))
  (gl:clear-color 0 0 0 0)
  (gl:cull-face :back)
  (gl:depth-func :less)
  (gl:disable :dither)
  (gl:shade-model :smooth)
  (gl:light-model :light-model-local-viewer 1)
  (gl:color-material :front :ambient-and-diffuse)
  (gl:enable :light0 :lighting :cull-face :depth-test))

(defmethod glut:display ((window glut-menu-window))
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

(defmethod glut:reshape ((window glut-menu-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 50 (/ width height) 0.5 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((window glut-menu-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defmethod glut::menu ((window glut-menu-window) menu id)
  (format t "~&got menu item ~s from menu ~s~%" menu id)
  (case id
    (:add-right-menu
     (setf (glut::right-menu window)
           '(("add menu to middle mouse button" :add-middle)
             :exit)))
    (:add-middle
     (setf (glut::middle-menu window)
           '(("change left menu" :change-left))))
    (:exit
     (glut:destroy-current-window))))

;; different way of handling menu events, method per item
(defmethod glut::menu ((window glut-menu-window) (menu (eql :middle-button))
                       (id (eql :change-left)))
  (format t "~&clicked middle menu|change left!~%")
  (setf (glut::left-menu window)
        (alexandria:shuffle (copy-seq (glut::left-menu window)))))


(defun glut-menu ()
  (glut:display-window (make-instance 'glut-menu-window)))

#++
(ql:quickload 'cl-glut-examples)
#++
(glut-menu)
#++
(glut:show-window) 
