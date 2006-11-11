;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; extensions.lisp --- OpenGL extensions.
;;;
;;; Copyright (c) 2006, Oliver Markovic <entrox@entrox.org>
;;; Copyright (c) 2006, Luis Oliveira <loliveira@common-lisp.net>
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

(in-package :cl-opengl)


;;;
;;; EXT_framebuffer_object
;;;

(defun is-renderbuffer-ext (renderbuffer)
  (%glIsRenderbufferEXT renderbuffer))

(defun bind-renderbuffer-ext (target renderbuffer)
  (%glBindRenderBufferEXT target renderbuffer))

(defun delete-renderbuffers-ext (renderbuffers)
  (with-opengl-sequence (array 'uint renderbuffers)
    (%glDeleteRenderbuffersEXT (length renderbuffers) array)))

(defun gen-renderbuffers-ext (count)
  (with-foreign-object (renderbuffer-array 'uint count)
    (%glGenRenderbuffersEXT count renderbuffer-array)
    (loop for i below count
          collecting (mem-aref renderbuffer-array 'uint i))))

(defun renderbuffer-storage-ext (target internal-format width height)
  (%glRenderbufferStorageEXT target internal-format width height))

#+nil
(defun get-renderbuffer-parameter-ext (target pname)
  )


(defun is-framebuffer-ext (framebuffer)
  (%glIsFramebufferEXT framebuffer))

(defun bind-framebuffer-ext (target framebuffer)
  (%glBindFramebufferEXT target framebuffer))

(defun delete-framebuffers-ext (framebuffers)
  (with-opengl-sequence (array 'uint framebuffers)
    (%glDeleteFramebuffersEXT (length framebuffers) array)))

(defun gen-framebuffers-ext (count)
  (with-foreign-object (framebuffer-array 'uint count)
    (%glGenFramebuffersEXT count framebuffer-array)
    (loop for i below count
          collecting (mem-aref framebuffer-array 'uint i))))

(defun check-framebuffer-status-ext (target)
  (%glCheckFramebufferStatusEXT target))

(defun framebuffer-texture-1d-ext (target attachment tex-target texture level)
  (%glFramebufferTexture1DEXT target attachment tex-target texture level))

(defun framebuffer-texture-2d-ext (target attachment tex-target texture level)
  (%glFramebufferTexture2DEXT target attachment tex-target texture level))

(defun framebuffer-texture-3d-ext (target attachment tex-target texture level zoffset)
  (%glFramebufferTexture3DEXT target attachment tex-target texture level zoffset))

(defun framebuffer-renderbuffer-ext (target attachment renderbuffer-target renderbuffer)
  (%glFramebufferRenderbufferEXT target attachment renderbuffer-target renderbuffer))

#+nil
(defun get-framebuffer-attachment-parameter-ext (target attachment pname)
  (ecase pname
    (:framebuffer )))

(defun generate-mipmap-ext (target)
  (%glGenerateMipmapEXT target))