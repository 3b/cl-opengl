;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; cl-glut-examples.asd --- ASDF system definition for various examples.
;;;
;;; Copyright (c) 2006-2007, Luis Oliveira  <loliveira@common-lisp.net>
;;;   All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;  o Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;  o Neither the name of the author nor the names of the contributors may
;;;    be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;; A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(defsystem cl-glut-examples
  :description "Examples using cl-opengl, cl-glu and cl-glut."
  :depends-on (cffi cl-opengl cl-glu cl-glut)
  :components
  ((:module "examples"
    :components
    ((:file "examples")
     (:module "redbook"
      :depends-on ("examples")
      :components
      ((:file "hello")
       (:file "double")
       (:file "lines")
       (:file "polys")
       (:file "cube")
       (:file "model")
       (:file "clip")
       (:file "planet")
       (:file "robot")
       (:file "list")
       (:file "stroke")
       (:file "smooth")
       (:file "movelight")
       (:file "tess")
       (:file "tess-wind")
       (:file "quadric")
       (:file "bezcurve")))
     (:module "mesademos"
      :depends-on ("examples")
      :components
      ((:file "gears-raw")
       #+nil(:file "bounce")
       #+nil(:file "gamma")
       (:file "gears")
       #+nil(:file "offset")
       #+nil(:file "reflect")
       #+nil(:file "spin")
       #+nil(:file "tess-demo")
       #+nil(:file "texobj")
       #+nil(:file "trdemo")))
     (:module "misc"
      :depends-on ("examples")
      :components
      ((:file "glut-teapot")
       (:file "render-to-texture")
       (:file "opengl-array")
       (:file "shader-vao")
       (:file "molview")
       (:file "gl-info")))))))

;;; vim: ft=lisp et
