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

(defsystem cl-glut
  :description "Common Lisp bindings to Freeglut."
  :author "Luis Oliveira  <loliveira@common-lisp.net>"
  :version "0.1.0"
  :licence "BSD"
  :depends-on (alexandria cffi cl-opengl)
  :components
  ((:module "glut"
    :components
    ((:file "package")
     (:file "library"   :depends-on ("package"))
     (:file "state"     :depends-on ("library"))
     (:file "init"      :depends-on ("library" "state"))
     (:file "main"      :depends-on ("library" "init"))
     (:file "window"    :depends-on ("library"))
     (:file "overlay"   :depends-on ("library"))
     (:file "menu"      :depends-on ("library"))
     (:file "callbacks" :depends-on ("library"))
     (:file "misc"      :depends-on ("library"))
     (:file "fonts"     :depends-on ("library"))
     (:file "geometry"  :depends-on ("library"))
     (:file "interface"
            :depends-on ("init" "main" "window" "library" "callbacks"))))))

;; vim: ft=lisp et
