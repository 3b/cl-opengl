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
  (value GLfloat))

(defcfun ("glActiveTexture" %glActiveTexture) :void
  (name texture-name))

(defcfun ("glAlphaFunc" %glAlphaFunc) :void
  (func compare-func)
  (ref GLclampf))

(defcfun ("glAttachShader" %glAttachShader) :void
  (program GLuint)
  (shader GLuint))

;;; B

(defcfun ("glBegin" %glBegin) :void
  (mode begin-mode))

(defcfun ("glBeginQuery" %glBeginQuery) :void
  (target query-target)
  (id GLuint))

(defcfun ("glBindAttribLocation" %glBindAttribLocation) :void
  (program GLuint)
  (index GLuint)
  (name :pointer))

(defcfun ("glBlendColor" %glBlendColor) :void
  (red GLclampf)
  (green GLclampf)
  (blue GLclampf)
  (alpha GLclampf))

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
  (n GLuint))

(defcfun ("glCallLists" %glCallLists) :void
  (n GLsizei)
  (type call-lists-type)
  (lists :pointer))

(defcfun ("glClear" %glClear) :void
  (bufs GLbitfield))

(defcfun ("glClearAccum" %glClearAccum) :void
  (r GLfloat)
  (g GLfloat)
  (b GLfloat)
  (a GLfloat))

(defcfun ("glClearColor" %glClearColor) :void
  (r GLclampf)
  (g GLclampf)
  (b GLclampf)
  (a GLclampf))

(defcfun ("glClearDepth" %glClearDepth) :void
  (depth GLclampd))

(defcfun ("glClearIndex" %glClearIndex) :void
  (index GLfloat))

(defcfun ("glClearStencil" %glClearStencil) :void
  (s GLint))

(defcfun ("glClipPlane" %glClipPlane) :void
  (p clip-plane-name)
  (eqn :pointer))

(defcfun ("glColor3f" %glColor3f) :void
  (r GLfloat)
  (g GLfloat)
  (b GLfloat))

(defcfun ("glColor4f" %glColor4f) :void
  (r GLfloat)
  (g GLfloat)
  (b GLfloat)
  (a GLfloat))

(defcfun ("glColorMask" %glColorMask) :void
  (r GLboolean)
  (g GLboolean)
  (b GLboolean)
  (a GLboolean))

(defcfun ("glColorMaterial" %glColorMaterial) :void
  (face polygon-face)
  (mode color-material-mode))

(defcfun ("glCompileShader" %glCompileShader) :void
  (shader GLuint))

(defcfun ("glCopyPixels" %glCopyPixels) :void
  (x GLint)
  (y GLint)
  (width GLsizei)
  (height GLsizei)
  (type copy-pixels-type))

(defcfun ("glCreateProgram" %glCreateProgram) GLuint)

(defcfun ("glCreateShader" %glCreateShader) GLuint
  (type shader-type))

(defcfun ("glCullFace" %glCullFace) :void
  (face polygon-face))


;;; D

(defcfun ("glDeleteLists" %glDeleteLists) :void
  (list GLuint)
  (range GLsizei))

(defcfun ("glDeleteProgram" %glDeleteProgram) :void
  (object GLuint))

(defcfun ("glDeleteQueries" %glDeleteQueries) :void
  (n GLsizei)
  (ids :pointer))

(defcfun ("glDeleteShader" %glDeleteShader) :void
  (shader GLuint))

(defcfun ("glDepthFunc" %glDepthFunc) :void
  (func compare-func))

(defcfun ("glDepthMask" %glDepthMask) :void
  (mask GLboolean))

(defcfun ("glDepthRange" %glDepthRange) :void
  (n GLclampd)
  (f GLclampd))

(defcfun ("glDetachShader" %glDetachShader) :void
  (program GLuint)
  (shader GLuint))

(defcfun ("glDrawBuffer" %glDrawBuffer) :void
  (buffer draw-buffer))

(defcfun ("glDrawBuffers" %glDrawBuffers) :void
  (n GLsizei)
  (bufs :pointer))



;;; E

(defcfun ("glEdgeFlag" %glEdgeFlag) :void
  (flag GLboolean))

(defcfun ("glEnd" %glEnd) :void)

(defcfun ("glEndList" %glEndList) :void)

(defcfun ("glEndQuery" %glEndQuery) :void
  (target query-target))

(defcfun ("glEvalCoord1f" %glEvalCoord1f) :void
  (x GLfloat))

(defcfun ("glEvalCoord2f" %glEvalCoord2f) :void
  (x GLfloat)
  (y GLfloat))

(defcfun ("glEvalMesh1" %glEvalMesh1) :void
  (mode eval-mesh-1-mode)
  (p1 GLint)
  (p2 GLint))

(defcfun ("glEvalMesh2" %glEvalMesh2) :void
  (mode eval-mesh-2-mode)
  (p1 GLint)
  (p2 GLint)
  (q1 GLint)
  (q2 GLint))

(defcfun ("glEvalPoint1" %glEvalPoint1) :void
  (p GLint))

(defcfun ("glEvalPoint2" %glEvalPoint2) :void
  (p GLint)
  (q GLint))


;;; F

(defcfun ("glFeedbackBuffer" %glFeedbackBuffer) :void
  (n GLsizei)
  (type feedback-type)
  (buffer :pointer))

(defcfun ("glFinish" %glFinish) :void)

(defcfun ("glFlush" %glFlush) :void)

(defcfun ("glFogCoordf" %glFogCoordf) :void
  (coord GLfloat))

(defcfun ("glFogi" %glFogi) :void
  (pname fog-parameter)
  (value GLint))

(defcfun ("glFogf" %glFogf) :void
  (pname fog-parameter)
  (value GLfloat))

(defcfun ("glFrontFace" %glFrontFace) :void
  (dir face-direction))

(defcfun ("glFrustum" %glFrustum) :void
  (left GLdouble)
  (right GLdouble)
  (bottom GLdouble)
  (top GLdouble)
  (near GLdouble)
  (far GLdouble))


;;; G

(defcfun ("glGenLists" %glGenLists) GLuint
  (range GLsizei))

(defcfun ("glGenQueries" %glGenQueries) :void
  (n GLsizei)
  (ids :pointer))

(defcfun ("glGetActiveAttrib" %glGetActiveAttrib) :void
  (program GLuint)
  (index GLuint)
  (buffer-size GLsizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defcfun ("glGetActiveUniform" %glGetActiveUniform) :void
  (program GLuint)
  (index GLuint)
  (buffer-size GLsizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defcfun ("glGetAttribLocation" %glGetAttribLocation) GLint
  (program GLuint)
  (name :pointer))

(defcfun ("glGetError" %glGetError) gl-error)

(defcfun ("glGetUniformLocation" %glGetUniformLocation) GLint
  (program GLuint)
  (name :pointer))


;;; H

(defcfun ("glHint" %glHint) :void
  (target hint-target)
  (hint hint))


;;; I

(defcfun ("glIndexi" %glIndexi) :void
  (index GLint))

(defcfun ("glIndexMask" %glIndexMask) :void
  (mask GLuint))

(defcfun ("glInitNames" %glInitNames) :void)

(defcfun ("glIsList" %glIsList) GLboolean
  (list GLuint))


;;; J


;;; K


;;; L

(defcfun ("glLightf" %glLightf) :void
  (light light-name)
  (pname light-parameter)
  (param GLfloat))

(defcfun ("glLightfv" %glLightfv) :void
  (light light-name)
  (pname light-parameter)
  (param :pointer))

(defcfun ("glLightModelfv" %glLightModelfv) :void
  (pname light-model-parameter)
  (value :pointer))

(defcfun ("glLightModeli" %glLightModeli) :void
  (pname light-model-parameter)
  (value GLint))

(defcfun ("glLineStipple" %glLineStipple) :void
  (factor GLint)
  (pattern GLushort))

(defcfun ("glLineWidth" %glLineWidth) :void
  (width GLfloat))

(defcfun ("glLinkProgram" %glLinkProgram) :void
  (program GLuint))

(defcfun ("glListBase" %glListBase) :void
  (base GLuint))

(defcfun ("glLoadIdentity" %glLoadIdentity) :void)

(defcfun ("glLoadMatrixf" %glLoadMatrixf) :void
  (matrix :pointer))

(defcfun ("glLoadName" %glLoadName) :void
  (name GLuint))

(defcfun ("glLoadTransposeMatrixf" %glLoadTransposeMatrixf) :void
  (matrix :pointer))

(defcfun ("glLogicOp" %glLogicOp) :void
  (op logic-op))


;;; M

(defcfun ("glMap1f" %glMap1f) :void
  (target map1-target)
  (u1 GLfloat)
  (u2 GLfloat)
  (stride GLint)
  (order GLint)
  (points :pointer))

(defcfun ("glMap2f" %glMap2f) :void
  (target map2-target)
  (u1 GLfloat)
  (u2 GLfloat)
  (ustride GLint)
  (uorder GLint)
  (v1 GLfloat)
  (v2 GLfloat)
  (vstride GLint)
  (vorder GLint)
  (points :pointer))

(defcfun ("glMapGrid1f" %glMapGrid1f) :void
  (n GLint)
  (u1 GLfloat)
  (u2 GLfloat))

(defcfun ("glMapGrid2f" %glMapGrid2f) :void
  (nu GLint)
  (u1 GLfloat)
  (u2 GLfloat)
  (nv GLint)
  (v1 GLfloat)
  (v2 GLfloat))

(defcfun ("glMaterialf" %glMaterialf) :void
  (face polygon-face)
  (pname material-parameter)
  (param GLfloat))

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
  (s GLfloat)
  (t* GLfloat)
  (r GLfloat)
  (q GLfloat))

(defcfun ("glMultMatrixf" %glMultMatrixf) :void
  (matrix :pointer))

(defcfun ("glMultTransposeMatrixf" %glMultTransposeMatrixf) :void
  (matrix :pointer))


;;; N

(defcfun ("glNewList" %glNewList) :void
  (n GLuint)
  (mode display-list-mode))

(defcfun ("glNormal3f" %glNormal3f) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))


;;; O

(defcfun ("glOrtho" %glOrtho) :void
  (left GLdouble)
  (right GLdouble)
  (bottom GLdouble)
  (top GLdouble)
  (near GLdouble)
  (far GLdouble))


;;; P

(defcfun ("glPassThrough" %glPassThrough) :void
  (token GLfloat))

(defcfun ("glPixelMapfv" %glPixelMapfv) :void
  (map pixel-map)
  (size GLsizei)
  (values :pointer))

(defcfun ("glPixelStorei" %glPixelStorei) :void
  (pname pixel-store-mode)
  (value GLint))

(defcfun ("glPixelStoref" %glPixelStoref) :void
  (pname pixel-store-mode)
  (value GLfloat))

(defcfun ("glPixelTransferi" %glPixelTransferi) :void
  (pname pixel-transfer-mode)
  (value GLint))

(defcfun ("glPixelTransferf" %glPixelTransferf) :void
  (pname pixel-transfer-mode)
  (value GLfloat))

(defcfun ("glPointParameteri" %glPointParameteri) :void
  (pname point-parameter)
  (value GLint))

(defcfun ("glPointParameterf" %glPointParameterf) :void
  (pname point-parameter)
  (value GLfloat))

(defcfun ("glPointParameteriv" %glPointParameteriv) :void
  (pname point-parameter)
  (value :pointer))

(defcfun ("glPointParameterfv" %glPointParameterfv) :void
  (pname point-parameter)
  (value :pointer))

(defcfun ("glPointSize" %glPointSize) :void
  (size GLfloat))

(defcfun ("glPolygonMode" %glPolygonMode) :void
  (face polygon-face)
  (mode polygon-mode))

(defcfun ("glPolygonOffst" %glPolygonOffset) :void
  (factor GLfloat)
  (units GLfloat))

(defcfun ("glPopMatrix" %glPopMatrix) :void)

(defcfun ("glPopName" %glPopName) :void)

(defcfun ("glPushMatrix" %glPushMatrix) :void)

(defcfun ("glPushName" %glPushName) :void
  (name GLuint))


;;; Q


;;; R

(defcfun ("glRasterPos4f" %glRasterPos4f) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat)
  (w GLfloat))

(defcfun ("glReadBuffer" %glReadBuffer) :void
  (src draw-buffer))

(defcfun ("glReadPixels" %glReadPixels) :void
  (x GLint)
  (y GLint)
  (width GLsizei)
  (height GLsizei)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glRectf" %glRectf) :void
  (x1 GLfloat)
  (y1 GLfloat)
  (x2 GLfloat)
  (y2 GLfloat))

(defcfun ("glRenderMode" %glRenderMode) GLint
  (mode render-mode))

(defcfun ("glRotatef" %glRotatef) :void
  (theta GLfloat)
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))


;;; S

(defcfun ("glSampleCoverage" %glSampleCoverage) :void
  (value GLclampf)
  (invert GLboolean))

(defcfun ("glScalef" %glScalef) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))

(defcfun ("glScissor" %glScissor) :void
  (left GLint)
  (bottom GLint)
  (width GLsizei)
  (height GLsizei))

(defcfun ("glSecondaryColor3f" %glSecondaryColor3f) :void
  (r GLfloat)
  (g GLfloat)
  (b GLfloat))

(defcfun ("glSelectBuffer" %glSelectBuffer) :void
  (n GLsizei)
  (buffer :pointer))

(defcfun ("glShadeModel" %glShadeModel) :void
  (mode shade-model))

(defcfun ("glShaderSource" %glShaderSource) :void
  (shader GLuint)
  (num-strings GLsizei)
  (strings :pointer)
  (lengths :pointer))

(defcfun ("glStencilFunc" %glStencilFunc) :void
  (func compare-func)
  (ref GLint)
  (mask GLuint))

(defcfun ("glStencilFuncSeparate" %glStencilFuncSeparate) :void
  (face polygon-face)
  (func compare-func)
  (ref GLint)
  (mask GLuint))

(defcfun ("glStencilMask" %glStencilMask) :void
  (mask GLuint))

(defcfun ("glStencilMaskSeparate" %glStencilMaskSeparate) :void
  (face polygon-face)
  (mask GLuint))

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
  (s GLfloat))

(defcfun ("glTexCoord2f" %glTexCoord2f) :void
  (s GLfloat)
  (t* GLfloat))

(defcfun ("glTexCoord3f" %glTexCoord3f) :void
  (s GLfloat)
  (t* GLfloat)
  (r GLfloat))

(defcfun ("glTexCoord4f" %glTexCoord4f) :void
  (s GLfloat)
  (t* GLfloat)
  (r GLfloat)
  (q GLfloat))

(defcfun ("glTexParameteri" %glTexParameteri) :void
  (target texture-target)
  (pname texture-parameter)
  (param GLint))

(defcfun ("glTexParameterf" %glTexParameterf) :void
  (target texture-target)
  (pname texture-parameter)
  (param GLfloat))

(defcfun ("glTexParameterfv" %glTexParameterfv) :void
  (target texture-target)
  (pname texture-parameter)
  (params :pointer))

(defcfun ("glTexImage1D" %glTexImage1D) :void
  (target tex-image-1d-target)
  (level GLint)
  (internal-format GLint)
  (width GLsizei)
  (border GLint)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexImage2D" %glTexImage2D) :void
  (target tex-image-2d-target)
  (level GLint)
  (internal-format GLint)
  (width GLsizei)
  (height GLsizei)
  (border GLint)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTexImage3D" %glTexImage3D) :void
  (target tex-image-3d-target)
  (level GLint)
  (internal-format GLint)
  (width GLsizei)
  (height GLsizei)
  (depth GLsizei)
  (border GLint)
  (format pixel-data-format)
  (type pixel-data-type)
  (data :pointer))

(defcfun ("glTranslatef" %glTranslatef) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))


;;; U

(defcfun ("glUniform1f" %glUniform1f) :void
  (location GLint)
  (x GLfloat))

(defcfun ("glUniform2f" %glUniform2f) :void
  (location GLint)
  (x GLfloat)
  (y GLfloat))

(defcfun ("glUniform3f" %glUniform3f) :void
  (location GLint)
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))

(defcfun ("glUniform4f" %glUniform4f) :void
  (location GLint)
  (x GLfloat)
  (y GLfloat)
  (z GLfloat)
  (w GLfloat))

(defcfun ("glUniform1i" %glUniform1i) :void
  (location GLint)
  (x GLint))

(defcfun ("glUniform2i" %glUniform2i) :void
  (location GLint)
  (x GLint)
  (y GLint))

(defcfun ("glUniform3i" %glUniform3i) :void
  (location GLint)
  (x GLint)
  (y GLint)
  (z GLint))

(defcfun ("glUniform4i" %glUniform4i) :void
  (location GLint)
  (x GLint)
  (y GLint)
  (z GLint)
  (w GLint))

(defcfun ("glUniformMatrix2fv" %glUniformMatrix2fv) :void
  (location GLint)
  (count GLsizei)
  (transpose GLboolean)
  (value :pointer))

(defcfun ("glUniformMatrix3fv" %glUniformMatrix3fv) :void
  (location GLint)
  (count GLsizei)
  (transpose GLboolean)
  (value :pointer))

(defcfun ("glUniformMatrix4fv" %glUniformMatrix4fv) :void
  (location GLint)
  (count GLsizei)
  (transpose GLboolean)
  (value :pointer))

(defcfun ("glUseProgram" %glUseProgram) :void
  (program GLuint))


;;; V

(defcfun ("glValidateProgram" %glValidateProgram) :void
  (program GLuint))

(defcfun ("glVertex2f" %glVertex2f) :void
  (x GLfloat)
  (y GLfloat))

(defcfun ("glVertex3f" %glVertex3f) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))

(defcfun ("glVertex4f" %glVertex4f) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat)
  (w GLfloat))

(defcfun ("glVertexAttrib1f" %glVertexAttrib1f) :void
  (index GLuint)
  (x GLfloat))

(defcfun ("glVertexAttrib2f" %glVertexAttrib2f) :void
  (index GLuint)
  (x GLfloat)
  (y GLfloat))

(defcfun ("glVertexAttrib3f" %glVertexAttrib3f) :void
  (index GLuint)
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))

(defcfun ("glVertexAttrib4f" %glVertexAttrib4f) :void
  (index GLuint)
  (x GLfloat)
  (y GLfloat)
  (z GLfloat)
  (w GLfloat))

(defcfun ("glViewport" %glViewport) :void
  (x GLint)
  (y GLint)
  (w GLsizei)
  (h GLsizei))


;;; W

(defcfun ("glWindowPos3f" %glWindowPos3f) :void
  (x GLfloat)
  (y GLfloat)
  (z GLfloat))


;;; X


;;; Y


;;; Z
