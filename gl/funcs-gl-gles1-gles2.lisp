;;; this file is automatically generated, do not edit
;;; generated from files with the following copyright:
;;;
;;; Copyright 2013-2020 The Khronos Group Inc.
;;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-opengl-bindings)

;;; generated 2024-08-16T20:46:56Z
;;; from gl.xml @ git sha 4f845dc97972c72cad684cc22c7bf96e6d5319a6, 2024-08-15T14:04:09Z

(defglfun ("glTexImage2D" tex-image-2d 1590) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (height sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels offset-or-pointer))

(defglfun ("glReadPixels" read-pixels 1591) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels offset-or-pointer))

(defglfun ("glDrawElements" draw-elements 1592) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices offset-or-pointer))

(defglfun ("glCopyTexImage2D" copy-tex-image-2d 1593) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))

(defglfun ("glCopyTexSubImage2D" copy-tex-sub-image-2d 1594) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

(defglfun ("glDeleteTextures" delete-textures 1595) :void
  (n sizei)
  (textures (:pointer uint)))

(defglfun ("glIsTexture" is-texture 1596) boolean
  (texture uint))

(defglextfun ("glCompressedTexImage2D" compressed-tex-image-2d 1597) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (border int)
  (imageSize sizei)
  (data offset-or-pointer))

(defglextfun ("glDeleteBuffers" delete-buffers 1598) :void
  (n sizei)
  (buffers (:pointer uint)))

(defglextfun ("glIsBuffer" is-buffer 1599) boolean
  (buffer uint))

(defglextfun ("glBlendEquationEXT" blend-equation-ext 1600) :void
  (mode enum))

(defglextfun ("glRenderbufferStorageMultisampleEXT" renderbuffer-storage-multisample-ext 1601) :void
  (target enum)
  (samples sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

(defglextfun ("glMultiDrawArraysEXT" multi-draw-arrays-ext 1602) :void
  (mode enum)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

(defglextfun ("glMultiDrawElementsEXT" multi-draw-elements-ext 1603) :void
  (mode enum)
  (count (:pointer sizei))
  (type enum)
  (indices (:pointer (:pointer :void)))
  (primcount sizei))

(defglextfun ("glDeleteFencesNV" delete-fences-nv 1604) :void
  (n sizei)
  (fences (:pointer uint)))

(defglextfun ("glGenFencesNV" gen-fences-nv 1605) :void
  (n sizei)
  (fences (:pointer uint)))

(defglextfun ("glIsFenceNV" is-fence-nv 1606) boolean
  (fence uint))

(defglextfun ("glTestFenceNV" test-fence-nv 1607) boolean
  (fence uint))

(defglextfun ("glGetFenceivNV" get-fence-iv-nv 1608) :void
  (fence uint)
  (pname enum)
  (params (:pointer int)))

(defglextfun ("glFinishFenceNV" finish-fence-nv 1609) :void
  (fence uint))

(defglextfun ("glSetFenceNV" set-fence-nv 1610) :void
  (fence uint)
  (condition enum))

