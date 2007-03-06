;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; stroke.lisp --- Lisp version of stroke.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; This program demonstrates some characters of a
;;; stroke (vector) font.  The characters are represented
;;; by display lists, which are given numbers which
;;; correspond to the ASCII values of the characters.
;;; Use of GL:CALL-LISTS is demonstrated.

(in-package #:cl-glut-examples)

(defclass stroke-window (glut:window)
  ()
  (:default-initargs :width 440 :height 120 :title "stroke.lisp"
                     :mode '(:single :rgb)))

;;; FIXME: like in the RB-LIST example we'll want some sort of
;;; mechanism to automatically deallocate display lists.

(defmethod glut:display-window :before ((w stroke-window))
  (let ((a '(#\A (0 0 pt) (0 9 pt) (1 10 pt) (4 10 pt) (5 9 pt) (5 0 stroke)
                 (0 5 pt) (5 5 end)))
        (e '(#\E (5 0 pt) (0 0 pt) (0 10 pt) (5 10 stroke) (0 5 pt) (4 5 end)))
        (p '(#\P (0 0 pt) (0 10 pt) (4 10 pt) (5 9 pt) (5 6 pt) (4 5 pt)
                 (0 5 end)))
        (r '(#\R (0 0 pt) (0 10 pt) (4 10 pt) (5 9 pt) (5 6 pt) (4 5 pt)
                 (0 5 stroke) (3 5 pt) (5 0 end)))
        (s '(#\S (0 1 pt) (1 0 pt) (4 0 pt) (5 1 pt) (5 4 pt) (4 5 pt) (1 5 pt)
                 (0 6 pt) (0 9 pt) (1 10 pt) (4 10 pt) (5 9 end))))
    ;; draw-letter interprets the instructions above
    (flet ((draw-letter (instructions)
             (gl:begin :line-strip)
             (loop for (x y what) in instructions do
                   (case what
                     (pt (gl:vertex x y))
                     (stroke (gl:vertex x y)
                             (gl:end)
                             (gl:begin :line-strip))
                     (end (gl:vertex x y)
                          (gl:end)
                          (gl:translate 8 0 0))))))
      ;; create a display list for each of 6 characters
      (gl:shade-model :flat)
      (let ((base (gl:gen-lists 128)))
        (gl:list-base base)
        (loop for char in (list a e p r s) do
              (gl:with-new-list ((+ base (char-code (car char))) :compile)
                (draw-letter (cdr char))))
        ;; space
        (gl:with-new-list ((+ base (char-code #\Space)) :compile)
          (gl:translate 8 0 0))))))

(defmethod glut:display ((w stroke-window))
  (flet ((print-stroked-string (string)
           (gl:call-lists (map 'vector #'char-code string))))
    (gl:clear :color-buffer)
    (gl:color 1 1 1)
    (gl:with-pushed-matrix
      (gl:scale 2 2 2)
      (gl:translate 10 30 0)
      (print-stroked-string "A SPARE SERAPE APPEARS AS"))
    (gl:with-pushed-matrix
      (gl:scale 2 2 2)
      (gl:translate 10 13 0)
      (print-stroked-string "APES PREPARE RARE PEPPERS"))
    (gl:flush)))

(defmethod glut:reshape ((w stroke-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w stroke-window) key x y)
  (declare (ignore x y))
  (case key
    (#\Space (glut:post-redisplay))
    (#\Esc (glut:destroy-current-window))))

(defun rb-stroke ()
  (glut:display-window (make-instance 'stroke-window)))
