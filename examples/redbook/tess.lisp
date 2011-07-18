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

(defclass tess-window (glut:window)
  ((start-list :accessor start-list))
  (:default-initargs :width 500 :height 500 :title "tess.lisp"
                     :mode '(:single :rgb)))

(defclass example-tessellator (glu:tessellator)
  ())

(defclass star-tessellator (glu:tessellator)
  ())

(defmethod glut:display-window :before ((window tess-window))
  (let ((tobj (make-instance 'example-tessellator))
        (rect '((50 50 0)
                (200 50 0)
                (200 200 0)
                (50 200 0)))
        (tri '((75 75 0)
               (125 175 0)
               (175 75 0)))
        (star '((250 50 0 1 0 1)
                (325 200 0 1 1 0)
                (400 50 0 0 1 1)
                (250 150 0 1 0 0)
                (400 150 0 0 1 0))))
    
    (gl:clear-color 0 0 0 0)
    (setf (start-list window) (gl:gen-lists 2))
    
    ;; need to initialize tess property in case it is messed up
    (glu:tess-property tobj :winding-rule :positive)
    
    ;;rectangle with triangular hole inside
    (gl:with-new-list ((start-list window) :compile)
      (gl:shade-model :flat)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for coords in rect
             do (glu:tess-vertex tobj coords coords)))
        (glu:with-tess-contour tobj
          (loop for coords in tri
             do (glu:tess-vertex tobj coords coords)))))
    (glu:tess-delete tobj)
    
    ;;smooth shaded, self-intersecting star
    (setf tobj (make-instance 'star-tessellator))
    (gl:with-new-list ((1+ (start-list window)) :compile) 
      (gl:shade-model :smooth)
      (glu:tess-property tobj :winding-rule :positive)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for coords in star
             do (glu:tess-vertex tobj coords coords)))))
    (glu:tess-delete tobj)))

(defmethod glut:display ((window tess-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:call-list (start-list window))
  (gl:call-list (1+ (start-list window)))
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

(defmethod glu:vertex-data-callback ((tess example-tessellator) vertex-data polygon-data)
  (gl:vertex (first vertex-data) (second vertex-data) (third vertex-data)))

(defmethod glu:vertex-data-callback ((tess star-tessellator) vertex-data polygon-data)
  (gl:color (fourth vertex-data) (fifth vertex-data) (sixth vertex-data))
  (gl:vertex (first vertex-data) (second vertex-data) (third vertex-data)))

(defmethod glu:combine-data-callback ((tess star-tessellator) coords vertex-data weight polygon-data)
  (nconc 
    (loop for i from 0 below 3
       collect (gl:glaref coords i))
    
    (loop for i from 3 below 6
       collect (+ (* (gl:glaref weight 0) 
                     (nth i (aref vertex-data 0)))
                  (* (gl:glaref weight 1) 
                     (nth i (aref vertex-data 1)))
                  (* (gl:glaref weight 2) 
                     (nth i (aref vertex-data 2)))
                  (* (gl:glaref weight 3) 
                     (nth i (aref vertex-data 3)))))))

(defun rb-tess ()
  (glut:display-window (make-instance 'tess-window)))
