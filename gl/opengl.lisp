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

(defun get-error ()
  (%gl:get-error))

(defun check-error ()
  (let ((error-code (get-error)))
    (unless (eql error-code :no-error)
      (error 'opengl-error :error-code error-code))))

;;;
;;; 2.6 Begin/End Paradigm
;;;

;;; 2.6.1 Begin and End

(declaim (inline begin))
(defun begin (mode)
  (%gl:begin mode))

(declaim (inline end))
(defun end ()
  (%gl:end))

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

(declaim (inline edge-flag))
(defun edge-flag (flag)
  (%gl:edge-flag (if flag 1 0)))

;;;
;;; 2.7 Vertex Specification
;;;

(declaim (inline vertex))
(defun vertex (x y &optional (z 0.0) (w 1.0))
  (%gl:vertex-4f (float x) (float y) (float z) (float w)))

(declaim (inline tex-coord))
(defun tex-coord (s &optional (r 0.0) (t* 0.0) (q 1.0))
  (%gl:tex-coord-4f (float s) (float r) (float t*) (float q)))

(declaim (inline multi-tex-coord))
(defun multi-tex-coord (texture s &optional (t* 0.0) (r 0.0) (q 1.0))
  (%gl:multi-tex-coord-4f texture (float s) (float t*) (float r) (float q)))

(declaim (inline normal))
(defun normal (x y z)
  (%gl:normal-3f (float x) (float y) (float z)))

(declaim (inline fog-coord))
(defun fog-coord (coord)
  (%gl:fog-coord-f (float coord)))

(declaim (inline color))
(defun color (r g b &optional (a 1.0))
  (%gl:color-4f (float r) (float g) (float b) (float a)))

(declaim (inline secondary-color))
(defun secondary-color (r g b)
  (%gl:secondary-color-3f (float r) (float g) (float b)))

(declaim (inline index))
(defun index (index)
  (%gl:index-i (truncate index)))

(declaim (inline vertex-attrib))
(defun vertex-attrib (index x &optional (y 0.0) (z 0.0) (w 1.0))
  (%gl:vertex-attrib-4f index (float x) (float y) (float z) (float w)))

;;;
;;; 2.9 Buffer Objects
;;;

(declaim (inline bind-buffer))
(defun bind-buffer (target buffer)
  (%gl:bind-buffer target buffer))

(defun delete-buffers (buffers)
  (with-opengl-sequence (array '%gl:uint buffers)
    (%gl:delete-buffers (length buffers) array)))

(defun gen-buffers (count)
  (with-foreign-object (buffer-array '%gl:uint count)
    (%gl:gen-buffers count buffer-array)
    (loop for i below count
          collecting (mem-aref buffer-array '%gl:uint i))))

(defun buffer-data (target size data usage)
  (%gl:buffer-data target size data usage))

(defun buffer-sub-data (target offset size data)
  (%gl:buffer-sub-data target offset size data))

(defun map-buffer (target access)
  (%gl:map-buffer target access))

(defun unmap-buffer (target)
  (%gl:unmap-buffer target))


;;;
;;; 2.10 Rectangles
;;;

(declaim (inline rect))
(defun rect (x1 y1 x2 y2)
  (%gl:rect-f (float x1) (float y1) (float x2) (float y2)))

;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.1 Controlling the Viewport

(declaim (inline depth-range))
(defun depth-range (near far)
  (%gl:depth-range (float near 1.0d0) (float far 1.0d0)))

(declaim (inline viewport))
(defun viewport (x y width height)
  (%gl:viewport (truncate x) (truncate y) (truncate width) (truncate height)))

;;; 2.11.2 Matrices

(defun matrix-mode (mode)
  (%gl:matrix-mode mode))

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

(declaim (inline rotate))
(defun rotate (theta x y z)
  (%gl:rotate-f (float theta) (float x) (float y) (float z)))

(declaim (inline translate))
(defun translate (x y z)
  (%gl:translate-f (float x) (float y) (float z)))

(declaim (inline scale))
(defun scale (x y z)
  (%gl:scale-f (float x) (float y) (float z)))

(declaim (inline frustum))
(defun frustum (left right bottom top near far)
  (%gl:frustum (float left 1.0d0) (float right 1.0d0)
               (float bottom 1.0d0) (float top 1.0d0)
               (float near 1.0d0) (float far 1.0d0)))

(declaim (inline ortho))
(defun ortho (left right bottom top near far)
  (%gl:ortho (float left 1.0d0) (float right 1.0d0)
             (float bottom 1.0d0) (float top 1.0d0)
             (float near 1.0d0) (float far 1.0d0)))

(declaim (inline active-texture))
(defun active-texture (texture)
  (%gl:active-texture texture))

(declaim (inline load-identity))
(defun load-identity ()
  (%gl:load-identity))

(declaim (inline push-matrix))
(defun push-matrix ()
  (%gl:push-matrix))

(declaim (inline pop-matrix))
(defun pop-matrix ()
  (%gl:pop-matrix))

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

(declaim (inline raster-pos))
(defun raster-pos (x y &optional (z 0.0) (w 1.0))
  (%gl:raster-pos-4f (float x) (float y) (float z) (float w)))

(declaim (inline window-pos))
(defun window-pos (x y &optional (z 0.0))
  (%gl:window-pos-3f (float x) (float y) (float z)))

;;;
;;; 2.14 Colors and Coloring
;;;

;;; 2.14.1 Lighting

(declaim (inline front-face))
(defun front-face (dir)
  (%gl:front-face dir))

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

(declaim (inline color-material))
(defun color-material (face mode)
  (%gl:color-material face mode))

;;; 2.14.7 Flatshading

(declaim (inline shade-model))
(defun shade-model (mode)
  (%gl:shade-model mode))

;;;
;;; 2.15 Vertex Shaders
;;;

;;; 2.15.1 Shader Objects

(declaim (inline create-shader))
(defun create-shader (type)
  (%gl:create-shader type))

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

(declaim (inline compile-shader))
(defun compile-shader (shader)
  (%gl:compile-shader shader))

(declaim (inline delete-shader))
(defun delete-shader (shader)
  (%gl:delete-shader shader))

;;; 2.15.2 Program Objects

(defun create-program ()
  (%gl:create-program))

(defun attach-shader (program shader)
  (%gl:attach-shader program shader))

(defun detach-shader (program shader)
  (%gl:detach-shader program shader))

(defun link-program (program)
  (%gl:link-program program))

(defun use-program (program)
  (%gl:use-program program))

(defun delete-program (program)
  (%gl:delete-program program))

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

(declaim (inline validate-program))
(defun validate-program (program)
  (%gl:validate-program program))
