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

;;; Helper macro to define a GL API function and declare it inline.
;;;
;;; FIXME: LISP-FUNCTION-NAME should probably be exported from CFFI
;;; for helper macros like this one.
(defmacro defglfun (name result-type &body body)
  (let ((lisp-name (cffi::lisp-name name)))
    `(progn
       (declaim (inline ,lisp-name))
       (defcfun ,name ,result-type ,@body))))

;;; A

(defglfun ("glAccum" %glAccum) :void
  (op enum)
  (value float))

(defglfun ("glActiveTexture" %glActiveTexture) :void
  (name enum))

(defglfun ("glAlphaFunc" %glAlphaFunc) :void
  (func enum)
  (ref clampf))

(defglfun ("glArrayElement" %glArrayElement) :void
  (i int))

(defglfun ("glAttachShader" %glAttachShader) :void
  (program uint)
  (shader uint))

(defglfun ("glAreTexturesResident" %glAreTexturesResident) boolean
  (n sizei)
  (textures :pointer)
  (residences :pointer))


;;; B

(defglfun ("glBegin" %glBegin) :void
  (mode enum))

(defglfun ("glBeginQuery" %glBeginQuery) :void
  (target enum)
  (id uint))

(defglfun ("glBindAttribLocation" %glBindAttribLocation) :void
  (program uint)
  (index uint)
  (name :pointer))

(defglfun ("glBindBuffer" %glBindBuffer) :void
  (target enum)
  (buffer uint))

(defglfun ("glBindFramebufferEXT" %glBindFramebufferEXT) :void
  (target enum)
  (framebuffer uint))

(defglfun ("glBindRenderbufferEXT" %glBindRenderbufferEXT) :void
  (target enum)
  (renderbuffer uint))

(defglfun ("glBindTexture" %glBindTexture) :void
  (target enum)
  (handle uint))

(defglfun ("glBlendColor" %glBlendColor) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

(defglfun ("glBlendEquation" %glBlendEquation) :void
  (mode enum))

(defglfun ("glBlendEquationSeparate" %glBlendEquationSeparate) :void
  (mode-rgb enum)
  (mode-alpha enum))

(defglfun ("glBlendFunc" %glBlendFunc) :void
  (src enum)
  (dst enum))

(defglfun ("glBlendFuncSeparate" %glBlendFuncSeparate) :void
  (src-rgb enum)
  (dst-rgb enum)
  (src-alpha enum)
  (dst-alpha enum))

(defglfun ("glBufferData" %glBufferData) :void
  (target enum)
  (size sizeiptr)
  (data :pointer)
  (usage enum))

(defglfun ("glBufferSubData" %glBufferSubData) :void
  (target enum)
  (offset intptr)
  (size sizeiptr)
  (data :pointer))

;;; C

(defglfun ("glCallList" %glCallList) :void
  (n uint))

(defglfun ("glCallLists" %glCallLists) :void
  (n sizei)
  (type enum)
  (lists :pointer))

(defglfun ("glCheckFramebufferStatusEXT" %glCheckFramebufferStatusEXT) enum
  (target enum))

(defglfun ("glClear" %glClear) :void
  (bufs bitfield))

(defglfun ("glClearAccum" %glClearAccum) :void
  (r float)
  (g float)
  (b float)
  (a float))

(defglfun ("glClearColor" %glClearColor) :void
  (r clampf)
  (g clampf)
  (b clampf)
  (a clampf))

(defglfun ("glClearDepth" %glClearDepth) :void
  (depth clampd))

(defglfun ("glClearIndex" %glClearIndex) :void
  (index float))

(defglfun ("glClearStencil" %glClearStencil) :void
  (s int))

(defglfun ("glClientActiveTexture" %glClientActiveTexture) :void
  (texture enum))

(defglfun ("glClipPlane" %glClipPlane) :void
  (p enum)
  (eqn :pointer))

(defglfun ("glColor3f" %glColor3f) :void
  (r float)
  (g float)
  (b float))

(defglfun ("glColor4f" %glColor4f) :void
  (r float)
  (g float)
  (b float)
  (a float))

(defglfun ("glColorMask" %glColorMask) :void
  (r boolean)
  (g boolean)
  (b boolean)
  (a boolean))

(defglfun ("glColorMaterial" %glColorMaterial) :void
  (face enum)
  (mode enum))

(defglfun ("glColorPointer" %glColorPointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glColorTable" %glColorTable) :void
  (target enum)
  (internal-format enum)
  (width sizei)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glCompileShader" %glCompileShader) :void
  (shader uint))

(defglfun ("glCopyPixels" %glCopyPixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (type enum))

(defglfun ("glCopyTexImage1D" %glCopyTexImage1D) :void
  (target enum)
  (level int)
  (internal-format int)
  (x int)
  (y int)
  (width sizei)
  (border int))

(defglfun ("glCopyTexImage2D" %glCopyTexImage2D) :void
  (target enum)
  (level int)
  (internal-format int)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))


(defglfun ("glCopyTexSubImage1D" %glCopyTexSubImage1D) :void
  (target enum)
  (level int)
  (xoffset int)
  (x int)
  (y int)
  (width sizei))

(defglfun ("glCopyTexSubImage3D" %glCopyTexSubImage3D) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

(defglfun ("glCopyTexSubImage2D" %glCopyTexSubImage2D) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

(defglfun ("glCreateProgram" %glCreateProgram) uint)

(defglfun ("glCreateShader" %glCreateShader) uint
  (type enum))

(defglfun ("glCullFace" %glCullFace) :void
  (face enum))


;;; D

(defglfun ("glDeleteBuffers" %glDeleteBuffers) :void
  (n sizei)
  (buffers :pointer))

(defglfun ("glDeleteFramebuffersEXT" %glDeleteFramebuffersEXT) :void
  (n sizei)
  (framebuffers :pointer))

(defglfun ("glDeleteLists" %glDeleteLists) :void
  (list uint)
  (range sizei))

(defglfun ("glDeleteProgram" %glDeleteProgram) :void
  (object uint))

(defglfun ("glDeleteQueries" %glDeleteQueries) :void
  (n sizei)
  (ids :pointer))

(defglfun ("glDeleteRenderbuffersEXT" %glDeleteRenderbuffersEXT) :void
  (n sizei)
  (renderbuffers :pointer))

(defglfun ("glDeleteShader" %glDeleteShader) :void
  (shader uint))

(defglfun ("glDeleteTextures" %glDeleteTextures) :void
  (n sizei)
  (textures :pointer))

(defglfun ("glDepthFunc" %glDepthFunc) :void
  (func enum))

(defglfun ("glDepthMask" %glDepthMask) :void
  (mask boolean))

(defglfun ("glDepthRange" %glDepthRange) :void
  (n clampd)
  (f clampd))

(defglfun ("glDetachShader" %glDetachShader) :void
  (program uint)
  (shader uint))

(defglfun ("glDisable" %glDisable) :void
  (target enum))

(defglfun ("glDisableClientState" %glDisableClientState) :void
  (array enum))

(defglfun ("glDisableVertexAttribArray" %glDisableVertexAttribArray) :void
  (index uint))

(defglfun ("glDrawArrays" %glDrawArrays) :void
  (mode enum)
  (first int)
  (count sizei))

(defglfun ("glDrawBuffer" %glDrawBuffer) :void
  (buffer enum))

(defglfun ("glDrawBuffers" %glDrawBuffers) :void
  (n sizei)
  (bufs :pointer))

(defglfun ("glDrawElements" %glDrawElements) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices :pointer))

;;; E

(defglfun ("glEdgeFlag" %glEdgeFlag) :void
  (flag boolean))

(defglfun ("glEdgeFlagPointer" %glEdgeFlagPointer) :void
  (stride sizei)
  (pointer :pointer))

(defglfun ("glEnable" %glEnable) :void
  (target enum))

(defglfun ("glEnableClientState" %glEnableClientState) :void
  (array enum))

(defglfun ("glEnableVertexAttribArray" %glEnableVertexAttribArray) :void
  (index uint))

(defglfun ("glEnd" %glEnd) :void)

(defglfun ("glEndList" %glEndList) :void)

(defglfun ("glEndQuery" %glEndQuery) :void
  (target enum))

(defglfun ("glEvalCoord1f" %glEvalCoord1f) :void
  (x float))

(defglfun ("glEvalCoord2f" %glEvalCoord2f) :void
  (x float)
  (y float))

(defglfun ("glEvalMesh1" %glEvalMesh1) :void
  (mode enum)
  (p1 int)
  (p2 int))

(defglfun ("glEvalMesh2" %glEvalMesh2) :void
  (mode enum)
  (p1 int)
  (p2 int)
  (q1 int)
  (q2 int))

(defglfun ("glEvalPoint1" %glEvalPoint1) :void
  (p int))

(defglfun ("glEvalPoint2" %glEvalPoint2) :void
  (p int)
  (q int))

;;; F

(defglfun ("glFeedbackBuffer" %glFeedbackBuffer) :void
  (n sizei)
  (type enum)
  (buffer :pointer))

(defglfun ("glFinish" %glFinish) :void)

(defglfun ("glFlush" %glFlush) :void)

(defglfun ("glFogCoordf" %glFogCoordf) :void
  (coord float))

(defglfun ("glFogCoordPointer" %glFogCoordPointer) :void
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glFogi" %glFogi) :void
  (pname enum)
  (value int))

(defglfun ("glFogf" %glFogf) :void
  (pname enum)
  (value float))

(defglfun ("glFramebufferRenderbufferEXT" %glFramebufferRenderbufferEXT) :void
  (target enum)
  (attachment enum)
  (renderbuffertarget enum)
  (renderbuffer uint))

(defglfun ("glFramebufferTexture1DEXT" %glFramebufferTexture1DEXT) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

(defglfun ("glFramebufferTexture2DEXT" %glFramebufferTexture2DEXT) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

(defglfun ("glFramebufferTexture3DEXT" %glFramebufferTexture3DEXT) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int)
  (zoffset int))

(defglfun ("glFrontFace" %glFrontFace) :void
  (dir enum))

(defglfun ("glFrustum" %glFrustum) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (near double)
  (far double))

;;; G

(defglfun ("glGenBuffers" %glGenBuffers) :void
  (n sizei)
  (buffers :pointer))

(defglfun ("glGenFramebuffersEXT" %glGenFramebuffersEXT) :void
  (n sizei)
  (framebuffers :pointer))

(defglfun ("glGenLists" %glGenLists) uint
  (range sizei))

(defglfun ("glGenQueries" %glGenQueries) :void
  (n sizei)
  (ids :pointer))

(defglfun ("glGenRenderbuffersEXT" %glGenRenderbuffersEXT) :void
  (n sizei)
  (renderbuffers :pointer))

(defglfun ("glGenTextures" %glGenTextures) :void
  (n sizei)
  (textures :pointer))

(defglfun ("glGenerateMipmapEXT" %glGenerateMipmapEXT) :void
  (target enum))

(defglfun ("glGetActiveAttrib" %glGetActiveAttrib) :void
  (program uint)
  (index uint)
  (buffer-size sizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defglfun ("glGetActiveUniform" %glGetActiveUniform) :void
  (program uint)
  (index uint)
  (buffer-size sizei)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :pointer))

(defglfun ("glGetAttribLocation" %glGetAttribLocation) int
  (program uint)
  (name :pointer))

(defglfun ("glGetBooleanv" %glGetBooleanv) :void
  (value enum)
  (data :pointer))

(defglfun ("glGetDoublev" %glGetDoublev) :void
  (value enum)
  (data :pointer))

(defcenum (gl-error enum)
  (:no-error #x0)
  (:invalid-enum #x500)
  (:invalid-value #x501)
  (:invalid-operation #x502)
  (:stack-overflow #x503)
  (:stack-underflow #x504)
  (:out-of-memory #x505)
  (:table-too-large #x8031))

(defglfun ("glGetError" %glGetError) gl-error)

(defglfun ("glGetFloatv" %glGetFloatv) :void
  (value enum)
  (data :pointer))

(defglfun ("glGetFramebufferAttachmentParameterivEXT" %glGetFramebufferAttachmentParameterivEXT) :void
  (target enum)
  (attachment enum)
  (pname enum)
  (params :pointer))

(defglfun ("glGetIntegerv" %glGetIntegerv) :void
  (value enum)
  (data :pointer))

(defglfun ("glGetRenderbufferParameterivEXT" %glGetRenderbufferParameterivEXT) :void
  (target enum)
  (pname enum)
  (params :pointer))

(defglfun ("glGetString" %glGetString) :pointer
  (name enum))

(defglfun ("glGetUniformLocation" %glGetUniformLocation) int
  (program uint)
  (name :pointer))

;;; H

(defglfun ("glHint" %glHint) :void
  (target enum)
  (hint enum))

;;; I

(defglfun ("glIndexi" %glIndexi) :void
  (index int))

(defglfun ("glIndexMask" %glIndexMask) :void
  (mask uint))

(defglfun ("glIndexPointer" %glIndexPointer) :void
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glInitNames" %glInitNames) :void)

(defglfun ("glInterleavedArrays" %glInterleavedArrays) :void
  (frmat enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glIsEnabled" %glIsEnabled) boolean
  (target enum))

(defglfun ("glIsFramebufferEXT" %glIsFramebufferEXT) boolean
  (framebuffer uint))

(defglfun ("glIsList" %glIsList) boolean
  (list uint))

(defglfun ("glIsRenderbufferEXT" %glIsRenderbufferEXT) boolean
  (renderbuffer uint))



;;; J

;;; K

;;; L

(defglfun ("glLightf" %glLightf) :void
  (light enum)
  (pname enum)
  (param float))

(defglfun ("glLightfv" %glLightfv) :void
  (light enum)
  (pname enum)
  (param :pointer))

(defglfun ("glLightModelfv" %glLightModelfv) :void
  (pname enum)
  (value :pointer))

(defglfun ("glLightModeli" %glLightModeli) :void
  (pname enum)
  (value int))

(defglfun ("glLineStipple" %glLineStipple) :void
  (factor int)
  (pattern ushort))

(defglfun ("glLineWidth" %glLineWidth) :void
  (width float))

(defglfun ("glLinkProgram" %glLinkProgram) :void
  (program uint))

(defglfun ("glListBase" %glListBase) :void
  (base uint))

(defglfun ("glLoadIdentity" %glLoadIdentity) :void)

(defglfun ("glLoadMatrixf" %glLoadMatrixf) :void
  (matrix :pointer))

(defglfun ("glLoadName" %glLoadName) :void
  (name uint))

(defglfun ("glLoadTransposeMatrixf" %glLoadTransposeMatrixf) :void
  (matrix :pointer))

(defglfun ("glLogicOp" %glLogicOp) :void
  (op enum))

;;; M

(defglfun ("glMap1f" %glMap1f) :void
  (target enum)
  (u1 float)
  (u2 float)
  (stride int)
  (order int)
  (points :pointer))

(defglfun ("glMap2f" %glMap2f) :void
  (target enum)
  (u1 float)
  (u2 float)
  (ustride int)
  (uorder int)
  (v1 float)
  (v2 float)
  (vstride int)
  (vorder int)
  (points :pointer))

(defglfun ("glMapBuffer" %glMapBuffer) :pointer
  (target enum)
  (access enum))

(defglfun ("glMapGrid1f" %glMapGrid1f) :void
  (n int)
  (u1 float)
  (u2 float))

(defglfun ("glMapGrid2f" %glMapGrid2f) :void
  (nu int)
  (u1 float)
  (u2 float)
  (nv int)
  (v1 float)
  (v2 float))

(defglfun ("glMaterialf" %glMaterialf) :void
  (face enum)
  (pname enum)
  (param float))

(defglfun ("glMaterialfv" %glMaterialfv) :void
  (face enum)
  (pname enum)
  (param :pointer))

(defglfun ("glMaterialiv" %glMaterialiv) :void
  (face enum)
  (pname enum)
  (param :pointer))

(defglfun ("glMatrixMode" %glMatrixMode) :void
  (mode enum))

(defglfun ("glMultiTexCoord4f" %glMultiTexCoord4f) :void
  (texture enum)
  (s float)
  (t* float)
  (r float)
  (q float))

(defglfun ("glMultMatrixf" %glMultMatrixf) :void
  (matrix :pointer))

(defglfun ("glMultTransposeMatrixf" %glMultTransposeMatrixf) :void
  (matrix :pointer))

;;; N

(defglfun ("glNewList" %glNewList) :void
  (n uint)
  (mode enum))

(defglfun ("glNormal3f" %glNormal3f) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glNormalPointer" %glNormalPointer) :void
  (type enum)
  (stride sizei)
  (pointer :pointer))

;;; O

(defglfun ("glOrtho" %glOrtho) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (near double)
  (far double))

;;; P

(defglfun ("glPassThrough" %glPassThrough) :void
  (token float))

(defglfun ("glPixelMapfv" %glPixelMapfv) :void
  (map enum)
  (size sizei)
  (values :pointer))

(defglfun ("glPixelStorei" %glPixelStorei) :void
  (pname enum)
  (value int))

(defglfun ("glPixelStoref" %glPixelStoref) :void
  (pname enum)
  (value float))

(defglfun ("glPixelTransferi" %glPixelTransferi) :void
  (pname enum)
  (value int))

(defglfun ("glPixelTransferf" %glPixelTransferf) :void
  (pname enum)
  (value float))

(defglfun ("glPointParameteri" %glPointParameteri) :void
  (pname enum)
  (value int))

(defglfun ("glPointParameterf" %glPointParameterf) :void
  (pname enum)
  (value float))

(defglfun ("glPointParameteriv" %glPointParameteriv) :void
  (pname enum)
  (value :pointer))

(defglfun ("glPointParameterfv" %glPointParameterfv) :void
  (pname enum)
  (value :pointer))

(defglfun ("glPointSize" %glPointSize) :void
  (size float))

(defglfun ("glPolygonMode" %glPolygonMode) :void
  (face enum)
  (mode enum))

(defglfun ("glPolygonOffset" %glPolygonOffset) :void
  (factor float)
  (units float))

(defglfun ("glPolygonStipple" %glPolygonStipple) :void
  (pattern :pointer))

(defglfun ("glPopAttrib" pop-attrib) :void)

(defglfun ("glPopClientAttrib" pop-client-attrib) :void)

(defglfun ("glPopMatrix" %glPopMatrix) :void)

(defglfun ("glPopName" %glPopName) :void)

(defglfun ("glPrioritizeTextures" %glPrioritizeTextures) :void
  (n sizei)
  (textures :pointer)
  (priorities :pointer))

(defglfun ("glPushAttrib" %glPushAttrib) :void
  (mask bitfield))

(defglfun ("glPushClientAttrib" %glPushClientAttrib) :void
  (mask bitfield))

(defglfun ("glPushMatrix" %glPushMatrix) :void)

(defglfun ("glPushName" %glPushName) :void
  (name uint))

;;; Q

;;; R

(defglfun ("glRasterPos4f" %glRasterPos4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

(defglfun ("glReadBuffer" %glReadBuffer) :void
  (src enum))

(defglfun ("glReadPixels" %glReadPixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glRectf" %glRectf) :void
  (x1 float)
  (y1 float)
  (x2 float)
  (y2 float))

(defglfun ("glRenderbufferStorageEXT" %glRenderbufferStorageEXT) :void
  (target enum)
  (internal-format enum)
  (width sizei)
  (height sizei))

(defglfun ("glRenderMode" %glRenderMode) int
  (mode enum))

(defglfun ("glRotatef" %glRotatef) :void
  (theta float)
  (x float)
  (y float)
  (z float))

;;; S

(defglfun ("glSampleCoverage" %glSampleCoverage) :void
  (value clampf)
  (invert boolean))

(defglfun ("glScalef" %glScalef) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glScissor" %glScissor) :void
  (left int)
  (bottom int)
  (width sizei)
  (height sizei))

(defglfun ("glSecondaryColor3f" %glSecondaryColor3f) :void
  (r float)
  (g float)
  (b float))

(defglfun ("glSecondaryColorPointer" %glSecondaryColorPointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glSelectBuffer" %glSelectBuffer) :void
  (n sizei)
  (buffer :pointer))

(defglfun ("glShadeModel" %glShadeModel) :void
  (mode enum))

(defglfun ("glShaderSource" %glShaderSource) :void
  (shader uint)
  (num-strings sizei)
  (strings :pointer)
  (lengths :pointer))

(defglfun ("glStencilFunc" %glStencilFunc) :void
  (func enum)
  (ref int)
  (mask uint))

(defglfun ("glStencilFuncSeparate" %glStencilFuncSeparate) :void
  (face enum)
  (func enum)
  (ref int)
  (mask uint))

(defglfun ("glStencilMask" %glStencilMask) :void
  (mask uint))

(defglfun ("glStencilMaskSeparate" %glStencilMaskSeparate) :void
  (face enum)
  (mask uint))

(defglfun ("glStencilOp" %glStencilOp) :void
  (sfail enum)
  (dpfail enum)
  (dppass enum))

(defglfun ("glStencilOpSeparate" %glStencilOpSeparate) :void
  (face enum)
  (sfail enum)
  (dpfail enum)
  (dppass enum))

;;; T

(defglfun ("glTexCoord1f" %glTexCoord1f) :void
  (s float))

(defglfun ("glTexCoord2f" %glTexCoord2f) :void
  (s float)
  (t* float))

(defglfun ("glTexCoord3f" %glTexCoord3f) :void
  (s float)
  (t* float)
  (r float))

(defglfun ("glTexCoord4f" %glTexCoord4f) :void
  (s float)
  (t* float)
  (r float)
  (q float))

(defglfun ("glTexCoordPointer" %glTexCoordPointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glTexEnvi" %glTexEnvi) :void
  (target enum)
  (pname enum)
  (param int))

(defglfun ("glTexEnvf" %glTexEnvf) :void
  (target enum)
  (pname enum)
  (param float))

(defglfun ("glTexEnviv" %glTexEnviv) :void
  (target enum)
  (pname enum)
  (params :pointer))

(defglfun ("glTexEnvfv" %glTexEnvfv) :void
  (target enum)
  (pname enum)
  (params :pointer))

(defglfun ("glTexParameteri" %glTexParameteri) :void
  (target enum)
  (pname enum)
  (param int))

(defglfun ("glTexParameterf" %glTexParameterf) :void
  (target enum)
  (pname enum)
  (param float))

(defglfun ("glTexParameterfv" %glTexParameterfv) :void
  (target enum)
  (pname enum)
  (params :pointer))

(defglfun ("glTexImage1D" %glTexImage1D) :void
  (target enum)
  (level int)
  (internal-format int)
  (width sizei)
  (border int)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glTexImage2D" %glTexImage2D) :void
  (target enum)
  (level int)
  (internal-format int)
  (width sizei)
  (height sizei)
  (border int)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glTexImage3D" %glTexImage3D) :void
  (target enum)
  (level int)
  (internal-format int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glTexSubImage1D" %glTexSubImage1D) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glTexSubImage2D" %glTexSubImage2D) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (data :pointer))

(defglfun ("glTexSubImage3D" %glTexSubImage3D) :void
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
  (data :pointer))

(defglfun ("glTranslatef" %glTranslatef) :void
  (x float)
  (y float)
  (z float))

;;; U

(defglfun ("glUniform1f" %glUniform1f) :void
  (location int)
  (x float))

(defglfun ("glUniform2f" %glUniform2f) :void
  (location int)
  (x float)
  (y float))

(defglfun ("glUniform3f" %glUniform3f) :void
  (location int)
  (x float)
  (y float)
  (z float))

(defglfun ("glUniform4f" %glUniform4f) :void
  (location int)
  (x float)
  (y float)
  (z float)
  (w float))

(defglfun ("glUniform1i" %glUniform1i) :void
  (location int)
  (x int))

(defglfun ("glUniform2i" %glUniform2i) :void
  (location int)
  (x int)
  (y int))

(defglfun ("glUniform3i" %glUniform3i) :void
  (location int)
  (x int)
  (y int)
  (z int))

(defglfun ("glUniform4i" %glUniform4i) :void
  (location int)
  (x int)
  (y int)
  (z int)
  (w int))

(defglfun ("glUniformMatrix2fv" %glUniformMatrix2fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defglfun ("glUniformMatrix3fv" %glUniformMatrix3fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defglfun ("glUniformMatrix4fv" %glUniformMatrix4fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value :pointer))

(defglfun ("glUnmapBuffer" %glUnmapBuffer) :void
  (target enum))

(defglfun ("glUseProgram" %glUseProgram) :void
  (program uint))

;;; V

(defglfun ("glValidateProgram" %glValidateProgram) :void
  (program uint))

(defglfun ("glVertex2f" %glVertex2f) :void
  (x float)
  (y float))

(defglfun ("glVertex3f" %glVertex3f) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glVertex4f" %glVertex4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

(defglfun ("glVertexAttrib1f" %glVertexAttrib1f) :void
  (index uint)
  (x float))

(defglfun ("glVertexAttrib2f" %glVertexAttrib2f) :void
  (index uint)
  (x float)
  (y float))

(defglfun ("glVertexAttrib3f" %glVertexAttrib3f) :void
  (index uint)
  (x float)
  (y float)
  (z float))

(defglfun ("glVertexAttrib4f" %glVertexAttrib4f) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

(defglfun ("glVertexAttribPointer" %glVertexAttribPointer) :void
  (index uint)
  (size int)
  (type enum)
  (normalized boolean)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glVertexPointer" %glVertexPointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer :pointer))

(defglfun ("glViewport" %glViewport) :void
  (x int)
  (y int)
  (w sizei)
  (h sizei))

;;; W

(defglfun ("glWindowPos3f" %glWindowPos3f) :void
  (x float)
  (y float)
  (z float))

;;; X

;;; Y

;;; Z
