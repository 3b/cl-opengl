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

(in-package #:cl-opengl)

;;;
;;; Chapter 2 - OpenGL Operation
;;;

;;;
;;; 2.6 Begin/End Paradigm
;;;

;;; 2.6.1 Begin and End

(import-export %gl:begin %gl:end)

(defmacro with-primitives (mode &body body)
  `(prog2
       (begin ,mode)
       (progn ,@body)
     (end)))

;;; synonym for with-primitives.
(defmacro with-primitive (mode &body body)
  `(prog2
       (begin ,mode)
       (progn ,@body)
     (end)))

;;; 2.6.2 Polygon Edges

(import-export %gl:edge-flag)

;;;
;;; 2.7 Vertex Specification
;;;

(definline vertex (x y &optional (z 0.0) (w 1.0))
  (%gl:vertex-4f x y z w))

(definline tex-coord (s &optional (r 0.0) (t* 0.0) (q 1.0))
  (%gl:tex-coord-4f s r t* q))

(definline multi-tex-coord (texture s &optional (t* 0.0) (r 0.0) (q 1.0))
  (%gl:multi-tex-coord-4f texture s t* r q))

(definline normal (x y z)
  (%gl:normal-3f x y z))

(definline fog-coord (coord)
  (%gl:fog-coord-f coord))

(definline color (r g b &optional (a 1.0))
  (%gl:color-4f r g b a))

(definline secondary-color (r g b)
  (%gl:secondary-color-3f r g b))

(definline index (index)
  (%gl:index-i index))

;;;
;;; 2.8 Vertex Arrays
;;;

(import-export %gl:enable-client-state
               %gl:disable-client-state
               %gl:client-active-texture)

;;;
;;; 2.10 Rectangles
;;;

(definline rect (x1 y1 x2 y2)
  (%gl:rect-f x1 y1 x2 y2))

;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.2 Matrices

(import-export %gl:matrix-mode)

(defun load-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%gl:load-matrix-f foreign-matrix)))

(defun mult-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%gl:mult-matrix-f foreign-matrix)))

(defun load-transpose-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%gl:load-transpose-matrix-f foreign-matrix)))

(defun mult-transpose-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%gl:mult-transpose-matrix-f foreign-matrix)))

(definline rotate (theta x y z)
  (%gl:rotate-f theta x y z))

(definline translate (x y z)
  (%gl:translate-f x y z))

(definline scale (x y z)
  (%gl:scale-f x y z))

(import-export %gl:frustum
               %gl:ortho
               %gl:load-identity
               %gl:push-matrix
               %gl:pop-matrix)

(defmacro with-pushed-matrix (&body body)
  `(progn
     (push-matrix)
     (multiple-value-prog1 (progn ,@body)
       (pop-matrix))))

;;;
;;; 2.11.4 Generating Texture Coordinates
;;;

(defun tex-gen (coord pname param)
  (ecase pname
    (:texture-gen-mode
     (%gl:tex-gen-i coord pname (foreign-enum-value '%gl:enum param)))
    ((:object-plane :eye-plane)
     (with-foreign-object (plane '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref plane '%gl:float i) (float (elt param i))))
       (%gl:tex-gen-fv coord pname plane)))))


;;;
;;; 2.13 Current Raster Position
;;;

(definline raster-pos (x y &optional (z 0.0) (w 1.0))
  (%gl:raster-pos-4f x y z w))

(definline window-pos (x y &optional (z 0.0))
  (%gl:window-pos-3f x y z))

;;;
;;; 2.14 Colors and Coloring
;;;

;;; 2.14.2 Lighting Parameter Specification

(defun material (face pname param)
  (ecase pname
    ((:ambient :diffuse :ambient-and-diffuse :specular :emission)
     (with-foreign-object (p '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref p '%gl:float i) (float (elt param i))))
       (%gl:material-fv face pname p)))
    (:shininess
     (%gl:material-f face pname (float param)))
    (:color-indexes
     (with-foreign-object (p '%gl:int 3)
       (dotimes (i 3)
         (setf (mem-aref p '%gl:int i) (elt param i)))
       (%gl:material-iv face pname p)))))

(defun light (light pname value)
  (ecase pname
    ((:ambient :diffuse :specular :position)
     (with-foreign-object (p '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref p '%gl:float i) (float (elt value i))))
       (%gl:light-fv light pname p)))
    (:spot-direction
     (with-foreign-object (p '%gl:float 3)
       (dotimes (i 3)
         (setf (mem-aref p '%gl:float i) (float (elt value i))))
       (%gl:light-fv light pname p)))
    ((:spot-exponent :spot-cutoff :constant-attenuation :linear-attenuation
      :quadratic-attenuation)
     (%gl:light-f light pname (float value)))))

(defun light-model (pname value)
  (ecase pname
    (:light-model-ambient
     (with-foreign-object (p '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref p '%gl:float i) (float (elt value i))))
       (%gl:light-model-fv pname p)))
    (:light-model-color-control
     (%gl:light-model-i pname (foreign-enum-value '%gl:enum value)))
    ((:light-model-local-viewer :light-model-two-side)
     (%gl:light-model-i pname (if value 1 0)))))


;;; 2.14.3 ColorMaterial

(import-export %gl:color-material)

