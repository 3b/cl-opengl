;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; tess.lisp --- Lisp version of tess.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; 
;;; This program demonstrates polygon tessellation.
;;; Two tesselated objects are drawn.  The first is a
;;; rectangle with a triangular hole.  The second is a
;;; smooth shaded, self-intersecting star.
;;;
;;; Note the exterior rectangle is drawn with its vertices
;;; in counter-clockwise order, but its interior clockwise.
;;; Note the combineCallback is needed for the self-intersecting
;;; star.  Also note that removing the TessProperty for the
;;; star will make the interior unshaded (WINDING_ODD).

(in-package #:cl-glut-examples)

;;;GLuint startList;
(defparameter *start-list* nil)

(defclass tess-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "tess.lisp"
                     :mode '(:single :rgb)))

(defclass example-tessellator (glu:tessellator)
  ())

(defmethod glut:display ((w tess-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:call-list *start-list*)
  (gl:call-list (1+ *start-list*))
  (gl:flush))

(defmethod glut:reshape ((w tess-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w tess-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defmethod glu:tess-vertex-data-cb ((tess example-tessellator) vertex-data polygon-data)
  (let ((varray (gl::make-gl-array-from-pointer vertex-data '%gl:double 3)))
    (format t "vertex ~a,~a,~a~%" 
            (gl:glaref varray 0)
            (gl:glaref varray 1)
            (gl:glaref varray 2))
    (gl:vertex (gl:glaref varray 0)
               (gl:glaref varray 1))))

(defmethod glu:tess-combine-data-cb ((tess example-tessellator) coords vertex-data weight data-out polygon-data)
;;TODO figure this out
  ;(let ((varray (gl::make-gl-array-from-pointer vertex-data '%gl:double 3)))
)

(defun init ()
  (let ((tobj (make-instance 'example-tessellator))
        (rect '((50.0 50.0 0.0)
                (200.0 50.0 0.0)
                (200.0 200.0 0.0)
                (50.0 200.0 0.0)))
        (tri '((75.0 75.0 0.0)
               (125.0 175.0 0.0)
               (175.0 75.0 0.0)))
        (star '((250.0 50.0 0.0 1.0 0.0 1.0)
                  (325.0 200.0 0.0 1.0 1.0 0.0)
                  (400.0 50.0 0.0 0.0 1.0 1.0)
                  (250.0 150.0 0.0 1.0 0.0 0.0)
                  (400.0 150.0 0.0 0.0 1.0 0.0))))

    (gl:clear-color 0 0 0 0)
    (setf *start-list* (gl:gen-lists 2))
    
    ;;rectangle with triangular hole inside
    (gl:new-list *start-list* :compile)
    (gl:shade-model :flat)
    (glu:tess-begin-polygon tobj nil)
    (glu:tess-begin-contour tobj)
    (loop for coords in rect
       do (glu:tess-vertex tobj coords))
    (glu:tess-end-contour tobj)
    
    (glu:tess-begin-contour tobj)
    (loop for coords in tri
       do (glu:tess-vertex tobj coords))
    (glu:tess-end-contour tobj)
    (glu:tess-end-polygon tobj)
    (gl:end-list)

  ;;;; smooth shaded, self-intersecting star
  (gl:new-list (1+ *start-list*) :compile)
  (gl:shade-model :smooth)
  (glu:tess-property tobj :tess-winding-rule :tess-winding-positive)
  (glu:tess-begin-polygon tobj nil)
  (glu:tess-begin-contour tobj)
  (loop for coords in star
       do (glu:tess-vertex tobj coords))                           
  (glu:tess-end-contour tobj)
  (glu:tess-end-polygon tobj)
  (gl:end-list)))

(defun rb-tess ()
  (setf glut:*run-main-loop-after-display* nil)
  (glut:display-window (make-instance 'tess-window))
  (init)
  (glut:main-loop))
