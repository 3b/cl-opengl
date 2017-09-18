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

(in-package #:cl-opengl)

;;;
;;; EXT_framebuffer_object
;;;

(import-export %gl:is-renderbuffer-ext
               %gl:bind-renderbuffer-ext
               %gl:is-renderbuffer
               %gl:bind-renderbuffer)

(defun delete-renderbuffers (renderbuffers)
  (with-opengl-sequence (array '%gl:uint renderbuffers)
    (%gl:delete-renderbuffers (length renderbuffers) array)))

(defun gen-renderbuffers (count)
  (with-foreign-object (renderbuffer-array '%gl:uint count)
    (%gl:gen-renderbuffers count renderbuffer-array)
    (loop for i below count
          collecting (mem-aref renderbuffer-array '%gl:uint i))))

(defun gen-renderbuffer ()
  (with-foreign-object (renderbuffer '%gl:uint 1)
    (%gl:gen-renderbuffers 1 renderbuffer)
    (mem-aref renderbuffer '%gl:uint 0)))


(defun delete-renderbuffers-ext (renderbuffers)
  (with-opengl-sequence (array '%gl:uint renderbuffers)
    (%gl:delete-renderbuffers-ext (length renderbuffers) array)))

(defun gen-renderbuffers-ext (count)
  (with-foreign-object (renderbuffer-array '%gl:uint count)
    (%gl:gen-renderbuffers-ext count renderbuffer-array)
    (loop for i below count
          collecting (mem-aref renderbuffer-array '%gl:uint i))))

(import-export %gl:renderbuffer-storage %gl:renderbuffer-storage-ext
               %gl:renderbuffer-storage-multisample %gl:renderbuffer-storage-multisample-ext)

#+nil
(defun get-renderbuffer-parameter-ext (target pname)
  )

(import-export %gl:is-framebuffer %gl:is-framebuffer-ext
               %gl:bind-framebuffer %gl:bind-framebuffer-ext)

(defun delete-framebuffers (framebuffers)
  (with-opengl-sequence (array '%gl:uint framebuffers)
    (%gl:delete-framebuffers (length framebuffers) array)))

(defun gen-framebuffers (count)
  (with-foreign-object (framebuffer-array '%gl:uint count)
    (%gl:gen-framebuffers count framebuffer-array)
    (loop for i below count
          collecting (mem-aref framebuffer-array '%gl:uint i))))

(defun gen-framebuffer ()
  (with-foreign-object (framebuffer '%gl:uint 1)
    (%gl:gen-framebuffers 1 framebuffer)
    (mem-aref framebuffer '%gl:uint 0)))

(defun delete-framebuffers-ext (framebuffers)
  (with-opengl-sequence (array '%gl:uint framebuffers)
    (%gl:delete-framebuffers-ext (length framebuffers) array)))

(defun gen-framebuffers-ext (count)
  (with-foreign-object (framebuffer-array '%gl:uint count)
    (%gl:gen-framebuffers-ext count framebuffer-array)
    (loop for i below count
          collecting (mem-aref framebuffer-array '%gl:uint i))))

(import-export %gl:check-framebuffer-status %gl:check-framebuffer-status-ext
               %gl:framebuffer-texture-1d %gl:framebuffer-texture-1d-ext
               %gl:framebuffer-texture-2d %gl:framebuffer-texture-2d-ext
               %gl:framebuffer-texture-3d %gl:framebuffer-texture-3d-ext
               %gl:framebuffer-renderbuffer %gl:framebuffer-renderbuffer-ext)

#+nil
(defun get-framebuffer-attachment-parameter-ext (target attachment pname)
  (ecase pname
    (:framebuffer )))

(import-export %gl:generate-mipmap %gl:generate-mipmap-ext %gl:generate-texture-mipmap)

;;;
;;; ARB_uniform_buffer_object
;;;

(defun get-uniform-block-index (program uniformblockname)
  (with-foreign-string (s uniformblockname)
    (%gl:get-uniform-block-index program s)))
