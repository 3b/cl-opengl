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
  :depends-on (cffi)
  :components
  ((:module "gl"
    :components
    ((:file "bindings-package")
     (:file "bindings" :depends-on ("bindings-package"))
     (:file "types" :depends-on ("bindings-package"))
     (:file "library" :depends-on ("bindings-package"))
     (:file "constants" :depends-on ("bindings"))
     (:file "funcs" :depends-on ("bindings" "constants" "library" "types"))
     ;; Lispifications.
     (:file "package" :depends-on ("bindings-package"))
     (:file "util" :depends-on ("constants" "types" "package"))
     (:file "opengl" :depends-on ("funcs" "util"))
     (:file "rasterization" :depends-on ("funcs" "util"))
     (:file "framebuffer" :depends-on ("funcs" "util"))
     (:file "special" :depends-on ("funcs" "util" "constants"))
     (:file "state" :depends-on ("funcs" "util"))
     (:file "extensions" :depends-on ("funcs" "util"))))))
