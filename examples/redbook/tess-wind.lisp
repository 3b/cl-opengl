;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; tess-wind.lisp --- Lisp version of tesswind.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

(in-package #:cl-glut-examples)


(defclass winding-tessellator (glu:tessellator)
  ())

(defclass tess-wind-window (glut:window)
  ((current-winding :accessor current-winding :initform :odd)
   (wind-list :accessor wind-list))
  (:default-initargs :width 500 :height 500 :title "tess-wind.lisp"
                     :mode '(:single :rgb)))

(defmethod glut:display-window :before ((window tess-wind-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat)
  (setf (wind-list window) (gl:gen-lists 4))
  (make-new-lists window))

(defmethod glut:display ((window tess-wind-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:with-pushed-matrix 
    (gl:call-list (wind-list window))
    (gl:translate 0 500 0)
    (gl:call-list (1+ (wind-list window)))
    (gl:translate 500 -500 0)
    (gl:call-list (+ 2 (wind-list window)))
    (gl:translate 0 500 0)
    (gl:call-list (+ 3 (wind-list window))))
  (gl:flush))

(defmethod glut:reshape ((w tess-wind-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (if (<= width height)
      (glu:ortho-2d 0 1000 0 (* 1000 (/ height width)))
      (glu:ortho-2d 0 (* 1000 (/ width height)) 0 1000))
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((window tess-wind-window) key x y)
  (case key
    ((#\w #\W)
     (progn
       (cond ((equal (current-winding window) :odd)
              (setf (current-winding window) :nonzero))
	     ((equal (current-winding window) :nonzero)
	      (setf (current-winding window) :positive))
	     ((equal (current-winding window) :positive)
	      (setf (current-winding window) :negative))
	     ((equal (current-winding window) :negative)
	      (setf (current-winding window) :abs-geq-two))
	     ((equal (current-winding window) :abs-geq-two)
	      (setf (current-winding window) :odd)))
       (make-new-lists window)
       (glut:post-redisplay)))
    (#\Esc
     (glut:destroy-current-window))))

(defmethod glu:vertex-data-callback ((tess winding-tessellator) vertex-data polygon-data)
  (gl:vertex (first vertex-data)(second vertex-data)(third vertex-data)))

(defmethod glu:combine-data-callback ((tess winding-tessellator) coords vertex-data weight polygon-data)
  (loop for i from 0 below 3
     collect (gl:glaref coords i)))

(defun make-new-lists (window)
  (let ((tobj (make-instance 'winding-tessellator))
	(rects '((50 50 0) (300 50 0) 
		 (300 300 0) (50 300 0)
		 (100 100 0) (250 100 0) 
		 (250 250 0) (100 250 0)
		 (150 150 0) (200 150 0) 
		 (200 200 0) (150 200 0)))
	(spiral '((400 250 0) (400 50 0)
		  (50 50 0) (50 400 0) 
		  (350 400 0) (350 100 0) 
		  (100 100 0) (100 350 0) 
		  (300 350 0) (300 150 0) 
		  (150 150 0) (150 300 0) 
		  (250 300 0) (250 200 0) 
		  (200 200 0) (200 250 0)))
	(quad1 '((50 150 0) (350 150 0) 
		 (350 200 0) (50 200 0)))
	(quad2 '((100 100 0) (300 100 0)
		 (300 350 0) (100 350 0)))
	(tri '((200 50 0) (250 300 0)
	       (150 300 0))))
 
    (glu:tess-property tobj :winding-rule (current-winding window))
    
    (gl:with-new-list ((wind-list window) :compile)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))
        (glu:with-tess-contour tobj
          (loop for i from 4 below 8
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))
        (glu:with-tess-contour tobj
          (loop for i from 8 below 12
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))))
      
    (gl:with-new-list ((1+ (wind-list window)) :compile)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))
        (glu:with-tess-contour tobj
          (loop for i from 7 downto 4
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))
        (glu:with-tess-contour tobj
          (loop for i from 11 downto 8
             do (glu:tess-vertex tobj (nth i rects)(nth i rects))))))
    
    (gl:with-new-list ((+ 2 (wind-list window)) :compile)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for coords in spiral
             do (glu:tess-vertex tobj coords coords)))))
    
    (gl:with-new-list ((+ 3 (wind-list window)) :compile)
      (glu:with-tess-polygon (tobj)
        (glu:with-tess-contour tobj
          (loop for coords in quad1
             do (glu:tess-vertex tobj coords coords)))
        (glu:with-tess-contour tobj
          (loop for coords in quad2
             do (glu:tess-vertex tobj coords coords)))
        (glu:with-tess-contour tobj
          (loop for coords in tri
             do (glu:tess-vertex tobj coords coords)))))
    (glu:tess-delete tobj)))

(defun rb-tess-wind ()
  (glut:display-window (make-instance 'tess-wind-window)))