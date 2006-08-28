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

(in-package :cl-opengl)

;;; A

(defcfun ("glAccum" %glAccum) :void
  (op accum-op)
  (value float))

(defcfun ("glActiveTexture" %glActiveTexture) :void
  (name texture-name))

(defcfun ("glAlphaFunc" %glAlphaFunc) :void
  (func compare-func)
  (ref clampf))

(defcfun ("glAttachShader" %glAttachShader) :void
  (program uint)
  (shader uint))

(defcfun ("glAreTexturesResident" %glAreTexturesResident) boolean
  (n sizei)
  (textures :pointer)
  (residences :pointer))


;;; B

(defcfun ("glBegin" %glBegin) :void
  (mode begin-mode))

(defcfun ("glBeginQuery" %glBeginQuery) :void
  (target query-target)
  (id uint))

(defcfun ("glBindAttribLocation" %glBindAttribLocation) :void
  (program uint)
  (index uint)
  (name :pointer))

(defcfun ("glBindTexture" %glBindTexture) :void
  (target texture-target)
  (handle uint))

(defcfun ("glBlendColor" %glBlendColor) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

(defcfun ("glBlendEquation" %glBlendEquation) :void
  (mode blend-equation))

(defcfun ("glBlendEquationSeparate" %glBlendEquationSeparate) :void
  (mode-rgb blend-equation)
  (mode-alpha blend-equation))

(defcfun ("glBlendFunc" %glBlendFunc) :void
  (src blend-func)
  (dst blend-func))

(defcfun ("glBlendFuncSeparate" %glBlendFuncSeparate) :void
  (src-rgb blend-func)
  (dst-rgb blend-func)
  (src-alpha blend-func)
  (dst-alpha blend-func))


;;; C

(defcfun ("glCallList" %glCallList) :void
  (n uint))

(defcfun ("glCallLists" %glCallLists) :void
  (n sizei)
  (type call-lists-type)
  (lists :pointer))

(defcfun ("glClear" %glClear) :void
  (bufs bitfield))

(defcfun ("glClearAccum" %glClearAccum) :void
  (r float)
  (g float)
  (b float)
  (a float))

(defcfun ("glClearColor" %glClearColor) :void
  (r clampf)
  (g clampf)
  (b clampf)
  (a clampf))

(defcfun ("glClearDepth" %glClearDepth) :void
  (depth clampd))

(defcfun ("glClearIndex" %glClearIndex) :void
  (index float))

(defcfun ("glClearStencil" %glClearStencil) :void
  (s int))

(defcfun ("glClipPlane" %glClipPlane) :void
  (p clip-plane-name)
  (eqn :pointer))

(defcfun ("glColor3f" %glColor3f) :void
  (r float)
  (g float)
  (b float))

(defcfun ("glColor4f" %glColor4f) :void
  (r float)
  (g float)
  (b float)
  (a float))

(defcfun ("glColorMask" %glColorMask) :void
  (r boolean)
  (g boolean)
  (b boolean)
  (a boolean))

(defcfun ("glColorMaterial" %glColorMaterial) :void
  (face polygon-face)
  (mode color-material-mode))

(defcfun ("glColorTable" %glColorTable) :void
  (target color-table-name)
  (internal-format pixel-data-internal-format)
  (width sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glCompileShader" %glCompileShader) :void
  (shader uint))

(defcfun ("glCopyPixels" %glCopyPixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (type copy-pixels-type))

(defcfun ("glCopyTexImage1D" %glCopyTexImage1D) :void
  (target tex-image-1d-target)
  (level int)
  (internal-format int)
  (x int)
  (y int)
  (width sizei)
  (border int))

(defcfun ("glCopyTexImage2D" %glCopyTexImage2D) :void
  (target tex-image-2d-target)
  (level int)
  (internal-format int)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))


(defcfun ("glCopyTexSubImage1D" %glCopyTexSubImage1D) :void
  (target tex-image-1d-target)
  (level int)
  (xoffset int)
  (x int)
  (y int)
  (width sizei))

(defcfun ("glCopyTexSubImage3D" %glCopyTexSubImage3D) :void
  (target tex-image-3d-target)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

(defcfun ("glCopyTexSubImage2D" %glCopyTexSubImage2D) :void
  (target tex-image-2d-target)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

(defcfun ("glCreateProgram" %glCreateProgram) uint)

(defcfun ("glCreateShader" %glCreateShader) uint
  (type shader-type))

(defcfun ("glCullFace" %glCullFace) :void
  (face polygon-face))


;;; D

(defcfun ("glDeleteLists" %glDeleteLists) :void
  (list uint)
  (range sizei))

(defcfun ("glDeleteProgram" %glDeleteProgram) :void
  (object uint))

(defcfun ("glDeleteQueries" %glDeleteQueries) :void
  (n sizei)
  (ids :pointer))

(defcfun ("glDeleteShader" %glDeleteShader) :void
  (shader uint))

(defcfun ("glDeleteTextures" %glDeleteTextures) :void
  (n sizei)
  (textures :pointer))

(defcfun ("glDepthFunc" %glDepthFunc) :void
  (func compare-func))

(defcfun ("glDepthMask" %glDepthMask) :void
  (mask boolean))

(defcfun ("glDepthRange" %glDepthRange) :void
  (n clampd)
  (f clampd))

(defcfun ("glDetachShader" %glDetachShader) :void
  (program uint)
  (shader uint))

(defcfun ("glDisable" %glDisable) :void
  (target enable-cap))

(defcfun ("glDrawBuffer" %glDrawBuffer) :void
  (buffer draw-buffer))

(defcfun ("glDrawBuffers" %glDrawBuffers) :void
  (n sizei)
  (bufs :pointer))

;;; E

(defcfun ("glEdgeFlag" %glEdgeFlag) :void
  (flag boolean))

(defcfun ("glEnable" %glEnable) :void
  (target enable-cap))

(defcfun ("glEnd" %glEnd) :void)

(defcfun ("glEndList" %glEndList) :void)

(defcfun ("glEndQuery" %glEndQuery) :void
  (target query-target))

(defcfun ("glEvalCoord1f" %glEvalCoord1f) :void
  (x float))

(defcfun ("glEvalCoord2f" %glEvalCoord2f) :void
  (x float)
  (y float))

(defcfun ("glEvalMesh1" %glEvalMesh1) :void
  (mode eval-mesh-1-mode)
  (p1 int)
  (p2 int))

(defcfun ("glEvalMesh2" %glEvalMesh2) :void
  (mode eval-mesh-2-mode)
  (p1 int)
  (p2 int)
  (q1 int)
  (q2 int))

(defcfun ("glEvalPoint1" %glEvalPoint1) :void
  (p int))

(defcfun ("glEvalPoint2" %glEvalPoint2) :void
  (p int)
  (q int))

;;; F

(defcfun ("glFeedbackBuffer" %glFeedbackBuffer) :void
  (n sizei)
  (type feedback-type)
  (buffer :pointer))

(defcfun ("glFinish" %glFinish) :void)

(defcfun ("glFlush" %glFlush) :void)

(defcfun ("glFogCoordf" %glFogCoordf) :void
  (coord float))

(defcfun ("glFogi" %glFogi) :void
  (pname fog-parameter)
  (value int))

(defcfun ("glFogf" %glFogf) :void
  (pname fog-parameter)
  (value float))

(defcfun ("glFrontFace" %glFrontFace) :void
  (dir face-direction))

(defcfun ("glFrustum" %glFrustum) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (near double)
  (far double))

;;; G

(defcfun ("glGenLists" %glGenLists) uint
  (range sizei))

(defcfun ("glGenQueries" %glGenQueries) :void
  (n sizei)
  (ids :pointer))

(defcfun ("glGenTextures" %glGenTextures) :void
  (n sizei)
  (textures :pointer))

(defcfun ("glGetActiveAttrib" %glGetActiveAttrib) :void
  (program uint)
  (index uint)
  (buffer-size sizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defcfun ("glGetActiveUniform" %glGetActiveUniform) :void
  (program uint)
  (index uint)
  (buffer-size sizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defcfun ("glGetAttribLocation" %glGetAttribLocation) int
  (program uint)
  (name :pointer))

(defcfun ("glGetError" %glGetError) gl-error)

(defcfun ("glGetString" %glGetString) :pointer
  (name string-name))

(defcfun ("glGetUniformLocation" %glGetUniformLocation) int
  (program uint)
  (name :pointer))

;;; H

(defcfun ("glHint" %glHint) :void
  (target hint-target)
  (hint hint))

;;; I

(defcfun ("glIndexi" %glIndexi) :void
  (index int))

(defcfun ("glIndexMask" %glIndexMask) :void
  (mask uint))

(defcfun ("glInitNames" %glInitNames) :void)

(defcfun ("glIsEnabled" %glIsEnabled) boolean
  (target enable-cap))

(defcfun ("glIsList" %glIsList) boolean
  (list uint))

;;; J

;;; K

;;; L

(defcfun ("glLightf" %glLightf) :void
  (light light-name)
  (pname light-parameter)
  (param float))

(defcfun ("glLightfv" %glLightfv) :void
  (light light-name)
  (pname light-parameter)
  (param :pointer))

(defcfun ("glLightModelfv" %glLightModelfv) :void
  (pname light-model-parameter)
  (value :pointer))

(defcfun ("glLightModeli" %glLightModeli) :void
  (pname light-model-parameter)
  (value int))

(defcfun ("glLineStipple" %glLineStipple) :void
  (factor int)
  (pattern ushort))

(defcfun ("glLineWidth" %glLineWidth) :void
  (width float))

(defcfun ("glLinkProgram" %glLinkProgram) :void
  (program uint))

(defcfun ("glListBase" %glListBase) :void
  (base uint))

(defcfun ("glLoadIdentity" %glLoadIdentity) :void)

(defcfun ("glLoadMatrixf" %glLoadMatrixf) :void
  (matrix :pointer))

(defcfun ("glLoadName" %glLoadName) :void
  (name uint))

(defcfun ("glLoadTransposeMatrixf" %glLoadTransposeMatrixf) :void
  (matrix :pointer))

(defcfun ("glLogicOp" %glLogicOp) :void
  (op logic-op))

;;; M

(defcfun ("glMap1f" %glMap1f) :void
  (target map1-target)
  (u1 float)
  (u2 float)
  (stride int)
  (order int)
  (points :pointer))

(defcfun ("glMap2f" %glMap2f) :void
  (target map2-target)
  (u1 float)
  (u2 float)
  (ustride int)
  (uorder int)
  (v1 float)
  (v2 float)
  (vstride int)
  (vorder int)
  (points :pointer))

(defcfun ("glMapGrid1f" %glMapGrid1f) :void
  (n int)
  (u1 float)
  (u2 float))

(defcfun ("glMapGrid2f" %glMapGrid2f) :void
  (nu int)
  (u1 float)
  (u2 float)
  (nv int)
  (v1 float)
  (v2 float))

(defcfun ("glMaterialf" %glMaterialf) :void
  (face polygon-face)
  (pname material-parameter)
  (param float))

(defcfun ("glMaterialfv" %glMaterialfv) :void
  (face polygon-face)
  (pname material-parameter)
  (param :pointer))

(defcfun ("glMaterialiv" %glMaterialiv) :void
  (face polygon-face)
  (pname material-parameter)
  (param :pointer))

(defcfun ("glMatrixMode" %glMatrixMode) :void
  (mode matrix-mode))

(defcfun ("glMultiTexCoord4f" %glMultiTexCoord4f) :void
  (texture texture-name)
  (s float)
  (t* float)
  (r float)
  (q float))

(defcfun ("glMultMatrixf" %glMultMatrixf) :void
  (matrix :pointer))

(defcfun ("glMultTransposeMatrixf" %glMultTransposeMatrixf) :void
  (matrix :pointer))

;;; N

(defcfun ("glNewList" %glNewList) :void
  (n uint)
  (mode display-list-mode))

(defcfun ("glNormal3f" %glNormal3f) :void
  (x float)
  (y float)
  (z float))

;;; O

(defcfun ("glOrtho" %glOrtho) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (near double)
  (far double))

;;; P

(defcfun ("glPassThrough" %glPassThrough) :void
  (token float))

(defcfun ("glPixelMapfv" %glPixelMapfv) :void
  (map pixel-map)
  (size sizei)
  (values :pointer))

(defcfun ("glPixelStorei" %glPixelStorei) :void
  (pname pixel-store-mode)
  (value int))

(defcfun ("glPixelStoref" %glPixelStoref) :void
  (pname pixel-store-mode)
  (value float))

(defcfun ("glPixelTransferi" %glPixelTransferi) :void
  (pname pixel-transfer-mode)
  (value int))

(defcfun ("glPixelTransferf" %glPixelTransferf) :void
  (pname pixel-transfer-mode)
  (value float))

(defcfun ("glPointParameteri" %glPointParameteri) :void
  (pname point-parameter)
  (value int))

(defcfun ("glPointParameterf" %glPointParameterf) :void
  (pname point-parameter)
  (value float))

(defcfun ("glPointParameteriv" %glPointParameteriv) :void
  (pname point-parameter)
  (value :pointer))

(defcfun ("glPointParameterfv" %glPointParameterfv) :void
  (pname point-parameter)
  (value :pointer))

(defcfun ("glPointSize" %glPointSize) :void
  (size float))

(defcfun ("glPolygonMode" %glPolygonMode) :void
  (face polygon-face)
  (mode polygon-mode))

(defcfun ("glPolygonOffset" %glPolygonOffset) :void
  (factor float)
  (units float))

(defcfun ("glPolygonStipple" %glPolygonStipple) :void
  (pattern :pointer))

(defcfun ("glPopAttrib" pop-attrib) :void)

(defcfun ("glPopClientAttrib" pop-client-attrib) :void)

(defcfun ("glPopMatrix" %glPopMatrix) :void)

(defcfun ("glPopName" %glPopName) :void)

(defcfun ("glPrioritizeTextures" %glPrioritizeTextures) :void
  (n sizei)
  (textures :pointer)
  (priorities :pointer))

(defcfun ("glPushAttrib" %glPushAttrib) :void
  (mask bitfield))

(defcfun ("glPushClientAttrib" %glPushClientAttrib) :void
  (mask bitfield))

(defcfun ("glPushMatrix" %glPushMatrix) :void)

(defcfun ("glPushName" %glPushName) :void
  (name uint))

;;; Q

;;; R

(defcfun ("glRasterPos4f" %glRasterPos4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

(defcfun ("glReadBuffer" %glReadBuffer) :void
  (src draw-buffer))

(defcfun ("glReadPixels" %glReadPixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glRectf" %glRectf) :void
  (x1 float)
  (y1 float)
  (x2 float)
  (y2 float))

(defcfun ("glRenderMode" %glRenderMode) int
  (mode render-mode))

(defcfun ("glRotatef" %glRotatef) :void
  (theta float)
  (x float)
  (y float)
  (z float))

;;; S

(defcfun ("glSampleCoverage" %glSampleCoverage) :void
  (value clampf)
  (invert boolean))

(defcfun ("glScalef" %glScalef) :void
  (x float)
  (y float)
  (z float))

(defcfun ("glScissor" %glScissor) :void
  (left int)
  (bottom int)
  (width sizei)
  (height sizei))

(defcfun ("glSecondaryColor3f" %glSecondaryColor3f) :void
  (r float)
  (g float)
  (b float))

(defcfun ("glSelectBuffer" %glSelectBuffer) :void
  (n sizei)
  (buffer :pointer))

(defcfun ("glShadeModel" %glShadeModel) :void
  (mode shade-model))

(defcfun ("glShaderSource" %glShaderSource) :void
  (shader uint)
  (num-strings sizei)
  (strings :pointer)
  (lengths :pointer))

(defcfun ("glStencilFunc" %glStencilFunc) :void
  (func compare-func)
  (ref int)
  (mask uint))

(defcfun ("glStencilFuncSeparate" %glStencilFuncSeparate) :void
  (face polygon-face)
  (func compare-func)
  (ref int)
  (mask uint))

(defcfun ("glStencilMask" %glStencilMask) :void
  (mask uint))

(defcfun ("glStencilMaskSeparate" %glStencilMaskSeparate) :void
  (face polygon-face)
  (mask uint))

(defcfun ("glStencilOp" %glStencilOp) :void
  (sfail stencil-op)
  (dpfail stencil-op)
  (dppass stencil-op))

(defcfun ("glStencilOpSeparate" %glStencilOpSeparate) :void
  (face polygon-face)
  (sfail stencil-op)
  (dpfail stencil-op)
  (dppass stencil-op))

;;; T

(defcfun ("glTexCoord1f" %glTexCoord1f) :void
  (s float))

(defcfun ("glTexCoord2f" %glTexCoord2f) :void
  (s float)
  (t* float))

(defcfun ("glTexCoord3f" %glTexCoord3f) :void
  (s float)
  (t* float)
  (r float))

(defcfun ("glTexCoord4f" %glTexCoord4f) :void
  (s float)
  (t* float)
  (r float)
  (q float))

(defcfun ("glTexEnvi" %glTexEnvi) :void
  (target texture-environment-target)
  (pname enum)
  (param int))

(defcfun ("glTexEnvf" %glTexEnvf) :void
  (target texture-environment-target)
  (pname enum)
  (param float))

(defcfun ("glTexEnviv" %glTexEnviv) :void
  (target texture-environment-target)
  (pname enum)
  (params :pointer))

(defcfun ("glTexEnvfv" %glTexEnvfv) :void
  (target texture-environment-target)
  (pname enum)
  (params :pointer))

(defcfun ("glTexParameteri" %glTexParameteri) :void
  (target texture-target)
  (pname texture-parameter)
  (param int))

(defcfun ("glTexParameterf" %glTexParameterf) :void
  (target texture-target)
  (pname texture-parameter)
  (param float))

(defcfun ("glTexParameterfv" %glTexParameterfv) :void
  (target texture-target)
  (pname texture-parameter)
  (params :pointer))

(defcfun ("glTexImage1D" %glTexImage1D) :void
  (target tex-image-1d-target)
  (level int)
  (internal-format int)
  (width sizei)
  (border int)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexImage2D" %glTexImage2D) :void
  (target tex-image-2d-target)
  (level int)
  (internal-format int)
  (width sizei)
  (height sizei)
  (border int)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexImage3D" %glTexImage3D) :void
  (target tex-image-3d-target)
  (level int)
  (internal-format int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexSubImage1D" %glTexSubImage1D) :void
  (target tex-image-1d-target)
  (level int)
  (xoffset int)
  (width sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexSubImage2D" %glTexSubImage2D) :void
  (target tex-image-2d-target)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexSubImage3D" %glTexSubImage3D) :void
  (target tex-image-3d-target)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTranslatef" %glTranslatef) :void
  (x float)
  (y float)
  (z float))

;;; U

(defcfun ("glUniform1f" %glUniform1f) :void
  (location int)
  (x float))

(defcfun ("glUniform2f" %glUniform2f) :void
  (location int)
  (x float)
  (y float))

(defcfun ("glUniform3f" %glUniform3f) :void
  (location int)
  (x float)
  (y float)
  (z float))

(defcfun ("glUniform4f" %glUniform4f) :void
  (location int)
  (x float)
  (y float)
  (z float)
  (w float))

(defcfun ("glUniform1i" %glUniform1i) :void
  (location int)
  (x int))

(defcfun ("glUniform2i" %glUniform2i) :void
  (location int)
  (x int)
  (y int))

(defcfun ("glUniform3i" %glUniform3i) :void
  (location int)
  (x int)
  (y int)
  (z int))

(defcfun ("glUniform4i" %glUniform4i) :void
  (location int)
  (x int)
  (y int)
  (z int)
  (w int))

(defcfun ("glUniformMatrix2fv" %glUniformMatrix2fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defcfun ("glUniformMatrix3fv" %glUniformMatrix3fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defcfun ("glUniformMatrix4fv" %glUniformMatrix4fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defcfun ("glUseProgram" %glUseProgram) :void
  (program uint))

;;; V

(defcfun ("glValidateProgram" %glValidateProgram) :void
  (program uint))

(defcfun ("glVertex2f" %glVertex2f) :void
  (x float)
  (y float))

(defcfun ("glVertex3f" %glVertex3f) :void
  (x float)
  (y float)
  (z float))

(defcfun ("glVertex4f" %glVertex4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

(defcfun ("glVertexAttrib1f" %glVertexAttrib1f) :void
  (index uint)
  (x float))

(defcfun ("glVertexAttrib2f" %glVertexAttrib2f) :void
  (index uint)
  (x float)
  (y float))

(defcfun ("glVertexAttrib3f" %glVertexAttrib3f) :void
  (index uint)
  (x float)
  (y float)
  (z float))

(defcfun ("glVertexAttrib4f" %glVertexAttrib4f) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

(defcfun ("glViewport" %glViewport) :void
  (x int)
  (y int)
  (w sizei)
  (h sizei))

;;; W

(defcfun ("glWindowPos3f" %glWindowPos3f) :void
  (x float)
  (y float)
  (z float))

;;; X

;;; Y

;;; Z
