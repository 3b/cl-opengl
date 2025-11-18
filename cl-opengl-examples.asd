
(defsystem cl-opengl-examples/%core
  :description "Some examples using core profile OpenGL (user code must
 provide an opengl context and other IO). Internal system, use one of
 the below systems to also load a particular subset of OpenGL."
  :depends-on (sb-cga)
  :components
  ((:module "examples"
    :components
    ((:module "core"
      :serial t
      :components
      ((:file "package")
       (:file "common")
       (:file "shaders")
       (:file "gears-common")
       (:file "teapot")
       (:file "rtt-common")))))))

(defsystem cl-opengl-examples/core
  :description "Some examples using core profile OpenGL (user code must
 provide an opengl context and other IO)."
  :depends-on (cl-opengl cl-opengl-examples/%core))

(defsystem cl-opengl-examples/core/es2
  :description "Some examples using (WebGL2 subset of) OpenGLES3 (user
 code must provide an opengl context and other IO)."
  :depends-on (cl-opengl/es2 cl-opengl-examples/%core))

(defsystem cl-opengl-examples/core/emscripten
  :description "Some examples using emscripten's WebGL2 subset of OpenGLES3
 (user code must provide an opengl context and other IO)."
  :depends-on (cl-opengl/emscripten cl-opengl-examples/%core))

(defsystem cl-opengl-examples/core/glut
  :description "cl-glut wrappers for the core examples"
  :depends-on (cl-opengl-examples/core cl-glut)
  :serial t
  :components
  ((:module "examples"
    :components
    ((:module "core"
      :serial t
      :components
      ((:file "package-glut")
       (:file "gears-glut")
       (:file "render-to-texture-glut")))))))

(defsystem cl-opengl-examples
  :description "Some examples using core profile OpenGL and cl-glut. See
 other systems in this .asd for options using other GL variants, or
 for use without GLUT."
  :depends-on (cl-opengl-examples/core/glut cl-glut-examples))
