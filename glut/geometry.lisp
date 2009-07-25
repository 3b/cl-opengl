;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; geometry.lisp --- GLUT Geometric Object Rendering API.
;;;
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

(in-package #:cl-glut)

;;; Functions.

(defcfun ("glutWireCube" wire-cube) :void
  (size %gl:double))

(defcfun ("glutSolidCube" solid-cube) :void
  (size %gl:double))

(defcfun ("glutWireSphere" wire-sphere) :void
  (radius %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("glutSolidSphere" solid-sphere) :void
  (radius %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("glutWireCone" wire-cone) :void
  (base %gl:double)
  (height %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("glutSolidCone" solid-cone) :void
  (base %gl:double)
  (height %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("glutWireTorus" wire-torus) :void
  (inner-radius %gl:double)
  (outer-radius %gl:double)
  (slices %gl:int)
  (rings %gl:int))

(defcfun ("glutSolidTorus" solid-torus) :void
  (inner-radius %gl:double)
  (outer-radius %gl:double)
  (slices %gl:int)
  (rings %gl:int))

(defcfun ("glutWireDodecahedron" wire-dodecahedron) :void)
(defcfun ("glutWireOctahedron" wire-octahedron) :void)
(defcfun ("glutWireTetrahedron" wire-tetrahedron) :void)
(defcfun ("glutWireIcosahedron" wire-icosahedron) :void)

(defcfun ("glutSolidDodecahedron" solid-dodecahedron) :void)
(defcfun ("glutSolidOctahedron" solid-octahedron) :void)
(defcfun ("glutSolidTetrahedron" solid-tetrahedron) :void)
(defcfun ("glutSolidIcosahedron" solid-icosahedron) :void)

(defcfun ("glutWireTeapot" wire-teapot) :void
  (size %gl:double))

(defcfun ("glutSolidTeapot" solid-teapot) :void
  (size %gl:double))

;;; The following are freeglut extensions:

#-darwin
(defcfun ("glutWireRhombicDodecahedron" wire-rhombic-dodecahedron) :void)

#-darwin
(defcfun ("glutSolidRhombicDodecahedron" solid-rhombic-dodecahedron) :void)

#-darwin
(defcfun ("glutWireSierpinskiSponge" %glutWireSierpinskiSponge) :void
  (num-levels :int)
  (offset-seq :pointer) ; GLdouble offset[3]
  (scale %gl:double))

#-darwin
(defun wire-sierpinski-sponge (num-levels offset-seq scale)
  (gl::with-opengl-sequence (offset '%gl:double offset-seq)
    (%glutWireSierpinskiSponge num-levels offset scale)))

#-darwin
(defcfun ("glutSolidSierpinskiSponge" %glutSolidSierpinskiSponge) :void
  (num-levels :int)
  (offset-seq :pointer) ; GLdouble offset[3]
  (scale %gl:double))

#-darwin
(defun solid-sierpinski-sponge (num-levels offset-seq scale)
  (gl::with-opengl-sequence (offset '%gl:double offset-seq)
    (%glutSolidSierpinskiSponge num-levels offset scale)))

#-darwin
(defcfun ("glutWireCylinder" wire-cylinder) :void
  (radius %gl:double)
  (height %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

#-darwin
(defcfun ("glutSolidCylinder" solid-cylinder) :void
  (radius %gl:double)
  (height %gl:double)
  (slices %gl:int)
  (stacks %gl:int))