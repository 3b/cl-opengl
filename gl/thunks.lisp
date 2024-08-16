;;; generated file, do not edit
;;; glext version 20240815 ( 2024-08-15T14:04:09Z )


(in-package #:cl-opengl-bindings)

(declaim (type (simple-array function (3296)) *init-ext-thunks* *ext-thunks*))
;; vector of thunks used to load extension functions, initialized by
;; defglextfun while loading bindings.
(defvar *init-ext-thunks* (make-array 3296
                                      :element-type 'function
                                      :initial-contents (loop for i below 3296
                                                              collect (missing-thunk i))))
;; vector of thunks used to call extension functions, initialized to copy
;; of *init-ext-thunks* and modified as functions are used.
(defvar *ext-thunks* (copy-seq *init-ext-thunks*))
