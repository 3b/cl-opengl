;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; glu.lisp --- Bindings to GLU routines.
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

(in-package #:cl-glu)

;;;; Types

(defcenum (string-name gl:enum)
  (:version 100800)
  :extensions)

;;;; 2. Initialization

(defcfun ("gluGetString" get-string) :string
  (name-keyword string-name))

(defcfun ("gluCheckExtension" check-extension) (:boolean gl:boolean)
  (extension-name :string)
  (extension-string :string))

;;;; 3. Mipmapping

;;; TODO: make this struct or an object

;;;; 3.1 Image Scaling

(defcfun ("gluScaleImage" %gluScaleImage) :int
  (format gl:pixel-data-format)
  (width-in gl:sizei)
  (height-in gl:sizei)
  (type-in gl:pixel-data-type)
  (data-in :pointer)
  (width-out gl:sizei)
  (height-out gl:sizei)
  (type-out gl:pixel-data-type)
  (data-out :pointer))

;;(defun scale-image (format width-in height-in type-in data-in
                    ;; or just a glu:image object, instead of all these
                    ;; arguments.
;;                    width-out height-out type-out)
  ;; allocate data-out
  ;; call gluScaleImage(), check for errors
;;)

;;;; 3.2 Automatic Mipmapping

;;; TODO: gluBuild{1,2,3}DMipmaps; gluBuildP1,2,3}DMipmapLevels

;;;; 4. Matrix Manipulation

;;;; 4.1 Matrix Setup

(defcfun ("gluOrtho2D" ortho-2d) :void
  (left   gl:ensure-double)
  (right  gl:ensure-double)
  (bottom gl:ensure-double)
  (top    gl:ensure-double))

(defcfun ("gluPerspective" perspective) :void
  (fov-y  gl:ensure-double)
  (right  gl:ensure-double)
  (bottom gl:ensure-double)
  (top    gl:ensure-double))

(defcfun ("gluLookAt" look-at) :void
  (eye-x gl:ensure-double)
  (eye-y gl:ensure-double)
  (eye-z gl:ensure-double)
  (center-x gl:ensure-double)
  (center-y gl:ensure-double)
  (center-z gl:ensure-double)
  (up-x gl:ensure-double)
  (up-y gl:ensure-double)
  (up-z gl:ensure-double))

(defcfun ("gluPickMatrix" %gluPickMatrix) :void
  (x gl:ensure-double)
  (y gl:ensure-double)
  (delta-x gl:ensure-double)
  (delta-y gl:ensure-double)
  (viewport :pointer))

(defun pick-matrix (x y delta-x delta-y viewport)
  (assert (= (length viewport) 4))
  (gl::with-opengl-sequence (array 'gl:int viewport)
    (%gluPickMatrix x y delta-x delta-y array)))

;;;; 4.2 Coordinate Projection

;;; TODO: gluProject, gluUnProject, gluUnProject4

;;;; 5. Polygon Tessellation

;;; TODO: make an object for these too..

;;;; 5.1 The Tessellation Object

(defctype tesselator :pointer :translate-p nil)

(defcfun ("gluNewTess" new-tess) tesselator)

(defcfun ("gluDeleteTess" delete-tess) :void
  (tess-obj tesselator))

;;;; 5.2 Polygon Definition

(defcfun ("gluTessBeginPolygon" tess-begin-polygon) :void
  (tess tesselator)
  (polygon-data :pointer))

(defcfun ("gluTessBeginContour" tess-begin-contour) :void
  (tess tesselator))

(defcfun ("gluTessVertex" tess-vertex) :void
  (tess tesselator)
  (coords :pointer) ; GLdouble coords[3]
  (vertex-data :pointer))

(defcfun ("gluTessEndContour" tess-end-contour) :void
  (tess tesselator))

(defcfun ("gluTessEndPolygon" tess-end-polygon) :void
  (tess tesselator))

;;;; 5.3 Callbacks

;;; TODO
;;(defcfun ("gluTessCallback" tess-callback) :void
;;  )

;;;; 5.4 Control Over Tessellation

;;(defcfun ("gluTessProperty" tess-property) :void
;;  )

;;;; 5.7 Backwards Compatibility

;;; We don't bother defining gluBeginPolygon(), gluNextContour() and
;;; gluEndPolygon().

;;;; 6. Quadrics
;;;; 6.1 The Quadrics Object

;;; TODO: make a clos class for these too

(defctype quadric-obj :pointer :translate-p nil)

(defcfun ("gluNewQuadric" new-quadric) quadric-obj)

(defcfun ("gluDeleteQuadric" delete-quadric) :void
  (quadric-object quadric-obj))

;;;; 6.2 Callbacks

;;; TODO
;;(defcfun ("gluQuadricCallback" quadric-callback) :void
;;  (quadric-object quadric-obj)
;;  ...)

;;;; 6.3 Rendering Styles

;;(defcfun ("gluQuadricNormals" quadric-normals) :void
;;  (quadric-object quadric-obj)
;;  ...)

;; gluQuadricTexture
;; gluQuadricOrientation
;; gluQuadricDrawStyle

;;;; 6.4 Quadrics Primitives

(defcfun ("gluSphere" sphere) :void
  (quadric-object quadric-obj)
  (radius gl:ensure-double)
  (slices gl:int)
  (stacks gl:int))

(defcfun ("gluCylinder" cylinder) :void
  (quadric-object quadric-obj)
  (base-radius gl:ensure-double)
  (top-radius gl:ensure-double)
  (height gl:ensure-double)
  (slices gl:int)
  (stacks gl:int))

(defcfun ("gluDisk" disk) :void
  (quadric-object quadric-obj)
  (inner-radius gl:ensure-double)
  (outer-radius gl:ensure-double)
  (slices gl:int)
  (loops gl:int))

(defcfun ("gluPartialDisk" partial-disk) :void
  (quadric-object quadric-obj)
  (inner-radius gl:ensure-double)
  (outer-radius gl:ensure-double)
  (slices gl:int)
  (loops gl:int)
  (start-angle gl:ensure-double)
  (sweep-angle gl:ensure-double))

;;;; 7. NURBS
;;;; 7.1 The NURBS Object

(defctype nurbs-obj :pointer)

(defcfun ("gluNewNurbsRenderer" new-nurbs-renderer) nurbs-obj)

(defcfun ("gluDeleteNurbsRenderer" delete-nurbs-renderer) :void
  (nurbs-object nurbs-obj))

;;;; 7.2 Callbacks

;;; TODO

;;(defcfun ("gluNurbsCallback" nurbs-callback) :void
;;  )

;;;; 7.3 NURBS Curves

(defcfun ("gluBeginCurve" begin-curve) :void
  (nurbs-object nurbs-obj))

;; (defcfun ("gluNurbsCurve" nurbs-curve) :void
;;   (nurbs-object nurbs-obj)
;;   (n-knots gl:int)
;;   ...)

;;; 7.4 NURBS Surfaces

(defcfun ("gluBeginSurface" begin-surface) :void
  (nurbs-object nurbs-obj))

;;(defcfun ("gluNurbsSurface" nurbs-surface) :void
;;  ...)

(defcfun ("gluEndSurface" end-surface) :void
  (nurbs-object nurbs-obj))

;;;; 7.5 Trimming

(defcfun ("gluBeginTrim" begin-trim) :void
  (nurbs-object nurbs-obj))

;;(defcfun ("gluPwlCurve" pwl-curve) :void
;;  ...)

;;(defcfun ("gluNurbsCurve" nurbs-curve) :void
;;  ...)

(defcfun ("gluEndTrim" end-trim) :void
  (nurbs-object nurbs-obj))

;;;; 7.6 NURBS Properties

;;(defcfun ("gluNurbsProperty" nurbs-property) :void
;;  ...)

;;(defcfun ("gluLoadSamplingMatrices" load-sampling-matrices) :void
;;  ...)

;;(defcfun ("gluGetNurbsProperty" get-nurbs-property) :void
;;  (nurbs-object nurbs-obj)
;;  ...)

;;;; 8. Errors

;; maybe this could be a subclass of opengl-error?
(define-condition glu-error (simple-error)
  ((error-message :initarg :message))
  (:report (lambda (c s)
             (write-string (slot-value c 'error-message) s))))

(defcenum (error-codes gl:enum)
  (:invalid-enum 100900)
  :invalid-value
  :out-of-memory
  :incompatible-gl-version
  :invalid-operation
  ;; plus NURBS, Quadrics and Tesselation errors?
  ;; probably not necessary
  )

(defcfun ("gluErrorString" error-string) :string
  (error-code gl:enum))