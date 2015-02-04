
;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; quadric.lisp --- Lisp version of quadric.c (Red Book examples)
;;;

(in-package #:cl-glut-examples)

(defclass quadric-window (glut:window)
  ((start-list :accessor start-list))
  (:default-initargs :width 500 :height 500 :title "quadric.lisp"
                     :mode '(:single :rgb :depth)))

(defmethod glut:display-window :before ((window quadric-window))
  (let ((quadric-obj)
	(mat-ambient '(0.5 0.5 0.5 1.0))
	(mat-specular '(1.0 1.0 1.0 1.0))
	(mat-shininess 50)
	(light-position '(1.0 1.0 1.0 0.0))
	(model-ambient '(0.5 0.5 0.5 1.0)))
    (gl:clear-color 0 0 0 0)
    (gl:material :front :ambient mat-ambient)
    (gl:material :front :specular mat-specular)
    (gl:material :front :shininess mat-shininess)
    (gl:light :light0 :position light-position)
    (gl:light-model :light-model-ambient model-ambient)
    (gl:enable :lighting)
    (gl:enable :light0)
    (gl:enable :depth-test)

    ;; Create 4 display lists, each with a different quadric object.
    ;; Different drawing styles and surface normal specifications
    ;; are demonstrated.
 
    (setf (start-list window) (gl:gen-lists 4))
    (setf quadric-obj (glu:new-quadric))
    
    ;;todo
    ;; gluQuadricCallback(qobj, GLU_ERROR, 
    ;;                       (GLvoid (CALLBACK*) ()) errorCallback);

    (glu:quadric-draw-style quadric-obj :fill) ;;smooth shaded
    (glu:quadric-normals quadric-obj :smooth)
    (gl:with-new-list ((start-list window) :compile)
      (glu:sphere quadric-obj 0.75 15 10))

    (glu:quadric-draw-style quadric-obj :fill) ;;flat shaded
    (glu:quadric-normals quadric-obj :flat)
    (gl:with-new-list ((1+ (start-list window)) :compile)
      (glu:cylinder quadric-obj 0.5 0.3 1 15 5))

    (glu:quadric-draw-style quadric-obj :line) ;;all polygons wireframe
    (glu:quadric-normals quadric-obj :none)
    (gl:with-new-list ((+ 2 (start-list window)) :compile)
      (glu:disk quadric-obj 0.25 1 20 4))

    (glu:quadric-draw-style quadric-obj :silhouette) ;;boundary only
    (glu:quadric-normals quadric-obj :none)
    (gl:with-new-list ((+ 3 (start-list window)) :compile)
      (glu:partial-disk quadric-obj 0 1 20 4 0 225))
    
    (glu:delete-quadric quadric-obj)))

(defmethod glut:display ((window quadric-window))
  (gl:clear :color-buffer :depth-buffer-bit)
  (gl:with-pushed-matrix 
    (gl:enable :lighting)
    (gl:shade-model :smooth)
    (gl:translate -1.0 -1.0 0.0)
    (gl:call-list (start-list window))
    (gl:shade-model :flat)
    (gl:translate 0.0 2.0 0.0)
    (gl:with-pushed-matrix
      (gl:rotate 300.0 1.0 0.0 0.0)
      (gl:call-list (1+ (start-list window))))
    (gl:disable :lighting)
    (gl:color 0.0 1.0 1.0)
    (gl:translate 2.0 -2.0 0.0)
    (gl:call-list (+ 2 (start-list window)))
    (gl:color 1.0 1.0 0.0)
    (gl:translate 0.0 2.0 0.0)
    (gl:call-list (+ 3 (start-list window))))
  (gl:flush))

(defmethod glut:reshape ((w quadric-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)

  (if (<= width height)
      (gl:ortho -2.5 2.5 (/ (* -2.5 height) width)
		(/ (* 2.5 height) width) -10.0 10.0)
      (gl:ortho (/ (* -2.5 width) height) (/ (* 2.5 width) height)
		-2.5 2.5 -10 10))
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((w quadric-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun rb-quadric ()
  (glut:display-window (make-instance 'quadric-window)))