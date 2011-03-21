;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; tess-wind.lisp --- Lisp version of tesswind.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

(in-package #:cl-glut-examples)
(defparameter *current-winding* :odd)
(defparameter *current-shape* 0)
(defparameter *list* nil)

(defclass winding-tessellator (glu:tessellator)
  ())

(defclass tess-wind-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "tess-wind.lisp"
                     :mode '(:single :rgb)))

(defmethod glut:display ((w tess-wind-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:with-pushed-matrix 
    (gl:call-list *list*)
    (gl:translate 0 500 0)
    (gl:call-list (1+ *list*))
    (gl:translate 500 -500 0)
    (gl:call-list (+ *list* 2))
    (gl:translate 0 500 0)
    (gl:call-list (+ *list* 3)))
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

(defmethod glut:keyboard ((w tess-wind-window) key x y)
  (case key
    ((#\w #\W)
     (progn
       (cond ((equal *current-winding* :odd)
	      (setf *current-winding* :nonzero))
	     ((equal *current-winding* :nonzero)
	      (setf *current-winding* :positive))
	     ((equal *current-winding* :positive)
	      (setf *current-winding* :negative))
	     ((equal *current-winding* :negative)
	      (setf *current-winding* :abs-geq-two))
	     ((equal *current-winding* :abs-geq-two)
	      (setf *current-winding* :odd)))
       (make-new-lists)
       (glut:post-redisplay)))
    (#\Esc
     (glut:destroy-current-window))))



(defun make-new-lists ()
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
 
    (glu:tess-property tobj :winding-rule *current-winding*)
    
    (gl:with-new-list (*list* :compile)
      (glu:with-tess-polygon (tobj nil)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (elt rects i))))
        (glu:with-tess-contour tobj
          (loop for i from 4 below 8
             do (glu:tess-vertex tobj (elt rects i))))
        (glu:with-tess-contour tobj
          (loop for i from 8 below 12
             do (glu:tess-vertex tobj (elt rects i))))))
      
    (gl:with-new-list ((+ *list* 1) :compile)
      (glu:with-tess-polygon (tobj nil)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (elt rects i))))
        (glu:with-tess-contour tobj
          (loop for i from 7 downto 4
             do (glu:tess-vertex tobj (elt rects i))))

        (glu:with-tess-contour tobj
          (loop for i from 11 downto 8
             do (glu:tess-vertex tobj (elt rects i))))))
    
    (gl:with-new-list ((+ *list* 2) :compile)
      (glu:with-tess-polygon (tobj nil)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 16
             do (glu:tess-vertex tobj (elt spiral i))))))
    
    (gl:with-new-list ((+ *list* 3) :compile)
      (glu:with-tess-polygon (tobj nil)
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (elt quad1 i))))
        (glu:with-tess-contour tobj
          (loop for i from 0 below 4
             do (glu:tess-vertex tobj (elt quad2 i))))
        (glu:with-tess-contour tobj
          (loop for i from 0 below 3
             do (glu:tess-vertex tobj (elt tri i))))))))

(defmethod glu:vertex-data-callback ((tess winding-tessellator) vertex-data polygon-data)
    (gl:vertex (gl:glaref vertex-data 0)
               (gl:glaref vertex-data 1)
               (gl:glaref vertex-data 2)))

(defmethod glu:combine-data-callback ((tess winding-tessellator) coords vertex-data weight polygon-adata)
  (loop for i from 0 below 3
     collect (gl:glaref coords i)))

(defun init ()
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :flat)
  (setf *list* (gl:gen-lists 4))
  (make-new-lists))

(defun rb-tess-wind ()
  (setf glut:*run-main-loop-after-display* nil)
  (glut:display-window (make-instance 'tess-wind-window))
  (init)
  (glut:main-loop))