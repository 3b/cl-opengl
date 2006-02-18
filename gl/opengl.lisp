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
  (%glGetError))

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
  (%glBegin mode))

(declaim (inline end))
(defun end ()
  (%glEnd))

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
  (%glEdgeFlag (if flag 1 0)))

;;;
;;; 2.7 Vertex Specification
;;;

(declaim (inline vertex))
(defun vertex (x y &optional (z 0.0) (w 1.0))
  (%glVertex4f (float x) (float y) (float z) (float w)))

(declaim (inline tex-coord))
(defun tex-coord (s &optional (r 0.0) (t* 0.0) (q 1.0))
  (%glTexCoord4f (float s) (float r) (float t*) (float q)))

(declaim (inline multi-tex-coord))
(defun multi-tex-coord (texture s &optional (t* 0.0) (r 0.0) (q 1.0))
  (%glMultiTexCoord4f texture (float s) (float t*) (float r) (float q)))

(declaim (inline normal))
(defun normal (x y z)
  (%glNormal3f (float x) (float y) (float z)))

(declaim (inline fog-coord))
(defun fog-coord (coord)
  (%glFogCoordf (float coord)))

(declaim (inline color))
(defun color (r g b &optional (a 1.0))
  (%glColor4f (float r) (float g) (float b) (float a)))

(declaim (inline secondary-color))
(defun secondary-color (r g b)
  (%glSecondaryColor3f (float r) (float g) (float b)))

(declaim (inline index))
(defun index (index)
  (%glIndexi (truncate index)))

(declaim (inline vertex-attrib))
(defun vertex-attrib (index x &optional (y 0.0) (z 0.0) (w 1.0))
  (%glVertexAttrib4f index (float x) (float y) (float z) (float w)))

;;;
;;; 2.10 Rectangles
;;;

(declaim (inline rect))
(defun rect (x1 y1 x2 y2)
  (%glRectf (float x1) (float y1) (float x2) (float y2)))

;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.1 Controlling the Viewport

(declaim (inline depth-range))
(defun depth-range (near far)
  (%glDepthRange (float near 1.0d0) (float far 1.0d0)))

(declaim (inline viewport))
(defun viewport (x y width height)
  (%glViewport (truncate x) (truncate y) (truncate width) (truncate height)))

;;; 2.11.2 Matrices

(defun matrix-mode (mode)
  (%glMatrixMode mode))

(defmacro with-foreign-matrix ((sym matrix) &body body)
  `(with-foreign-object (,sym :float 16)
     (dotimes (i 16)
       (setf (mem-aref ,sym :float i) (row-major-aref ,matrix i)))
     ,@body))

(defun load-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%glLoadMatrixf foreign-matrix)))

(defun mult-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%glMultMatrixf foreign-matrix)))

(defun load-transpose-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%glLoadTransposeMatrixf foreign-matrix)))

(defun mult-transpose-matrix (matrix)
  (with-foreign-matrix (foreign-matrix matrix)
    (%glMultTransposeMatrixf foreign-matrix)))

(declaim (inline rotate))
(defun rotate (theta x y z)
  (%glRotatef (float theta) (float x) (float y) (float z)))

(declaim (inline translate))
(defun translate (x y z)
  (%glTranslatef (float x) (float y) (float z)))

(declaim (inline scale))
(defun scale (x y z)
  (%glScalef (float x) (float y) (float z)))

(declaim (inline frustum))
(defun frustum (left right bottom top near far)
  (%glFrustum (float left 1.0d0) (float right 1.0d0)
              (float bottom 1.0d0) (float top 1.0d0)
              (float near 1.0d0) (float far 1.0d0)))

(declaim (inline ortho))
(defun ortho (left right bottom top near far)
  (%glOrtho (float left 1.0d0) (float right 1.0d0)
            (float bottom 1.0d0) (float top 1.0d0)
            (float near 1.0d0) (float far 1.0d0)))

(declaim (inline active-texture))
(defun active-texture (texture)
  (%glActiveTexture texture))

(declaim (inline load-identity))
(defun load-identity ()
  (%glLoadIdentity))

(declaim (inline push-matrix))
(defun push-matrix ()
  (%glPushMatrix))

(declaim (inline pop-matrix))
(defun pop-matrix ()
  (%glPopMatrix))

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
  (with-opengl-sequence (p 'double eqn)
    (%glClipPlane plane p)))

;;;
;;; 2.13 Current Raster Position
;;;

(declaim (inline raster-pos))
(defun raster-pos (x y &optional (z 0.0) (w 1.0))
  (%glRasterPos4f (float x) (float y) (float z) (float w)))

(declaim (inline window-pos))
(defun window-pos (x y &optional (z 0.0))
  (%glWindowPos3f (float x) (float y) (float z)))

;;;
;;; 2.14 Colors and Coloring
;;;

;;; 2.14.1 Lighting

(declaim (inline front-face))
(defun front-face (dir)
  (%glFrontFace dir))

;;; 2.14.2 Lighting Parameter Specification

(defun material (face pname param)
  (ecase pname
    ((:ambient :diffuse :ambient-and-diffuse :specular :emission)
     (with-foreign-object (p 'float 4)
       (dotimes (i 4)
         (setf (mem-aref p 'float i) (float (elt param i))))
       (%glMaterialfv face pname p)))
    (:shininess
     (%glMaterialf face pname (float param)))
    (:color-indexes
     (with-foreign-object (p 'int 3)
       (dotimes (i 3)
         (setf (mem-aref p 'int i) (elt param i)))
       (%glMaterialiv face pname p)))))

(defun light (light pname value)
  (ecase pname
    ((:ambient :diffuse :specular :position)
     (with-foreign-object (p 'float 4)
       (dotimes (i 4)
         (setf (mem-aref p 'float i) (float (elt value i))))
       (%glLightfv light pname p)))
    (:spot-direction
     (with-foreign-object (p 'float 3)
       (dotimes (i 3)
         (setf (mem-aref p 'float i) (float (elt value i))))
       (%glLightfv light pname p)))
    ((:spot-exponent :spot-cutoff :constant-attenuation :linear-attenuation
      :quadratic-attenuation)
     (%glLightf light pname (float value)))))

(defun light-model (pname value)
  (ecase pname
    (:light-model-ambient
     (with-foreign-object (p 'float 4)
       (dotimes (i 4)
         (setf (mem-aref p 'float i) (float (elt value i))))
       (%glLightModelfv pname p)))
    (:light-model-color-control
     (%glLightmodeli pname
                     (foreign-enum-value 'light-model-color-control value)))
    ((:light-model-local-viewer :light-model-two-side)
     (%glLightModeli pname (if value 1 0)))))


;;; 2.14.3 ColorMaterial

(declaim (inline color-material))
(defun color-material (face mode)
  (%glColorMaterial face mode))

;;; 2.14.7 Flatshading

(declaim (inline shade-model))
(defun shade-model (mode)
  (%glShadeModel mode))

;;;
;;; 2.15 Vertex Shaders
;;;

;;; 2.15.1 Shader Objects

(declaim (inline create-shader))
(defun create-shader (type)
  (%glCreateShader type))

(defun shader-source (shader string-list)
  (let ((num-lines (length string-list)))
    (with-foreign-object (string-array :pointer num-lines)
      ;; copy the list of Lisp strings into an array of C strings
      (loop for line in string-list
            count line into i
            do (setf (mem-aref string-array :pointer (1- i))
                     (foreign-string-alloc line)))
        ;; set the source
        (%glShaderSource shader num-lines string-array (null-pointer))
        ;; free all allocated strings
        (dotimes (i num-lines)
          (foreign-string-free (mem-aref string-array :pointer i)))))
  string-list)

(declaim (inline compile-shader))
(defun compile-shader (shader)
  (%glCompileShader shader))

(declaim (inline delete-shader))
(defun delete-shader (shader)
  (%glDeleteShader shader))

;;; 2.15.2 Program Objects

(defun create-program ()
  (%glCreateProgram))

(defun attach-shader (program shader)
  (%glAttachShader program shader))

(defun detach-shader (program shader)
  (%glDetachShader program shader))

(defun link-program (program)
  (%glLinkProgram program))

(defun use-program (program)
  (%glUseProgram program))

(defun delete-program (program)
  (%glDeleteProgram program))

;;; 2.15.3 Shader Variables

(defun get-active-attrib (program index)
  "Returns information about the active attribute variable at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  ;; FIXME: query size of character buffer
  (with-foreign-objects ((characters-written 'sizei)
                         (size 'int)
                         (type :long)
                         (name 'char 1024))
    (%glGetActiveAttrib program index 1024 characters-written size type name)
    (when (< 0 (mem-ref characters-written 'sizei))
      (values (mem-ref size 'int)
              (foreign-enum-keyword 'program-attribute-type
                                    (mem-ref type :long))
              (foreign-string-to-lisp name)))))

(defun get-attrib-location (program name)
  (with-foreign-string (s name)
    (%glGetAttribLocation program s)))

(defun bind-attrib-location (program index name)
  (with-foreign-string (s name)
    (%glBindAttribLocation program index s)))

(defun get-uniform-location (program name)
  (with-foreign-string (s name)
    (%glGetUniformLocation program s)))

(defun get-active-uniform (program index)
  "Returns information about the active uniform attribute at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  ;; FIXME: query size of character buffer
  (with-foreign-objects ((characters-written 'sizei)
                         (size 'int)
                         (type :long)
                         (name 'char 1024))
    (%glGetActiveUniform program index 1024 characters-written size type name)
    (when (< 0 (mem-ref characters-written 'sizei))
      (values (mem-ref size 'int)
              (foreign-enum-keyword 'program-uniform-type (mem-ref type :long))
              (foreign-string-to-lisp name)))))

(defun uniformi (location x &optional y z w)
  (cond
    (w (%glUniform4i location x y z w))
    (z (%glUniform3i location x y z))
    (y (%glUniform2i location x y))
    (x (%glUniform1i location x))))

(define-compiler-macro uniformi (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%glUniform4i ,location ,x ,y ,z ,w))
    (z `(%glUniform3i ,location ,x ,y ,z))
    (y `(%glUniform2i ,location ,x ,y))
    (x `(%glUniform1i ,location ,x))))

(defun uniformf (location x &optional y z w)
  (cond
    (w (%glUniform4f location (float x) (float y) (float z) (float w)))
    (z (%glUniform3f location (float x) (float y) (float z)))
    (y (%glUniform2f location (float x) (float y)))
    (x (%glUniform1f location (float x)))))

(define-compiler-macro uniformf (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%glUniform4f ,location ,(float x) ,(float y) ,(float z) ,(float w)))
    (z `(%glUniform3f ,location ,(float x) ,(float y) ,(float z)))
    (y `(%glUniform2f ,location ,(float x) ,(float y)))
    (x `(%glUniform1f ,location ,(float x)))))

(defun uniform-matrix (location dim matrices &optional (transpose t))
  (check-type dim (integer 2 4))
  (let ((matrix-count (length matrices))
        (matrix-size (* dim dim)))
    (with-foreign-object (array 'float (* matrix-count matrix-size))
      (dotimes (i matrix-count)
        (let ((matrix (aref matrices i)))
          (dotimes (j matrix-size)
            (setf (mem-aref array 'float (* i j))
                  (row-major-aref matrix j)))))
      (case dim
        (2 (%glUniformMatrix2fv
            location matrix-count (if transpose 1 0) array))
        (3 (%glUniformMatrix3fv
            location matrix-count (if transpose 1 0) array))
        (4 (%glUniformMatrix4fv
            location matrix-count (if transpose 1 0) array))))))

;;; 2.15.4 Shader Execution

(declaim (inline validate-program))
(defun validate-program (program)
  (%glValidateProgram program))
