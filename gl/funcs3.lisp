;;; generated file, do not edit

;;; generated from files with following copyright:
;;;
;;; License Applicability. Except to the extent portions of this file are
;;; made subject to an alternative license as permitted in the SGI Free
;;; Software License B, Version 1.1 (the "License"), the contents of this
;;; file are subject only to the provisions of the License. You may not use
;;; this file except in compliance with the License. You may obtain a copy
;;; of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
;;; Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
;;; 
;;; http://oss.sgi.com/projects/FreeB
;;; 
;;; Note that, as provided in the License, the Software is distributed on an
;;; "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
;;; DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
;;; CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
;;; PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
;;; 
;;; Original Code. The Original Code is: OpenGL Sample Implementation,
;;; Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
;;; Inc. The Original Code is Copyright (c) 1991-2002 Silicon Graphics, Inc.
;;; Copyright in any portions created by third parties is as indicated
;;; elsewhere herein. All Rights Reserved.
;;; 
;;; Additional Notice Provisions: This software was created using the
;;; OpenGL(R) version 1.2.1 Sample Implementation published by SGI, but has
;;; not been independently verified as being compliant with the OpenGL(R)
;;; version 1.2.1 Specification.
;;;

;;; glext version 42 ( 2008/08/16 )

(in-package #:cl-opengl-bindings)

(defparameter *glext-version* 42)
(defparameter *glext-last-updated* "2008/08/16")

;;; GL version: 1.0, drawing-control
(defglfun ("glClipPlane" clip-plane) :void
  (plane enum)
  (equation (:pointer double)))

;;; GL version: 1.0, drawing-control
(defglfun ("glCullFace" cull-face) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glFrontFace" front-face) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glHint" hint) :void
  (target enum)
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glLineWidth" line-width) :void
  (width float))

;;; GL version: 1.0, drawing-control
(defglfun ("glPointSize" point-size) :void
  (size float))

;;; GL version: 1.0, drawing-control
(defglfun ("glPolygonMode" polygon-mode) :void
  (face enum)
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glScissor" scissor) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.0, drawing-control
(defglfun ("glShadeModel" shade-model) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameterf" tex-parameter-f) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameterfv" tex-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameteri" tex-parameter-i) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameteriv" tex-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexImage1D" tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexImage2D" tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (height sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvf" tex-env-f) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvfv" tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvi" tex-env-i) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnviv" tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, framebuf
(defglfun ("glDrawBuffer" draw-buffer) :void
  (mode enum))

;;; GL version: 1.0, framebuf
(defglfun ("glClear" clear) :void
  (mask ClearBufferMask))

;;; GL version: 1.0, framebuf
(defglfun ("glClearColor" clear-color) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

;;; GL version: 1.0, framebuf
(defglfun ("glClearStencil" clear-stencil) :void
  (s int))

;;; GL version: 1.0, framebuf
(defglfun ("glClearDepth" clear-depth) :void
  (depth clampd))

;;; GL version: 1.0, framebuf
(defglfun ("glStencilMask" stencil-mask) :void
  (mask uint))

;;; GL version: 1.0, framebuf
(defglfun ("glColorMask" color-mask) :void
  (red boolean)
  (green boolean)
  (blue boolean)
  (alpha boolean))

;;; GL version: 1.0, framebuf
(defglfun ("glDepthMask" depth-mask) :void
  (flag boolean))

;;; GL version: 1.0, misc
(defglfun ("glDisable" disable) :void
  (cap enum))

;;; GL version: 1.0, misc
(defglfun ("glEnable" enable) :void
  (cap enum))

;;; GL version: 1.0, misc
(defglfun ("glFinish" finish) :void)

;;; GL version: 1.0, misc
(defglfun ("glFlush" flush) :void)

;;; GL version: 1.0, pixel-op
(defglfun ("glBlendFunc" blend-func) :void
  (sfactor enum)
  (dfactor enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glLogicOp" logic-op) :void
  (opcode enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glStencilFunc" stencil-func) :void
  (func enum)
  (ref int)
  (mask uint))

;;; GL version: 1.0, pixel-op
(defglfun ("glStencilOp" stencil-op) :void
  (fail enum)
  (zfail enum)
  (zpass enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glDepthFunc" depth-func) :void
  (func enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelStoref" pixel-store-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelStorei" pixel-store-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, pixel-rw
(defglfun ("glReadBuffer" read-buffer) :void
  (mode enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glCopyPixels" copy-pixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (type enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glReadPixels" read-pixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, state-req
(defglfun ("glGetBooleanv" get-boolean-v) :void
  (pname enum)
  (params (:pointer boolean)))

;;; GL version: 1.0, state-req
(defglfun ("glGetClipPlane" get-clip-plane) :void
  (plane enum)
  (equation (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetDoublev" get-double-v) :void
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetError" get-error) enum)

;;; GL version: 1.0, state-req
(defglfun ("glGetFloatv" get-float-v) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetIntegerv" get-integer-v) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetString" get-string) string
  (name enum))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexEnvfv" get-tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexEnviv" get-tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexImage" get-tex-image) :void
  (target enum)
  (level int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexParameterfv" get-tex-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexParameteriv" get-tex-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexLevelParameterfv" get-tex-level-parameter-fv) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexLevelParameteriv" get-tex-level-parameter-iv) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glIsEnabled" is-enabled) boolean
  (cap enum))

;;; GL version: 1.0, xform
(defglfun ("glDepthRange" depth-range) :void
  (near clampd)
  (far clampd))

;;; GL version: 1.0, xform
(defglfun ("glViewport" viewport) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glArrayElement" array-element) :void
  (i int))

;;; GL version: 1.1, 1_1
(defglfun ("glDrawArrays" draw-arrays) :void
  (mode enum)
  (first int)
  (count sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glDrawElements" draw-elements) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glGetPointerv" get-pointer-v) :void
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 1.1, 1_1
(defglfun ("glPolygonOffset" polygon-offset) :void
  (factor float)
  (units float))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexImage1D" copy-tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (border int))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexImage2D" copy-tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexSubImage1D" copy-tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexSubImage2D" copy-tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glTexSubImage1D" tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glTexSubImage2D" tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glBindTexture" bind-texture) :void
  (target enum)
  (texture uint))

;;; GL version: 1.1, 1_1
(defglfun ("glDeleteTextures" delete-textures) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.1, 1_1
(defglfun ("glGenTextures" gen-textures) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.1, 1_1
(defglfun ("glIsTexture" is-texture) boolean
  (texture uint))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glBlendColor" blend-color) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glBlendEquation" blend-equation) :void
  (mode enum))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glDrawRangeElements" draw-range-elements) :void
  (mode enum)
  (start uint)
  (end uint)
  (count sizei)
  (type enum)
  (indices (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glTexImage3D" tex-image-3d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glTexSubImage3D" tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyTexSubImage3D" copy-tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glActiveTexture" active-texture) :void
  (texture enum))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glSampleCoverage" sample-coverage) :void
  (value clampf)
  (invert boolean))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage3D" compressed-tex-image-3d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage2D" compressed-tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage1D" compressed-tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage3D" compressed-tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage2D" compressed-tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage1D" compressed-tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glGetCompressedTexImage" get-compressed-tex-image) :void
  (target enum)
  (level int)
  (img (:pointer void)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glBlendFuncSeparate" blend-func-separate) :void
  (sfactorRGB enum)
  (dfactorRGB enum)
  (sfactorAlpha enum)
  (dfactorAlpha enum))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glMultiDrawArrays" multi-draw-arrays) :void
  (mode enum)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glMultiDrawElements" multi-draw-elements) :void
  (mode enum)
  (count (:pointer sizei))
  (type enum)
  (indices (:pointer (:pointer void)))
  (primcount sizei))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameterf" point-parameter-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameterfv" point-parameter-fv) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameteri" point-parameter-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameteriv" point-parameter-iv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGenQueries" gen-queries) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glDeleteQueries" delete-queries) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glIsQuery" is-query) boolean
  (id uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBeginQuery" begin-query) :void
  (target enum)
  (id uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glEndQuery" end-query) :void
  (target enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryiv" get-query-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryObjectiv" get-query-object-iv) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryObjectuiv" get-query-object-uiv) :void
  (id uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBindBuffer" bind-buffer) :void
  (target enum)
  (buffer uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glDeleteBuffers" delete-buffers) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGenBuffers" gen-buffers) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glIsBuffer" is-buffer) boolean
  (buffer uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBufferData" buffer-data) :void
  (target enum)
  (size sizeiptr)
  (data (:pointer void))
  (usage enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBufferSubData" buffer-sub-data) :void
  (target enum)
  (offset intptr)
  (size sizeiptr)
  (data (:pointer void)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferSubData" get-buffer-sub-data) :void
  (target enum)
  (offset intptr)
  (size sizeiptr)
  (data (:pointer void)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glMapBuffer" map-buffer) (:pointer void)
  (target enum)
  (access enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glUnmapBuffer" unmap-buffer) boolean
  (target enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferParameteriv" get-buffer-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferPointerv" get-buffer-pointer-v) :void
  (target enum)
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glBlendEquationSeparate" blend-equation-separate) :void
  (modeRGB enum)
  (modeAlpha enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDrawBuffers" draw-buffers) :void
  (n sizei)
  (bufs (:pointer enum)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilOpSeparate" stencil-op-separate) :void
  (face enum)
  (sfail enum)
  (dpfail enum)
  (dppass enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilFuncSeparate" stencil-func-separate) :void
  (frontfunc enum)
  (backfunc enum)
  (ref int)
  (mask uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilMaskSeparate" stencil-mask-separate) :void
  (face enum)
  (mask uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glAttachShader" attach-shader) :void
  (program uint)
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glBindAttribLocation" bind-attrib-location) :void
  (program uint)
  (index uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCompileShader" compile-shader) :void
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCreateProgram" create-program) uint)

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCreateShader" create-shader) uint
  (type enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDeleteProgram" delete-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDeleteShader" delete-shader) :void
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDetachShader" detach-shader) :void
  (program uint)
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDisableVertexAttribArray" disable-vertex-attrib-array) :void
  (index uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glEnableVertexAttribArray" enable-vertex-attrib-array) :void
  (index uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetActiveAttrib" get-active-attrib) :void
  (program uint)
  (index uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetActiveUniform" get-active-uniform) :void
  (program uint)
  (index uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetAttachedShaders" get-attached-shaders) :void
  (program uint)
  (maxCount sizei)
  (count (:pointer sizei))
  (obj (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetAttribLocation" get-attrib-location) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetProgramiv" get-program-iv) :void
  (program uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetProgramInfoLog" get-program-info-log) :void
  (program uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (infoLog (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderiv" get-shader-iv) :void
  (shader uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderInfoLog" get-shader-info-log) :void
  (shader uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (infoLog (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderSource" get-shader-source) :void
  (shader uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (source (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformLocation" get-uniform-location) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformfv" get-uniform-fv) :void
  (program uint)
  (location int)
  (params (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformiv" get-uniform-iv) :void
  (program uint)
  (location int)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribdv" get-vertex-attrib-dv) :void
  (index uint)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribfv" get-vertex-attrib-fv) :void
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribiv" get-vertex-attrib-iv) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribPointerv" get-vertex-attrib-pointer-v) :void
  (index uint)
  (pname enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glIsProgram" is-program) boolean
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glIsShader" is-shader) boolean
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glLinkProgram" link-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glShaderSource" shader-source) :void
  (shader uint)
  (count sizei)
  (string (:pointer (:pointer char)))
  (length (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUseProgram" use-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1f" uniform-1f) :void
  (location int)
  (v0 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2f" uniform-2f) :void
  (location int)
  (v0 float)
  (v1 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3f" uniform-3f) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4f" uniform-4f) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float)
  (v3 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1i" uniform-1i) :void
  (location int)
  (v0 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2i" uniform-2i) :void
  (location int)
  (v0 int)
  (v1 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3i" uniform-3i) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4i" uniform-4i) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int)
  (v3 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1fv" uniform-1fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2fv" uniform-2fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3fv" uniform-3fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4fv" uniform-4fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1iv" uniform-1iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2iv" uniform-2iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3iv" uniform-3iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4iv" uniform-4iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix2fv" uniform-matrix-2fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix3fv" uniform-matrix-3fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix4fv" uniform-matrix-4fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glValidateProgram" validate-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1d" vertex-attrib-1d) :void
  (index uint)
  (x double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1dv" vertex-attrib-1dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1f" vertex-attrib-1f) :void
  (index uint)
  (x float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1fv" vertex-attrib-1fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1s" vertex-attrib-1s) :void
  (index uint)
  (x short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1sv" vertex-attrib-1sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2d" vertex-attrib-2d) :void
  (index uint)
  (x double)
  (y double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2dv" vertex-attrib-2dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2f" vertex-attrib-2f) :void
  (index uint)
  (x float)
  (y float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2fv" vertex-attrib-2fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2s" vertex-attrib-2s) :void
  (index uint)
  (x short)
  (y short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2sv" vertex-attrib-2sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3d" vertex-attrib-3d) :void
  (index uint)
  (x double)
  (y double)
  (z double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3dv" vertex-attrib-3dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3f" vertex-attrib-3f) :void
  (index uint)
  (x float)
  (y float)
  (z float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3fv" vertex-attrib-3fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3s" vertex-attrib-3s) :void
  (index uint)
  (x short)
  (y short)
  (z short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3sv" vertex-attrib-3sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nbv" vertex-attrib-4nbv) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Niv" vertex-attrib-4niv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nsv" vertex-attrib-4nsv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nub" vertex-attrib-4nub) :void
  (index uint)
  (x ubyte)
  (y ubyte)
  (z ubyte)
  (w ubyte))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nubv" vertex-attrib-4nubv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nuiv" vertex-attrib-4nuiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nusv" vertex-attrib-4nusv) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4bv" vertex-attrib-4bv) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4d" vertex-attrib-4d) :void
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4dv" vertex-attrib-4dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4f" vertex-attrib-4f) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4fv" vertex-attrib-4fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4iv" vertex-attrib-4iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4s" vertex-attrib-4s) :void
  (index uint)
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4sv" vertex-attrib-4sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4ubv" vertex-attrib-4ubv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4uiv" vertex-attrib-4uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4usv" vertex-attrib-4usv) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttribPointer" vertex-attrib-pointer) :void
  (index uint)
  (size int)
  (type enum)
  (normalized boolean)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix2x3fv" uniform-matrix-2x3-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix3x2fv" uniform-matrix-3x2-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix2x4fv" uniform-matrix-2x4-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix4x2fv" uniform-matrix-4x2-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix3x4fv" uniform-matrix-3x4-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix4x3fv" uniform-matrix-4x3-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glColorMaski" color-mask-i) :void
  (index uint)
  (r boolean)
  (g boolean)
  (b boolean)
  (a boolean))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetBooleani_v" get-boolean-i-v) :void
  (target enum)
  (index uint)
  (data (:pointer boolean)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetIntegeri_v" get-integer-i-v) :void
  (target enum)
  (index uint)
  (data (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glEnablei" enable-i) :void
  (target enum)
  (index uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glDisablei" disable-i) :void
  (target enum)
  (index uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glIsEnabledi" is-enabled-i) boolean
  (target enum)
  (index uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glBeginTransformFeedback" begin-transform-feedback) :void
  (primitiveMode enum))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glEndTransformFeedback" end-transform-feedback) :void)

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glBindBufferRange" bind-buffer-range) :void
  (target enum)
  (index uint)
  (buffer uint)
  (offset intptr)
  (size sizeiptr))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glBindBufferBase" bind-buffer-base) :void
  (target enum)
  (index uint)
  (buffer uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glTransformFeedbackVaryings" transform-feedback-varyings) :void
  (program uint)
  (count sizei)
  (locations (:pointer int))
  (bufferMode enum))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetTransformFeedbackVarying" get-transform-feedback-varying) :void
  (program uint)
  (index uint)
  (location (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glClampColor" clamp-color) :void
  (target enum)
  (clamp enum))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glBeginConditionalRender" begin-conditional-render) :void
  (id uint)
  (mode enum))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glEndConditionalRender" end-conditional-render) :void)

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI1i" vertex-attrib-i1i) :void
  (index uint)
  (x int))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI2i" vertex-attrib-i2i) :void
  (index uint)
  (x int)
  (y int))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI3i" vertex-attrib-i3i) :void
  (index uint)
  (x int)
  (y int)
  (z int))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4i" vertex-attrib-i4i) :void
  (index uint)
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI1ui" vertex-attrib-i1ui) :void
  (index uint)
  (x uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI2ui" vertex-attrib-i2ui) :void
  (index uint)
  (x uint)
  (y uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI3ui" vertex-attrib-i3ui) :void
  (index uint)
  (x uint)
  (y uint)
  (z uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4ui" vertex-attrib-i4ui) :void
  (index uint)
  (x uint)
  (y uint)
  (z uint)
  (w uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI1iv" vertex-attrib-i1iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI2iv" vertex-attrib-i2iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI3iv" vertex-attrib-i3iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4iv" vertex-attrib-i4iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI1uiv" vertex-attrib-i1uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI2uiv" vertex-attrib-i2uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI3uiv" vertex-attrib-i3uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4uiv" vertex-attrib-i4uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4bv" vertex-attrib-i4bv) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4sv" vertex-attrib-i4sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4ubv" vertex-attrib-i4ubv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribI4usv" vertex-attrib-i4usv) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glVertexAttribIPointer" vertex-attrib-ipointer) :void
  (index uint)
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetVertexAttribIiv" get-vertex-attrib-iiv) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetVertexAttribIuiv" get-vertex-attrib-iuiv) :void
  (index uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetUniformuiv" get-uniform-uiv) :void
  (program uint)
  (location int)
  (params (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glBindFragDataLocation" bind-frag-data-location) :void
  (program uint)
  (color uint)
  (name (:pointer char)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetFragDataLocation" get-frag-data-location) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform1ui" uniform-1ui) :void
  (location int)
  (v0 uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform2ui" uniform-2ui) :void
  (location int)
  (v0 uint)
  (v1 uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform3ui" uniform-3ui) :void
  (location int)
  (v0 uint)
  (v1 uint)
  (v2 uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform4ui" uniform-4ui) :void
  (location int)
  (v0 uint)
  (v1 uint)
  (v2 uint)
  (v3 uint))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform1uiv" uniform-1uiv) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform2uiv" uniform-2uiv) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform3uiv" uniform-3uiv) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glUniform4uiv" uniform-4uiv) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glTexParameterIiv" tex-parameter-iiv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glTexParameterIuiv" tex-parameter-iuiv) :void
  (target enum)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetTexParameterIiv" get-tex-parameter-iiv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetTexParameterIuiv" get-tex-parameter-iuiv) :void
  (target enum)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glClearBufferiv" clear-buffer-iv) :void
  (buffer enum)
  (value (:pointer int)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glClearBufferuiv" clear-buffer-uiv) :void
  (buffer enum)
  (value (:pointer uint)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glClearBufferfv" clear-buffer-fv) :void
  (buffer enum)
  (value (:pointer float)))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glClearBufferfi" clear-buffer-fi) :void
  (buffer enum)
  (depth float)
  (stencil int))

;;; GL version: 3.0, VERSION_3_0
(defglextfun ("glGetStringi" get-string-i) string
  (name enum)
  (index uint))

;;; GL version: 2.0, ARB_draw_instanced
(defglextfun ("glDrawArraysInstancedARB" draw-arrays-instanced-arb) :void
  (mode enum)
  (first int)
  (count sizei)
  (primcount sizei))

;;; GL version: 2.0, ARB_draw_instanced
(defglextfun ("glDrawElementsInstancedARB" draw-elements-instanced-arb) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices (:pointer void))
  (primcount sizei))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glIsRenderbuffer" is-renderbuffer) boolean
  (renderbuffer uint))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glBindRenderbuffer" bind-renderbuffer) :void
  (target enum)
  (renderbuffer uint))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glDeleteRenderbuffers" delete-renderbuffers) :void
  (n sizei)
  (renderbuffers (:pointer uint)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glGenRenderbuffers" gen-renderbuffers) :void
  (n sizei)
  (renderbuffers (:pointer uint)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glRenderbufferStorage" renderbuffer-storage) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glGetRenderbufferParameteriv" get-renderbuffer-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glIsFramebuffer" is-framebuffer) boolean
  (framebuffer uint))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glBindFramebuffer" bind-framebuffer) :void
  (target enum)
  (framebuffer uint))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glDeleteFramebuffers" delete-framebuffers) :void
  (n sizei)
  (framebuffers (:pointer uint)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glGenFramebuffers" gen-framebuffers) :void
  (n sizei)
  (framebuffers (:pointer uint)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glCheckFramebufferStatus" check-framebuffer-status) enum
  (target enum))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glFramebufferTexture1D" framebuffer-texture-1d) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glFramebufferTexture2D" framebuffer-texture-2d) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glFramebufferTexture3D" framebuffer-texture-3d) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int)
  (zoffset int))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glFramebufferRenderbuffer" framebuffer-renderbuffer) :void
  (target enum)
  (attachment enum)
  (renderbuffertarget enum)
  (renderbuffer uint))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glGetFramebufferAttachmentParameteriv" get-framebuffer-attachment-parameter-iv) :void
  (target enum)
  (attachment enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glGenerateMipmap" generate-mipmap) :void
  (target enum))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glBlitFramebuffer" blit-framebuffer) :void
  (srcX0 int)
  (srcY0 int)
  (srcX1 int)
  (srcY1 int)
  (dstX0 int)
  (dstY0 int)
  (dstX1 int)
  (dstY1 int)
  (mask ClearBufferMask)
  (filter enum))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glRenderbufferStorageMultisample" renderbuffer-storage-multisample) :void
  (target enum)
  (samples sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 3.0, ARB_framebuffer_object
(defglextfun ("glFramebufferTextureLayer" framebuffer-texture-layer) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int)
  (layer int))

;;; GL version: 3.0, ARB_geometry_shader4
(defglextfun ("glProgramParameteriARB" program-parameter-i-arb) :void
  (program uint)
  (pname enum)
  (value int))

;;; GL version: 3.0, ARB_geometry_shader4
(defglextfun ("glFramebufferTextureARB" framebuffer-texture-arb) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int))

;;; GL version: 3.0, ARB_geometry_shader4
(defglextfun ("glFramebufferTextureLayerARB" framebuffer-texture-layer-arb) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int)
  (layer int))

;;; GL version: 3.0, ARB_geometry_shader4
(defglextfun ("glFramebufferTextureFaceARB" framebuffer-texture-face-arb) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int)
  (face enum))

;;; GL version: 3.0, ARB_map_buffer_range
(defglextfun ("glMapBufferRange" map-buffer-range) :void
  (target enum)
  (offset intptr)
  (length sizeiptr)
  (access BufferAccessMask))

;;; GL version: 3.0, ARB_map_buffer_range
(defglextfun ("glFlushMappedBufferRange" flush-mapped-buffer-range) :void
  (target enum)
  (offset intptr)
  (length sizeiptr))

;;; GL version: 3.0, ARB_texture_buffer_object
(defglextfun ("glTexBufferARB" tex-buffer-arb) :void
  (target enum)
  (internalformat enum)
  (buffer uint))

;;; GL version: 3.0, ARB_vertex_array_object
(defglextfun ("glBindVertexArray" bind-vertex-array) :void
  (array uint))

;;; GL version: 3.0, ARB_vertex_array_object
(defglextfun ("glDeleteVertexArrays" delete-vertex-arrays) :void
  (n sizei)
  (arrays (:pointer uint)))

;;; GL version: 3.0, ARB_vertex_array_object
(defglextfun ("glGenVertexArrays" gen-vertex-arrays) :void
  (n sizei)
  (arrays (:pointer uint)))

;;; GL version: 3.0, ARB_vertex_array_object
(defglextfun ("glIsVertexArray" is-vertex-array) boolean
  (array uint))

;;; GL version: 1.2, EXT_depth_bounds_test
(defglextfun ("glDepthBoundsEXT" depth-bounds-ext) :void
  (zmin clampd)
  (zmax clampd))

;;; GL version: 1.0, GREMEDY_string_marker
(defglextfun ("glStringMarkerGREMEDY" string-marker-gremedy) :void
  (len sizei)
  (string (:pointer void)))

;;; GL version: 1.5, EXT_timer_query
(defglextfun ("glGetQueryObjecti64vEXT" get-query-object-i64v-ext) :void
  (id uint)
  (pname enum)
  (params (:pointer int64-ext)))

;;; GL version: 1.5, EXT_timer_query
(defglextfun ("glGetQueryObjectui64vEXT" get-query-object-ui64v-ext) :void
  (id uint)
  (pname enum)
  (params (:pointer uint64-ext)))

;;; GL version: 1.5, NV_framebuffer_multisample_coverage
(defglextfun ("glRenderbufferStorageMultisampleCoverageNV" renderbuffer-storage-multisample-coverage-nv) :void
  (target enum)
  (coverageSamples sizei)
  (colorSamples sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersfvNV" program-buffer-parameters-fv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer float)))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersIivNV" program-buffer-parameters-iiv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer int)))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersIuivNV" program-buffer-parameters-iuiv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glUniformBufferEXT" uniform-buffer-ext) :void
  (program uint)
  (location int)
  (buffer uint))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glGetUniformBufferSizeEXT" get-uniform-buffer-size-ext) int
  (program uint)
  (location int))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glGetUniformOffsetEXT" get-uniform-offset-ext) intptr
  (program uint)
  (location int))

;;; GL version: 1.0, GREMEDY_frame_terminator
(defglextfun ("glFrameTerminatorGREMEDY" frame-terminator-gremedy) :void)
