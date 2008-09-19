;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; extensions.lisp --- OpenGL extensions.
;;;
;;; Copyright (c) 2006, Oliver Markovic <entrox@entrox.org>
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

(in-package #:cl-opengl3)

;;;
;;; EXT_framebuffer_object
;;;

(import-export %gl3:is-renderbuffer
               %gl3:bind-renderbuffer)

(defun delete-renderbuffers (renderbuffers)
  (with-opengl-sequence (array '%gl3:uint renderbuffers)
    (%gl3:delete-renderbuffers (length renderbuffers) array)))

(defun gen-renderbuffers (count)
  (with-foreign-object (renderbuffer-array '%gl3:uint count)
    (%gl3:gen-renderbuffers count renderbuffer-array)
    (loop for i below count
          collecting (mem-aref renderbuffer-array '%gl3:uint i))))

(import-export %gl3:renderbuffer-storage)

#+nil
(defun get-renderbuffer-parameter (target pname)
  )

(import-export %gl3:is-framebuffer
               %gl3:bind-framebuffer)

(defun delete-framebuffers (framebuffers)
  (with-opengl-sequence (array '%gl3:uint framebuffers)
    (%gl3:delete-framebuffers (length framebuffers) array)))

(defun gen-framebuffers (count)
  (with-foreign-object (framebuffer-array '%gl3:uint count)
    (%gl3:gen-framebuffers count framebuffer-array)
    (loop for i below count
          collecting (mem-aref framebuffer-array '%gl3:uint i))))

(import-export %gl3:check-framebuffer-status
               %gl3:framebuffer-texture-1d
               %gl3:framebuffer-texture-2d
               %gl3:framebuffer-texture-3d
               %gl3:framebuffer-renderbuffer)

#+nil
(defun get-framebuffer-attachment-parameter (target attachment pname)
  (ecase pname
    (:framebuffer )))

(import-export %gl3:generate-mipmap)
