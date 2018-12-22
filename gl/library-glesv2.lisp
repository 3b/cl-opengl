(in-package #:cl-opengl-bindings)

;;; we can't use libGL and libGLES* at the same time, so try to detect
;;; conflicts and complain

;;; either the lisp doesn't support specifying which library to use
;;; (most lisps, indicated by cffi-features:flat-namespace in
;;; *features*) or we specified it should use the one from library
;;; named by OPENGL when defining the function, so we need to use that
;;; name (or fix how they are defined, but it still wouldn't work
;;; right on the other lisps, so only supporting using 1 at a time for now)


;; fixme: figure out how to tell if cffi hasn't seen a definition for
;; OPENGL library yet
(when (and (ignore-errors (foreign-library-loaded-p 'opengl))
           (not (search "glesv2"
                        (string-downcase
                         (pathname-name
                          (cffi:foreign-library-pathname 'opengl))))))
  (cerror "load libGLESv2"
          "trying to load cl-opengl against libGLESv2, but ~s is already loaded"
          (namestring
           (cffi:foreign-library-pathname 'opengl)))
  (close-foreign-library 'opengl))

(define-foreign-library opengl
  (t (:default "libGLESv2")))

(use-foreign-library opengl)


