;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; cl-glut-examples.asd --- ASDF system definition for various examples.
;;;
;;; Copyright (c) 2006, Luis Oliveira  <loliveira@common-lisp.net>
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

(defpackage #:cl-glut-examples-system
  (:use #:cl #:asdf))
(in-package #:cl-glut-examples-system)

(defsystem cl-glut-examples
  :description "Examples using cl-opengl, cl-glu and cl-glut."
  :depends-on (cffi cl-opengl cl-glu cl-glut)
  :components
  ((:module "examples"
    :components
    ((:module "redbook"
      :components
      (#+nil(:file "redbook")
       #+nil(:file "rb1-hello"  :depends-on ("redbook"))
       #+nil(:file "rb2-double" :depends-on ("redbook"))
       #+nil(:file "rb3-lines"  :depends-on ("redbook"))
       #+nil(:file "rb4-polys"  :depends-on ("redbook"))
       #+nil(:file "rb5-cube"   :depends-on ("redbook"))))
     (:module "mesademos"
      :components
      (#+nil(:file "mesademos")
       #+nil(:file "bounce"    :depends-on ("mesademos"))
       #+nil(:file "gamma"     :depends-on ("mesademos"))
       (:file "gears")
       (:file "gears-raw")
       #+nil(:file "offset"    :depends-on ("mesademos"))
       #+nil(:file "reflect"   :depends-on ("mesademos"))
       #+nil(:file "spin"      :depends-on ("mesademos"))
       #+nil(:file "tess-demo" :depends-on ("mesademos"))
       #+nil(:file "texobj"    :depends-on ("mesademos"))
       #+nil(:file "trdemo"    :depends-on ("mesademos"))))))))

;;; vim: ft=lisp et
