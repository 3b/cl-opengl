;;; override values from gl.xml

(:enum "enum"
       ;; gl and gles have different values for GL_ACTIVE_PROGRAM_EXT
       ;; so force the GL value (see below for ES value)
       (:active-program-ext #x8b8d))

(:enum "GetProgramPipelineExtPname"
       ;; gles version of EXT_separate_shader_objects
       ;; uses a different value for GL_ACTIVE_PROGRAM_EXT from normal GL,
       ;; so define a separate enum for that param
       (:active-program-ext #x8259)
       (:vertex-shader (:import "ShaderType"))
       (:fragment-shader (:import "ShaderType"))
       (:validate-status (:import "enum"))
       (:info-log-length (:import "enum")))

(:func "glGetProgramPipelineivEXT"
       "void"
       (:NAME "pipeline" :TYPE "GLuint")
       ;; one of the possible enums has different values in gl and gles,
       ;; so use a custom enum for it (see GetProgramPipelineExtPname above)
       (:NAME "pname" :TYPE "GetProgramPipelineExtPname")
       (:NAME "params" :TYPE "GLint"))

(:func "glUseProgramStages"
       "void"
       (:NAME "pipeline" :TYPE "GLuint")
       ;; spec.xml doesn't specify type
       (:NAME "stages" :TYPE "UseProgramStageMask")
       (:NAME "program" :TYPE "GLuint"))

(:func "glUseProgramStagesEXT"
       "void"
       (:NAME "pipeline" :TYPE "GLuint")
       ;; spec.xml doesn't specify type
       (:NAME "stages" :TYPE "UseProgramStageMask")
       (:NAME "program" :TYPE "GLuint"))
