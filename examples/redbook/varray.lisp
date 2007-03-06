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
   (deref-method :accessor deref-method :initform 'draw-array))
  (:default-initargs :width 350 :height 350 :title "varray.lisp"
                     :mode '(:single :rgb)))

(defun setup-pointers ()
  (let ((vertices '(25 25
                    100 325
                    175 25
                    175 325
                    250 25
                    325 325))
        (colors '(1.0 0.2 0.2
                  0.2 0.2 1.0
                  0.8 1.0 0.2
                  0.75 0.75 0.75
                  0.35 0.35 0.35
                  0.5 0.5 0.5)))
    (gl:enable-client-state :vertex-array)
    (gl:enable-client-state :color-array)
    (gl:vertex-pointer 2 :int 0 vertices)
    (gl:color-pointer 3 :float 0 colors)))

(defun setup-interleave ()
  (let ((intertwined '(1.0 0.2 1.0 100.0 100.0 0.0
                       1.0 0.2 0.2 0.0 200.0 0.0
                       1.0 1.0 0.2 100.0 300.0 0.0
                       0.2 1.0 0.2 200.0 300.0 0.0
                       0.2 1.0 1.0 300.0 200.0 0.0
                       0.2 0.2 1.0 200.0 100.0 0.0)))
    (gl:interleaved-arrays :c3f-v3f 0 intertwined)))

(defmethod glut:display-window :before ((w varray-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :smooth)
  (setup-pointers))

(defmethod glut:display ((w varray-window))
  (gl:clear :color-buffer)
  (ecase (deref-method w)
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
       (case (setup-method w)
         (pointer
          (setf (setup-method w) 'interleaved)
          (setup-interleave))
         (interleaved
          (setf (setup-method w) 'pointer)
          (setup-pointers)))
       (glut:post-redisplay)))
    ((:middle-button :right-button)
     (when (eql state :down)
       (setf (deref-method w)
             (ecase (deref-method w)
               (draw-array 'array-element)
               (array-element 'draw-elements)
               (draw-elements 'draw-array)))
       (glut:post-redisplay)))))

(defmethod glut:keyboard ((w varray-window) key x y)
  (declare (ignore x y))
  (case (code-char key)
    (#\Esc (glut:leave-main-loop))))

;;; XXX verificar GL_VERSION_1_1

(defun rb-varray ()
  (glut:display-window (make-instance 'varray-window)))






