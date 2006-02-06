;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; cl-glut.asd --- ASDF system definition for cl-glut.
;;;
;;; Copyright (C) 2006, Luis Oliveira  <loliveira@common-lisp.net>
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

(defpackage #:cl-glut-system
  (:use #:cl #:asdf))
(in-package #:cl-glut-system)

(defsystem cl-glut
  :description "Common Lisp bindings to Freeglut."
  :author "Luis Oliveira  <loliveira@common-lisp.net>"
  :version "0.1.0"
  :licence "BSD"
  :depends-on (cffi cl-opengl)
  :components
  ((:module "glut"
    :components
    ((:file "package")
     (:file "library"   :depends-on ("package"))
     (:file "types"     :depends-on ("library"))
     (:file "state"     :depends-on ("types"))
     (:file "init"      :depends-on ("types" "state"))
     (:file "main"      :depends-on ("types" "init"))     
     (:file "window"    :depends-on ("types"))
     (:file "overlay"   :depends-on ("types"))
     (:file "menu"      :depends-on ("types"))
     (:file "callbacks" :depends-on ("types"))
     (:file "misc"      :depends-on ("types")) 
     (:file "fonts"     :depends-on ("types"))
     (:file "geometry"  :depends-on ("types"))
     (:file "interface"
            :depends-on ("init" "main" "window" "types" "callbacks"))))))

;; vim: ft=lisp et
