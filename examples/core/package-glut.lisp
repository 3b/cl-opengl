(defpackage #:cl-opengl-examples/core/glut
  (:use :cl)
  (:local-nicknames (#:a #:alexandria-2)
                    (#:x #:cl-opengl-examples/core))
  (:export #:gears
           #:render-to-texture))
