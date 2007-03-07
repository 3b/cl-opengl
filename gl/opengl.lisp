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
;;; 2.5 GL Errors
;;;

(define-condition opengl-error (simple-error)
  ((error-code :initarg :error-code :reader opengl-error.error-code))
  (:report (lambda (c s)
             (format s "OpenGL signalled ~A."
                     (opengl-error.error-code c)))))

(import-export %gl:get-error)

(defun check-error ()
  (let ((error-code (get-error)))
    (unless (eql error-code :no-error)
      (error 'opengl-error :error-code error-code))))

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

;;; TODO: make gl:int truncate instead.
(definline index (index)
  (%gl:index-i index))

(definline vertex-attrib (index x &optional (y 0.0) (z 0.0) (w 1.0))
  (%gl:vertex-attrib-4f index x y z w))

;;;
;;; 2.9 Buffer Objects
;;;

(import-export %gl:bind-buffer)

(defun delete-buffers (buffers)
  (with-opengl-sequence (array '%gl:uint buffers)
    (%gl:delete-buffers (length buffers) array)))

(defun gen-buffers (count)
  (with-foreign-object (buffer-array '%gl:uint count)
    (%gl:gen-buffers count buffer-array)
    (loop for i below count
          collecting (mem-aref buffer-array '%gl:uint i))))

(import-export %gl:buffer-data
               %gl:buffer-sub-data
               %gl:map-buffer
               %gl:unmap-buffer)

;;;
;;; 2.10 Rectangles
;;;

(definline rect (x1 y1 x2 y2)
  (%gl:rect-f x1 y1 x2 y2))

;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.1 Controlling the Viewport

(import-export %gl:depth-range
               %gl:viewport)

;;; 2.11.2 Matrices

(import-export %gl:matrix-mode)

(defmacro with-foreign-matrix ((sym matrix) &body body)
  `(with-foreign-object (,sym :float 16)
     (dotimes (i 16)
       (setf (mem-aref ,sym :float i) (row-major-aref ,matrix i)))
     ,@body))

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
               %gl:active-texture
               %gl:load-identity
               %gl:push-matrix
               %gl:pop-matrix)

(defmacro with-pushed-matrix (&body body)
  `(prog2 (push-matrix)
       (progn ,@body)
     (pop-matrix)))

;;;
;;; 2.12 Clipping
;;;

(defun clip-plane (plane eqn)
  (when (< (length eqn) 4)
    (error "EQN must have 4 coefficents."))
  (with-opengl-sequence (p '%gl:double eqn)
    (%gl:clip-plane plane p)))

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

;;; 2.14.1 Lighting

(import-export %gl:front-face)

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

;;; 2.14.7 Flatshading

(import-export %gl:shade-model)

;;;
;;; 2.15 Vertex Shaders
;;;

;;; 2.15.1 Shader Objects

(import-export %gl:create-shader)

(defun shader-source (shader string-list)
  (let ((num-lines (length string-list)))
    (with-foreign-object (string-array :pointer num-lines)
      ;; copy the list of Lisp strings into an array of C strings
      (loop for line in string-list
            count line into i
            do (setf (mem-aref string-array :pointer (1- i))
                     (foreign-string-alloc line)))
        ;; set the source
        (%gl:shader-source shader num-lines string-array (null-pointer))
        ;; free all allocated strings
        (dotimes (i num-lines)
          (foreign-string-free (mem-aref string-array :pointer i)))))
  string-list)

(import-export %gl:compile-shader
               %gl:delete-shader)

;;; 2.15.2 Program Objects

(import-export %gl:create-program
               %gl:attach-shader
               %gl:detach-shader
               %gl:link-program
               %gl:use-program
               %gl:delete-program)

;;; 2.15.3 Shader Variables

(defun get-active-attrib (program index)
  "Returns information about the active attribute variable at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  ;; FIXME: query size of character buffer
  (with-foreign-objects ((characters-written '%gl:sizei)
                         (size '%gl:int)
                         (type :long)
                         (name '%gl:char 1024))
    (%gl:get-active-attrib program index 1024 characters-written size type name)
    (when (< 0 (mem-ref characters-written '%gl:sizei))
      (values (mem-ref size '%gl:int)
              (foreign-enum-keyword '%gl:enum (mem-ref type :long))
              (foreign-string-to-lisp name)))))

;;; TODO: make these use :STRING
(defun get-attrib-location (program name)
  (with-foreign-string (s name)
    (%gl:get-attrib-location program s)))

(defun bind-attrib-location (program index name)
  (with-foreign-string (s name)
    (%gl:bind-attrib-location program index s)))

(defun get-uniform-location (program name)
  (with-foreign-string (s name)
    (%gl:get-uniform-location program s)))

(defun get-active-uniform (program index)
  "Returns information about the active uniform attribute at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  ;; FIXME: query size of character buffer
  (with-foreign-objects ((characters-written '%gl:sizei)
                         (size '%gl:int)
                         (type :long)
                         (name '%gl:char 1024))
    (%gl:get-active-uniform program index 1024 characters-written size type name)
    (when (< 0 (mem-ref characters-written '%gl:sizei))
      (values (mem-ref size '%gl:int)
              (foreign-enum-keyword '%gl:enum (mem-ref type :long))
              (foreign-string-to-lisp name)))))

(defun uniformi (location x &optional y z w)
  (cond
    (w (%gl:uniform-4i location x y z w))
    (z (%gl:uniform-3i location x y z))
    (y (%gl:uniform-2i location x y))
    (x (%gl:uniform-1i location x))))

(define-compiler-macro uniformi (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%gl:uniform-4i ,location ,x ,y ,z ,w))
    (z `(%gl:uniform-3i ,location ,x ,y ,z))
    (y `(%gl:uniform-2i ,location ,x ,y))
    (x `(%gl:uniform-1i ,location ,x))))

(defun uniformf (location x &optional y z w)
  (cond
    (w (%gl:uniform-4f location (float x) (float y) (float z) (float w)))
    (z (%gl:uniform-3f location (float x) (float y) (float z)))
    (y (%gl:uniform-2f location (float x) (float y)))
    (x (%gl:uniform-1f location (float x)))))

(define-compiler-macro uniformf (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%gl:uniform-4f ,location ,(float x) ,(float y) ,(float z) ,(float w)))
    (z `(%gl:uniform-3f ,location ,(float x) ,(float y) ,(float z)))
    (y `(%gl:uniform-2f ,location ,(float x) ,(float y)))
    (x `(%gl:uniform-1f ,location ,(float x)))))

(defun uniform-matrix (location dim matrices &optional (transpose t))
  (check-type dim (integer 2 4))
  (let ((matrix-count (length matrices))
        (matrix-size (* dim dim)))
    (with-foreign-object (array '%gl:float (* matrix-count matrix-size))
      (dotimes (i matrix-count)
        (let ((matrix (aref matrices i)))
          (dotimes (j matrix-size)
            (setf (mem-aref array '%gl:float (* i j))
                  (row-major-aref matrix j)))))
      (case dim
        (2 (%gl:uniform-matrix-2fv
            location matrix-count (if transpose 1 0) array))
        (3 (%gl:uniform-matrix-3fv
            location matrix-count (if transpose 1 0) array))
        (4 (%gl:uniform-matrix-4fv
            location matrix-count (if transpose 1 0) array))))))

;;; 2.15.4 Shader Execution

(import-export %gl:validate-program)
