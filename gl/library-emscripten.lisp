(in-package #:cl-opengl-bindings)

;; need to define this even though we don't load anything, because we
;; specify it in ffi bindings.
(cffi:define-foreign-library opengl)
