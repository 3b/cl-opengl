;;; generated file, do not edit
;;; glext version 20231206 ( 2023-12-06T16:19:18Z )


(in-package #:cl-opengl-bindings)

(declaim (type (simple-array function (2959)) *init-ext-thunks* *ext-thunks*))
;; vector of thunks used to load extension functions, initialized by
;; defglextfun while loading bindings.
(defvar *init-ext-thunks* (make-array 2959
                                      :element-type :function
                                      :initial-contents (loop for i below 2959
                                                              collect (missing-thunk i))))
;; vector of thunks used to call extension functions, initialized to copy
;; of *init-ext-thunks* and modified as functions are used.
(defvar *ext-thunks* (copy-seq *init-ext-thunks*))
