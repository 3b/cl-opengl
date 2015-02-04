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

(defcenum (string-name %gl:enum)
  (:version 100800)
  :extensions)

;;; Some GLU functions return an integer error code indicating success
;;; or failure.  When the error code is zero, we can use glGetError to
;;; obtain the actual error that occurred.  This type adds a
;;; translation to signal GLU-ERROR conditions for these errors.
(defctype glu-result %gl:int)

(define-foreign-type glu-result ()
  ()
  (:actual-type %gl:int)
  (:simple-parser glu-result))

;;; Check GLU result codes and signal errors on zero values.
(defmethod translate-from-foreign (value (type glu-result))
  (when (zerop value)
    (gl:check-error))
  value)

;;;; 2. Initialization

(defcfun ("gluGetString" get-string) :string
  (name-keyword string-name))

#-windows
(defcfun ("gluCheckExtension" check-extension) %gl:boolean
  (extension-name :string)
  (extension-string :string))

;;;; 3. Mipmapping

;;; TODO: make this struct or an object

;;;; 3.1 Image Scaling

(defcfun ("gluScaleImage" %gluScaleImage) :int
  (format %gl:enum)
  (width-in %gl:sizei)
  (height-in %gl:sizei)
  (type-in %gl:enum)
  (data-in :pointer)
  (width-out %gl:sizei)
  (height-out %gl:sizei)
  (type-out %gl:enum)
  (data-out :pointer))

;;(defun scale-image (format width-in height-in type-in data-in
                    ;; or just a glu:image object, instead of all these
                    ;; arguments.
;;                    width-out height-out type-out)
  ;; allocate data-out
  ;; call gluScaleImage(), check for errors
;;)

;;;; 3.2 Automatic Mipmapping

;;; TODO: gluBuild{1,3}DMipmaps; gluBuild{1,2,3}DMipmapLevels

(defcfun ("gluBuild2DMipmaps" %GluBuild2DMipmaps) :void
  (target %gl:enum)
  (internalformat %gl:int)
  (width %gl:sizei)
  (height %gl:sizei)
  (format %gl:enum)
  (type %gl:enum)
  (data :pointer))

(defun build-2d-mipmaps (target internal-format width height format type data)
  (let ((internal-size (gl::internal-format->int internal-format)))
    (if (pointerp data)
        (%gluBuild2dMipmaps target internal-size width height format type data)
        (gl::with-pixel-array (array type data)
          (%gluBuild2dMipmaps target internal-size
                              width height format type array)))))

;;;; 4. Matrix Manipulation

;;;; 4.1 Matrix Setup

(defcfun ("gluOrtho2D" ortho-2d) :void
  (left   %gl:double)
  (right  %gl:double)
  (bottom %gl:double)
  (top    %gl:double))

(defcfun ("gluPerspective" perspective) :void
  (fov-y  %gl:double)
  (aspect %gl:double)
  (zNear  %gl:double)
  (zFar   %gl:double))

(defcfun ("gluLookAt" look-at) :void
  (eye-x %gl:double)
  (eye-y %gl:double)
  (eye-z %gl:double)
  (center-x %gl:double)
  (center-y %gl:double)
  (center-z %gl:double)
  (up-x %gl:double)
  (up-y %gl:double)
  (up-z %gl:double))

(defcfun ("gluPickMatrix" %gluPickMatrix) :void
  (x %gl:double)
  (y %gl:double)
  (delta-x %gl:double)
  (delta-y %gl:double)
  (viewport :pointer))

(defun pick-matrix (x y delta-x delta-y viewport)
  (assert (= (length viewport) 4))
  (gl::with-opengl-sequence (array '%gl:int viewport)
    (%gluPickMatrix x y delta-x delta-y array)))

;;;; 4.2 Coordinate Projection

(defcfun ("gluProject" %gluProject) glu-result
  (obj-x %gl:double)
  (obj-y %gl:double)
  (obj-z %gl:double)
  (modelview (:pointer %gl:double))
  (projection (:pointer %gl:double))
  (viewport (:pointer %gl:int))
  (win-x (:pointer %gl:double))
  (win-y (:pointer %gl:double))
  (win-z (:pointer %gl:double)))

(defcfun ("gluUnProject" %gluUnProject) glu-result
  (win-x %gl:double)
  (win-y %gl:double)
  (win-z %gl:double)
  (modelview (:pointer %gl:double))
  (projection (:pointer %gl:double))
  (viewport (:pointer %gl:int))
  (obj-x (:pointer %gl:double))
  (obj-y (:pointer %gl:double))
  (obj-z (:pointer %gl:double)))

#-cffi-features:windows
(defcfun ("gluUnProject4" %gluUnProject4) glu-result
  (win-x %gl:double)
  (win-y %gl:double)
  (win-z %gl:double)
  (clip-w %gl:double)
  (modelview (:pointer %gl:double))
  (projection (:pointer %gl:double))
  (viewport (:pointer %gl:int))
  (near %gl:double)
  (far %gl:double)
  (obj-x (:pointer %gl:double))
  (obj-y (:pointer %gl:double))
  (obj-z (:pointer %gl:double))
  (obj-w (:pointer %gl:double)))

;;; Bind each symbol in NAMES to a foreign double float allocated with
;;; dynamic-extent, returing the final value of each of them as
;;; multiple values.  The return value of BODY is ignored.
(defmacro with-double-floats/values (names &body body)
  `(with-foreign-objects (,@(mapcar (lambda (name)
                                      `(,name '%gl:double)) names))
     ,@body
     (values ,@(mapcar (lambda (name)
                         `(mem-ref ,name '%gl:double)) names))))

;;; Rebind MODEL, PROJ, and VIEWPORT to foreign arrays of the
;;; appropriate type to contain the modelview matrix, projection
;;; matrix, and viewport for calls to GLU projection functions.
(defmacro with-projection-arrays ((model proj viewport) &body body)
  `(progn
     (assert (= (length ,model) 16))
     (assert (= (length ,proj) 16))
     (assert (= (length ,viewport) 4))
     (gl::with-opengl-arrays ((,model '%gl:double ,model)
                              (,proj '%gl:double ,proj)
                              (,viewport '%gl:int ,viewport))
       ,@body)))

;;; Map object coordinates to window coordinates.  The MODELVIEW
;;; matrix, PROJECTION matrix, and VIEWPORT dimensions will be queried
;;; from the OpenGL state if not supplied.  Returns the window X, Y,
;;; and Z as multiple values.
(defun project (obj-x obj-y obj-z &key
                (modelview (gl:get-double :modelview-matrix))
                (projection (gl:get-double :projection-matrix))
                (viewport (gl:get-integer :viewport)))
  (with-projection-arrays (modelview projection viewport)
    (with-double-floats/values (x y z)
      (%gluProject obj-x obj-y obj-z modelview projection viewport x y z))))

;;; Map window coordinates to object coordinates.  The MODELVIEW
;;; matrix, PROJECTION matrix, and VIEWPORT dimensions will be queried
;;; from the OpenGL state if not supplied.  Returns the object X, Y,
;;; and Z as multiple values.
(defun un-project (win-x win-y win-z &key
                   (modelview (gl:get-double :modelview-matrix))
                   (projection (gl:get-double :projection-matrix))
                   (viewport (gl:get-integer :viewport)))
  (with-projection-arrays (modelview projection viewport)
    (with-double-floats/values (x y z)
      (%gluUnProject win-x win-y win-z modelview projection viewport x y z))))

;;; Map window and clip coordinates to object coordinates.  The
;;; MODELVIEW matrix, PROJECTION matrix, and VIEWPORT dimensions will
;;; be queried from the OpenGL state if not supplied.  Returns the
;;; object X, Y, Z, and W as multiple values.
(defun un-project4 (win-x win-y win-z clip-w &key
                    (near 0.0d0)
                    (far 1.0d0)
                    (modelview (gl:get-double :modelview-matrix))
                    (projection (gl:get-double :projection-matrix))
                    (viewport (gl:get-integer :viewport)))
  (with-projection-arrays (modelview projection viewport)
    (with-double-floats/values (x y z w)
      (%gluUnProject4 win-x win-y win-z clip-w modelview projection
                      viewport near far x y z w))))

;;;; 5. Polygon Tessellation

;;;; 5.1 The Tessellation Object
(defctype tess-pointer :pointer)

(defcfun ("gluNewTess" glu-new-tess) tess-pointer)

(defcfun ("gluDeleteTess" glu-delete-tess) :void
  (tess-obj tess-pointer))

;;;; 5.2 Polygon Definition

(defcfun ("gluTessBeginPolygon" glu-tess-begin-polygon) :void
  (tess tess-pointer)
  (polygon-data :pointer))

(defcfun ("gluTessBeginContour" glu-tess-begin-contour) :void
  (tess tess-pointer))

(defcfun ("gluTessVertex" glu-tess-vertex) :void
  (tess tess-pointer)
  (coords :pointer) ; GLdouble coords[3]
  (vertex-data :pointer))
                        
(defcfun ("gluTessEndContour" glu-tess-end-contour) :void
  (tess tess-pointer))

(defcfun ("gluTessEndPolygon" glu-tess-end-polygon) :void
  (tess tess-pointer))

;;;; 5.3 Callbacks

(defcenum (tessellation-type %gl:enum)
  (:begin 100100)
  :vertex
  :end
  :error
  :edge-flag
  :combine
  :begin-data
  :vertex-data
  :end-data
  :error-data
  :edge-flag-data
  :combine-data)

(defcfun ("gluTessCallback" glu-tess-callback) :void
  (tess tess-pointer) (type tessellation-type) (callback :pointer))

;;;; 5.4 Control Over Tessellation
(defcenum (tess-property %gl:enum)
  (:winding-rule 100140)
  :boundary-only
  :tolerance)

(defcenum (tess-winding-rule %gl:double)
  (:odd 100130)
  :nonzero
  :positive
  :negative
  :abs-geq-two)

(defcfun ("gluTessProperty" %glu-tess-property) :void
  (tess tess-pointer)
  (which tess-property)
  (value %gl:double))

(defun glu-tess-property (tess which value)
  (let ((cffi-value
         (ecase which 
           (:winding-rule (cffi:foreign-enum-value 'tess-winding-rule value))
           (:boundary-only (cffi:foreign-enum-value '%gl:boolean value))
           (:tolerance value))))
    (%glu-tess-property tess which cffi-value)))
                           

;;;; 5.7 Backwards Compatibility

;;; We don't bother defining gluBeginPolygon(), gluNextContour() and
;;; gluEndPolygon().

;;;; 6. Quadrics
;;;; 6.1 The Quadrics Object

;;; TODO: make a clos class for these too

(defctype quadric-obj :pointer)

(defcfun ("gluNewQuadric" new-quadric) quadric-obj)

(defcfun ("gluDeleteQuadric" delete-quadric) :void
  (quadric-object quadric-obj))

;;;; 6.2 Callbacks

;;; TODO
;;(defcfun ("gluQuadricCallback" quadric-callback) :void
;;  (quadric-object quadric-obj)
;;  ...)

;;;; 6.3 Rendering Styles

(defcfun ("gluQuadricTexture" quadric-texture) :void
  (quadric-object quadric-obj)
  (texture-coords %gl:boolean))

(defcenum glu-orientation 
  (:outside #x186B4)
  (:inside #x186B5))

(defcfun ("gluQuadricOrientation" quadric-orientation) :void
  (quadric-object quadric-obj)
  (orientation glu-orientation))

(defcenum glu-normals
  (:smooth #x186A0)
  (:flat #x186A1)
  (:none #x186A2))

(defcfun ("gluQuadricNormals" quadric-normals) :void
  (quadric-object quadric-obj)
  (normals glu-normals))

(defcenum draw-styles
  (:point #x186AA)
  :line
  :fill 
  :silhouette)

(defcfun ("gluQuadricDrawStyle" quadric-draw-style) :void
  (quadric-object quadric-obj)
  (draw-style draw-styles))

;;;; 6.4 Quadrics Primitives

(defcfun ("gluSphere" sphere) :void
  (quadric-object quadric-obj)
  (radius %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("gluCylinder" cylinder) :void
  (quadric-object quadric-obj)
  (base-radius %gl:double)
  (top-radius %gl:double)
  (height %gl:double)
  (slices %gl:int)
  (stacks %gl:int))

(defcfun ("gluDisk" disk) :void
  (quadric-object quadric-obj)
  (inner-radius %gl:double)
  (outer-radius %gl:double)
  (slices %gl:int)
  (loops %gl:int))

(defcfun ("gluPartialDisk" partial-disk) :void
  (quadric-object quadric-obj)
  (inner-radius %gl:double)
  (outer-radius %gl:double)
  (slices %gl:int)
  (loops %gl:int)
  (start-angle %gl:double)
  (sweep-angle %gl:double))

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
;;   (n-knots %gl:int)
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

(defcenum (error-codes %gl:enum)
  (:invalid-enum 100900)
  :invalid-value
  :out-of-memory
  :incompatible-gl-version
  :invalid-operation
  ;;Tesselation errors
  (:tess-missing-begin-polygon 100151)
  (:tess-missing-begin-contour 100152)
  (:tess-missing-end-polygon 100153)
  (:tess-missing-end-contour 100154)
  (:tess-coord-too-large 100155)
  (:tess-need-combine-callback 100156)
  ;; plus NURBS, Quadrics
  ;; probably not necessary
  )

(defcfun ("gluErrorString" error-string) :string
  (error-code %gl:enum))
