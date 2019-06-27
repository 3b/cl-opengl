;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; Copyright (c) 2004, Oliver Markovic <entrox@entrox.org>
;;;   All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;;  o Redistributions of source code must retain the above copyright notice,
;;;    this list of conditions and the following disclaimer.
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;  o Neither the name of the author nor the names of the contributors may be
;;;    used to endorse or promote products derived from this software without
;;;    specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(defsystem cl-opengl
  :description "Common Lisp bindings to OpenGL."
  :license "BSD"
  :depends-on (cffi alexandria float-features)
  :components
  ((:module "gl"
    :serial t
    :components
    ((:file "bindings-package")
     (:file "constants")
     (:file "library")
     (:file "bindings")
     (:file "types")
     (:file "funcs-gl-glcore-gles1-gles2-glsc2")
     (:file "funcs-gl-glcore-gles1-gles2")
     (:file "funcs-gl-glcore-gles2-glsc2")
     (:file "funcs-gl-glcore-gles2")
     (:file "funcs-gl-glcore")
     (:file "funcs-gl-gles1-gles2-glsc2")
     (:file "funcs-gl-gles1-gles2")
     (:file "funcs-gl-gles1")
     (:file "funcs-gl-gles2-glsc2")
     (:file "funcs-gl-gles2")
     (:file "funcs-gl")
     (:file "funcs-gles1-gles2")
     (:file "funcs-gles1")
     (:file "funcs-gles2")
     ;; Lispifications.
     (:file "package")
     (:file "util")
     (:file "opengl")
     (:file "rasterization")
     (:file "framebuffer")
     (:file "special")
     (:file "state")
     (:file "dsa")
     (:file "extensions")))))

;;; load libGLESv2 instead of libGL, and only load es2 functioons
(defsystem cl-opengl/es2
  :description "Common Lisp bindings to OpenGLES2/3."
  :license "BSD"
  :depends-on (cffi alexandria float-features)
  :components
  ((:module "gl"
    :serial t
    :components
    ((:file "bindings-package")
     (:file "constants")
     (:file "library-glesv2")
     (:file "bindings")
     (:file "types")
     (:file "funcs-gl-glcore-gles1-gles2-glsc2")
     (:file "funcs-gl-glcore-gles1-gles2")
     (:file "funcs-gl-glcore-gles2-glsc2")
     (:file "funcs-gl-glcore-gles2")
     (:file "funcs-gl-gles1-gles2-glsc2")
     (:file "funcs-gl-gles1-gles2")
     (:file "funcs-gl-gles2-glsc2")
     (:file "funcs-gl-gles2")
     (:file "funcs-gles1-gles2")
     (:file "funcs-gles2")
     ;; Lispifications.
     (:file "package")
     (:file "util")
     (:file "opengl")
     (:file "rasterization")
     (:file "framebuffer")
     (:file "special")
     (:file "state")
     (:file "dsa")
     (:file "extensions")))))
