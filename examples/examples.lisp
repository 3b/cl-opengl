;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-

(defpackage #:cl-glut-examples
  (:use #:cl)
  (:export #:list-examples #:run-examples
           #:gl-info))

(in-package #:cl-glut-examples)

(defparameter +examples+
  '(("Redbook Examples"
     rb-double rb-hello #|rb-varray|# rb-lines rb-polys rb-cube rb-model
     rb-clip rb-planet rb-robot rb-list rb-stroke rb-smooth rb-movelight rb-tess rb-tess-wind rb-quadric rb-bezcurve)
    ("Mesa Demos"
     gears)
    ("SGI Samples")
    ("Other Examples"
     glut-teapot
     render-to-texture
     misc-opengl-array
     shader-vao
     molview)))

;;; export symbols
(dolist (section +examples+)
  (export (cdr section) '#:cl-glut-examples))

(defun list-examples ()
  (format t "~&CL-GLUT-EXAMPLES contains the following examples:~%~%")
  (dolist (section +examples+)
    (format t "~&~A:~%~{~@[~<~%~:; ~:@(~A~)~>~]~}~%~%"
            (car section) (cdr section))))

(defun run-examples ()
  "Run all the CL-GLUT examples."
  (let ((glut:*run-main-loop-after-display* nil))
    (dolist (section +examples+)
      (mapc #'funcall (cdr section)))
    (glut:main-loop)))
