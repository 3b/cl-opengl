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

(defparameter *start-list* nil)

(defclass tess-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "tess.lisp"
                     :mode '(:single :rgb)))

(defclass example-tessellator (glu:tessellator)
  ())

(defclass star-tessellator (glu:tessellator)
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
    (gl:vertex (gl:glaref varray 0)
               (gl:glaref varray 1)
               (gl:glaref varray 3))))

(defmethod glu:tess-vertex-data-cb ((tess star-tessellator) vertex-data polygon-data)
  (let ((varray (gl::make-gl-array-from-pointer vertex-data '%gl:double 6)))
        (gl:color (gl:glaref varray 3) (gl:glaref varray 4) (gl:glaref varray 5))
        (gl:vertex (gl:glaref varray 0) (gl:glaref varray 1) (gl:glaref varray 2))))

(defmethod glu:tess-combine-data-cb ((tess star-tessellator) coords vertex-data weight data-out polygon-adata)
  (let ((vertex (cffi:foreign-alloc '%gl:double :count 6)))
    (loop for i from 0 below 3
       do (setf (cffi:mem-aref vertex '%gl:double i)
                (cffi:mem-aref coords '%gl:double i)))
    
    (loop for i from 3 below 6
         do (setf (cffi:mem-aref vertex '%gl:double i)
                  (+ 
                   (* (cffi:mem-aref weight '%gl:float 0)
                      (cffi:mem-aref (cffi:mem-aref vertex-data :pointer 0) '%gl:double i))
                   (* (cffi:mem-aref weight '%gl:float 1)
                      (cffi:mem-aref (cffi:mem-aref vertex-data :pointer 1) '%gl:double i))
                   (* (cffi:mem-aref weight '%gl:float 2)
                      (cffi:mem-aref (cffi:mem-aref vertex-data :pointer 2) '%gl:double i))
                   (* (cffi:mem-aref weight '%gl:float 3)
                      (cffi:mem-aref (cffi:mem-aref vertex-data :pointer 3) '%gl:double i)))))
    (setf (cffi:mem-ref data-out :pointer) vertex)))

(defun init ()
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
    (setf tobj (make-instance 'star-tessellator))
    (gl:new-list (1+ *start-list*) :compile)
    (gl:shade-model :smooth)
    (glu:tess-property tobj :tess-winding-rule glu:+tess-winding-positive+)
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
