;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; varray.lisp --- Lisp version of varray.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates vertex arrays.

(in-package #:cl-glut-examples)

(defclass varray-window (glut:window)
  ((setup-method :accessor setup-method :initform 'pointer)
   (deref-method :accessor deref-method :initform 'draw-array)))

(defun setup-pointers ()
  ;; XXX TODO
#||
     static GLint vertices[] = {25, 25,
                       100, 325,
                       175, 25,
                       175, 325,
                       250, 25,
                       325, 325};
   static GLfloat colors[] = {1.0, 0.2, 0.2,
                       0.2, 0.2, 1.0,
                       0.8, 1.0, 0.2,
                       0.75, 0.75, 0.75,
                       0.35, 0.35, 0.35,
                       0.5, 0.5, 0.5};

   glEnableClientState (GL_VERTEX_ARRAY);
   glEnableClientState (GL_COLOR_ARRAY);

   glVertexPointer (2, GL_INT, 0, vertices);
   glColorPointer (3, GL_FLOAT, 0, colors);
||#   )

(defun setup-interlave ()
#||   static GLfloat intertwined[] =
      {1.0, 0.2, 1.0, 100.0, 100.0, 0.0,
       1.0, 0.2, 0.2, 0.0, 200.0, 0.0,
       1.0, 1.0, 0.2, 100.0, 300.0, 0.0,
       0.2, 1.0, 0.2, 200.0, 300.0, 0.0,
       0.2, 1.0, 1.0, 300.0, 200.0, 0.0,
       0.2, 0.2, 1.0, 200.0, 100.0, 0.0};
   
   glInterleavedArrays (GL_C3F_V3F, 0, intertwined);
  ||#)

(defmethod initialize-instance :after ((w varray-window) &key)
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :smooth)
  (setup-pointers))

(defmethod glut:display ((w varray-window))
  (gl:clear :color-buffer-bit)
  (ecase deref-method
    (draw-array
     (gl:draw-arrays :triangles 0 6))
    (array-element
     (gl:with-primitives :triangles
       (gl:array-element 2)
       (gl:array-element 3)
       (gl:array-element 5)))
    (draw-elements
     (gl:draw-elements :polygon 4 :unsigned-int '(0 1 3 4))))
  (gl:flush))

(defmethod glut:reshape ((w varray-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:mouse ((w varray-window) button state x y)
  (declare (ignore x y))
  (case button
    (:left-button
     (when (eql state :down)
       (case (setup-method varray-window)
         (pointer
          (setf (setup-method varray-window) 'interleaved)
          (setup-interleave))
         (interlaved
          (setf (setup-method varray-window) 'pointer)
          (setup-pointers)))
       (glut:post-redisplay)))
    ((:middle-button :right-button)
     (when (eql state :down)
       (setf (deref-method varray-window)
             (case (deref-method varray-window)
               (draw-array 'array-element)
               (array-element 'draw-elements)
               (draw-elements 'draw-array)))
       (glut:post-redisplay)))))

(defmethod glut:keyboard ((w varray-window) key x y)
  (declare (ignore x y))
  (case key
    (#\Esc (glut:leave-main-loop))))

;;; XXX verificar GL_VERSION_1_1

(defun rb-varray ()
  
  (glut:init-display-mode :single :rgb)
  (make-instance 'varray-window
                 :width 350 :height 350
                 :pos-x 100 :pos-y 100
                 :title "varray.lisp"
                 :events '(:display :reshape :mouse :keyboard))
  (glut:main-loop))