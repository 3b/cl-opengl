(defpackage #:cl-opengl-library
  (:use #:cl #:cffi)
  (:export #:load-opengl-library
           #:close-opengl-library))

(in-package #:cl-opengl-bindings)

(defun cl-opengl-library:load-opengl-library ()
  (load-foreign-library 'opengl))

(defun cl-opengl-library:close-opengl-library ()
  (close-foreign-library 'opengl))
