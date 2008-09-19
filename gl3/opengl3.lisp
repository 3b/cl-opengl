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

(in-package #:cl-opengl3)

;;;
;;; Chapter 2 - OpenGL Operation
;;;
;;; 2.5 GL Errors
;;;

(import-export %gl3:get-error
               %gl3:opengl-error
               %gl3:check-error)

;;;
;;; 2.7 Vertex Specification
;;;

(definline vertex-attrib (index x &optional (y 0.0) (z 0.0) (w 1.0))
  (%gl3:vertex-attrib-4f index x y z w))

;;;
;;; 2.8 Vertex Arrays
;;;

(import-export %gl3:array-element ;;; might be deprecated?
               %gl3:enable-vertex-attrib-array
               %gl3:disable-vertex-attrib-array
               %gl3:draw-arrays)

(definline draw-elements (mode array &key (count (gl-array-size array))
                               (offset 0))
  ;; fix count to whole array size?
  ;; bounds checking?
  (%gl3:draw-elements mode count
                     (cffi-type-to-gl (gl-array-type array))
                     (gl-array-pointer-offset array offset)))

(import-export %gl3:vertex-attrib-pointer
               %gl3:vertex-attrib-ipointer)

;;;
;;; 2.9 Buffer Objects
;;;

(import-export %gl3:bind-buffer)

(defun delete-buffers (buffers)
  (with-opengl-sequence (array '%gl3:uint buffers)
    (%gl3:delete-buffers (length buffers) array)))

(defun gen-buffers (count)
  (with-foreign-object (buffer-array '%gl3:uint count)
    (%gl3:gen-buffers count buffer-array)
    (loop for i below count
          collecting (mem-aref buffer-array '%gl3:uint i))))

(import-export %gl3:map-buffer
               %gl3:unmap-buffer)

(define-get-function get-buffer-parameter (target pname)
  (%gl3:get-buffer-parameter-iv :int int)
  (%gl3:get-buffer-pointer-v :pointer))


;;; Offset is offset in array, buffer-offset in VBO.
(definline buffer-sub-data (target array &key (offset 0) (buffer-offset 0)
                                   (size (gl-array-byte-size array)))
  (%gl3:buffer-sub-data target buffer-offset size
                       (gl-array-pointer-offset array offset)))

;;; NOTE: arguments are flipped compared to gl function to allow
;;; optional offset.
(definline buffer-data (target usage array &key (offset 0)
                               (size (gl-array-byte-size array)))
  (%gl3:buffer-data target size (gl-array-pointer-offset array offset) usage))

;;; Returns a CFFI:DEFCSTRUCT fragment for CLAUSE.
(defun emit-gl-array-struct-clause (clause)
  (destructuring-bind (array-type &key type components &allow-other-keys)
      clause
    (declare (ignore array-type))
    (loop for c in components
          collect `(,c ,type))))

;;; Returns a binding form for CLAUSE.  This function extracts needed
;;; parameters from CLAUSE and uses OFFSET and STRIDE as memory layout
;;; informations. PSYM is used as symbol for the pointer in the form.
(defun emit-gl-array-bind-clause (clause offset stride psym)
  (destructuring-bind (array-type &rest rest &key type components
                                  &allow-other-keys)
      clause
    (let ((func-name (symbolicate-package "%GL" array-type "-POINTER"))
          (gl-type (cffi-type-to-gl type))
          (address-expr `(inc-pointer ,psym ,offset))
          (size (length components)))
      (ecase array-type
        ((vertex color secondary-color)
         `(,func-name ,size ,gl-type ,stride ,address-expr))
        ((normal index fog-coord)
         `(,func-name ,gl-type ,stride ,address-expr))
        (tex-coord
         (destructuring-bind (&key (stage :texture0) &allow-other-keys)
             rest
           `(progn
              (client-active-texture ,stage)
              (tex-coord-pointer ,size ,gl-type ,stride ,address-expr))))
        (edge-flag                      ; type is fixed
         `(edge-flag-pointer ,stride ,address-expr))
        (vertex-attrib
         (destructuring-bind (&key (index 0) (normalized nil) &allow-other-keys)
             rest
           `(vertex-attrib-pointer ,index ,size ,type ,normalized ,stride
                                   ,address-expr)))))))

(defmacro define-gl-array-format (name &body clauses)
  "Defines a vertex array format spcification. Each clause has
the format (array-type parameter*) where array-type can
currently be one of VERTEX, COLOR, SECONDARY-COLOR, NORMAL,
INDEX, FOG-COORD, TEX-COORD, EDGE-FLAG OR VERTEX-ATTRIB.

Parameters are keyword arguments for the corresponding array
type. The following parameters are supported:

    :TYPE -- array element type (all array types)
    :COMPONENTS -- list of component (slot) names for this array (all types)
    :STAGE -- active texture for the array (TEX-COORD type)
    :INDEX -- vertex attribute index (VERTEX-ATTRIB type)
    :NORMALIZED -- whether values should be normalized (VERTEX-ATTRIB)
"
  `(progn
     (defcstruct ,name
       ,@(mapcan #'emit-gl-array-struct-clause clauses))
     (setf (get ',name 'vertex-array-binder)
           (compile
            nil
            `(lambda (p)
               ,,@(loop with stride = `(foreign-type-size ',name)
                        for c in clauses
                        for offset = `(foreign-slot-offset
                                       ',name ',(caadr (member :components c)))
                        collect `(emit-gl-array-bind-clause
                                  ',c ,offset ,stride 'p)))))
     ',name))

;;; Returns the vertex array binder for SYMBOL-OR-FUNCTION.  This
;;; function is idempotent.
(defun find-vertex-array-binder (symbol-or-function &optional (errorp t))
  (ctypecase symbol-or-function
    (function symbol-or-function)
    (symbol (or (get symbol-or-function 'vertex-array-binder)
                (when errorp
                  (error "Vertex array format ~A not defined."
                         symbol-or-function))))))

;;; Sets the vertex array binder of SYMBOL to VALUE.  VALUE must be a
;;; function of one argument, the array pointer.
(defun (setf find-vertex-array-binder) (value symbol)
  (check-type value function)
  (setf (get symbol 'vertex-array-binder) value))



(defstruct (gl-array (:copier nil))
  "Pointer to C array with size and type information attached."
  (pointer (null-pointer))
  (size 0 :type unsigned-byte)
  (type nil :type symbol))

(defstruct (gl-vertex-array (:copier nil) (:include gl-array))
  "Like GL-ARRAY, but with an aditional vertex array binder."
  (binder #'identity :type function))

(defun alloc-gl-array (type count)
  (if (get type 'vertex-array-binder)
      (make-gl-vertex-array
       :pointer (foreign-alloc type :count count)
       :size count :type type :binder (get type 'vertex-array-binder))
      (make-gl-array :pointer (foreign-alloc type :count count)
                     :size count :type type)))

(declaim (inline make-gl-array-from-pointer))
(defun make-gl-array-from-pointer (ptr type count)
  "Same as ALLOC-GL-ARRAY but uses a supplied pointer instead of
allocating new memory."
  (let ((binder (find-vertex-array-binder type nil)))
    (if binder
        (make-gl-vertex-array :pointer ptr :size count
                              :type type :binder binder)
        (make-gl-array :pointer ptr :size count :type type))))

(defun free-gl-array (array)
  "Frees an array allocated by ALLOC-GL-ARRAY."
  (foreign-free (gl-array-pointer array)))

(defun make-null-gl-array (type)
  "Returns a GL-ARRAY with a size of 0, a null pointer and of type TYPE."
  (make-gl-array-from-pointer (null-pointer) 0 type))


;;; Returns a pointer to the OFFSET-th element in ARRAY.  I think this
;;; is different from mem-aref for simple types.
(declaim (inline gl-array-pointer-offset))
(defun gl-array-pointer-offset (array offset)
  (inc-pointer (gl-array-pointer array)
               (* (foreign-type-size (gl-array-type array)) offset)))

;;; Returns the number of bytes in the array.
(declaim (inline gl-array-byte-size))
(defun gl-array-byte-size (array)
  (* (gl-array-size array) (foreign-type-size (gl-array-type array))))

(defun bind-gl-vertex-array (array &optional (offset 0))
  "Binds ARRAY starting at the OFFSET-th element."
  (funcall (gl-vertex-array-binder array)
           (gl-array-pointer-offset array offset)))

(defmacro with-gl-array ((var type &key count) &body forms)
  "Allocates a fresh GL-ARRAY of type TYPE and COUNT elements.
The array will be bound to VAR and is freed when execution moves
outside WITH-GL-ARRAY."
  (with-unique-names (ptr)
    `(with-foreign-object (,ptr ,type ,count)
       (let ((,var (make-gl-array-from-pointer ,ptr ,type ,count)))
         (declare (dynamic-extent ,var))
         ,@forms))))

;;; TODO: find a better name. I keep reading this as
;;; glare-f. [2007-03-14 LO]
(declaim (inline glaref))
(defun glaref (array index &optional (component nil c-p))
  "Returns the INDEX-th component of ARRAY. If COMPONENT is
supplied and ARRAY is of a compound type the component named
COMPONENT is returned."
  (if c-p
      (foreign-slot-value (mem-aref (gl-array-pointer array)
                                    (gl-array-type array)
                                    index)
                          (gl-array-type array)
                          component)
      (mem-aref (gl-array-pointer array) (gl-array-type array) index)))

(declaim (inline (setf glaref)))
(defun (setf glaref) (value array index &optional (component nil c-p))
  "Sets the place (GLAREF ARRAY INDEX [COMPONENT]) to VALUE."
  (if c-p
      (setf (foreign-slot-value (mem-aref (gl-array-pointer array)
                                          (gl-array-type array)
                                          index)
                                (gl-array-type array)
                                component)
            value)
      (setf (mem-aref (gl-array-pointer array) (gl-array-type array) index)
            value)))

(declaim (inline map-buffer-to-gl-array))
(defun map-buffer-to-gl-array (target access type)
  "This is like MAP-BUFFER but returns a GL-ARRAY instead of a plain pointer.
Note that you must not call FREE-GL-ARRAY but UNMAP-BUFFER on the
return value."
  (make-gl-array-from-pointer
   (map-buffer target access)
   type
   (floor (get-buffer-parameter target :buffer-size :int)
          (foreign-type-size type))))

(defmacro with-mapped-buffer ((p target access) &body body)
  "Maps the buffer currently bound to TARGET with ACCESS storing
the returned pointer in P. The buffer is unmapped when execution
leaves WITH-MAPPED-BUFFER.  Note that this will break when
another buffer is bound within FORMS."
  (once-only (target)
    `(let ((,p (map-buffer ,target ,access)))
       (unwind-protect
            (progn ,@body)
         (unmap-buffer ,target)))))

(defmacro with-gl-mapped-buffer ((a target access type) &body body)
  "This is like WITH-MAPPED-BUFFER, but maps to a GL-ARRAY instead."
  (with-unique-names (p)
    `(with-mapped-buffer (,p ,target ,access)
       (let ((,a (make-gl-array-from-pointer ,p ,type)))
         (declare (dynamic-extent ,a))
         ,@body))))

;;;
;;; 2.10 Vertex Array Objects (3.0/ARB_vertex_array_object)
;;;
(defun delete-vertex-arrays (arrays)
  (with-opengl-sequence (array '%gl3:uint arrays)
    (%gl3:delete-vertex-arrays (length arrays) array)))

(defun gen-vertex-arrays (count)
  (with-foreign-object (array '%gl3:uint count)
    (%gl3:gen-vertex-arrays count array)
    (loop for i below count
       collecting (mem-aref array '%gl3:uint i))))


;; shortcut for the common case where we only want 1
(defun gen-vertex-array ()
  (with-foreign-object (array '%gl3:uint 1)
    (%gl3::gen-vertex-arrays 1 array)
    (mem-aref array '%gl3:uint 0)))

(import-export %gl3:bind-vertex-array)


;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.1 Controlling the Viewport

(import-export %gl3:depth-range
               %gl3:viewport)

;;; 2.11.2 Matrices

(defmacro with-foreign-matrix ((sym matrix) &body body)
  `(with-foreign-object (,sym '%gl3:float 16)
     (dotimes (i 16)
       (setf (mem-aref ,sym '%gl3:float i) (row-major-aref ,matrix i)))
     ,@body))

(import-export %gl3:active-texture)

;;;
;;; 2.12 Clipping
;;;

(defun clip-plane (plane eqn)
  (when (< (length eqn) 4)
    (error "EQN must have 4 coefficents."))
  (with-opengl-sequence (p '%gl3:double eqn)
    (%gl3:clip-plane plane p)))

;;;
;;; 2.14 Colors and Coloring
;;;

;;; 2.14.1 Lighting

(import-export %gl3:front-face)


;;; 2.14.7 Flatshading

(import-export %gl3:shade-model)

;;;
;;; 2.15 Vertex Shaders
;;;

;;; 2.15.1 Shader Objects

(import-export %gl3:create-shader)

(defun shader-source (shader string-list)
  (let ((num-lines (length string-list)))
    (with-foreign-object (string-array :pointer num-lines)
      ;; copy the list of Lisp strings into an array of C strings
      (loop for line in string-list
            count line into i
            do (setf (mem-aref string-array :pointer (1- i))
                     (foreign-string-alloc line)))
        ;; set the source
        (%gl3:shader-source shader num-lines string-array (null-pointer))
        ;; free all allocated strings
        (dotimes (i num-lines)
          (foreign-string-free (mem-aref string-array :pointer i)))))
  string-list)

(import-export %gl3:compile-shader
               %gl3:delete-shader)

;;; 2.15.2 Program Objects

(import-export %gl3:create-program
               %gl3:attach-shader
               %gl3:detach-shader
               %gl3:link-program
               %gl3:use-program
               %gl3:delete-program)

;;; 2.15.3 Shader Variables

(defun get-active-attrib (program index)
  "Returns information about the active attribute variable at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  (let ((attrib-max-length (get-program program :active-attribute-max-length)))
    (with-foreign-objects ((characters-written '%gl3:sizei)
                           (size '%gl3:int)
                           (type :long)
                           (name '%gl3:char attrib-max-length))
      (%gl3:get-active-attrib program index attrib-max-length 
                             characters-written size type name)
      (when (< 0 (mem-ref characters-written '%gl3:sizei))
        (values (mem-ref size '%gl3:int)
                (foreign-enum-keyword '%gl3:enum (mem-ref type :long))
                (foreign-string-to-lisp name))))))

;;; TODO: make these use :STRING
(defun get-attrib-location (program name)
  (with-foreign-string (s name)
    (%gl3:get-attrib-location program s)))

(defun bind-attrib-location (program index name)
  (with-foreign-string (s name)
    (%gl3:bind-attrib-location program index s)))

(defun get-uniform-location (program name)
  (with-foreign-string (s name)
    (%gl3:get-uniform-location program s)))

(defun get-active-uniform (program index)
  "Returns information about the active uniform attribute at index INDEX in
program PROGRAM as multiple values. 1: Size of attribute. 2: Type of attribute.
3: Name of attribute"
  (let ((uniform-max-length (get-program program :active-uniform-max-length)))
    (with-foreign-objects ((characters-written '%gl3:sizei)
                           (size '%gl3:int)
                           (type :long)
                           (name '%gl3:char uniform-max-length))
      (%gl3:get-active-uniform program index uniform-max-length 
                              characters-written size type name)
      (when (< 0 (mem-ref characters-written '%gl3:sizei))
        (values (mem-ref size '%gl3:int)
                (foreign-enum-keyword '%gl3:enum (mem-ref type :long))
                (foreign-string-to-lisp name))))))

(defun uniformi (location x &optional y z w)
  (cond
    (w (%gl3:uniform-4i location x y z w))
    (z (%gl3:uniform-3i location x y z))
    (y (%gl3:uniform-2i location x y))
    (x (%gl3:uniform-1i location x))))

(define-compiler-macro uniformi (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%gl3:uniform-4i ,location ,x ,y ,z ,w))
    (z `(%gl3:uniform-3i ,location ,x ,y ,z))
    (y `(%gl3:uniform-2i ,location ,x ,y))
    (x `(%gl3:uniform-1i ,location ,x))))

(defun uniformf (location x &optional y z w)
  (cond
    (w (%gl3:uniform-4f location (float x) (float y) (float z) (float w)))
    (z (%gl3:uniform-3f location (float x) (float y) (float z)))
    (y (%gl3:uniform-2f location (float x) (float y)))
    (x (%gl3:uniform-1f location (float x)))))

(define-compiler-macro uniformf (&whole form location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%gl3:uniform-4f ,location ,(float x) ,(float y) ,(float z) ,(float w)))
    (z `(%gl3:uniform-3f ,location ,(float x) ,(float y) ,(float z)))
    (y `(%gl3:uniform-2f ,location ,(float x) ,(float y)))
    (x `(%gl3:uniform-1f ,location ,(float x)))))

(defun uniform-matrix (location dim matrices &optional (transpose t))
  (check-type dim (integer 2 4))
  (let ((matrix-count (length matrices))
        (matrix-size (* dim dim)))
    (with-foreign-object (array '%gl3:float (* matrix-count matrix-size))
      (dotimes (i matrix-count)
        (let ((matrix (aref matrices i)))
          (dotimes (j matrix-size)
            (setf (mem-aref array '%gl3:float (* i j))
                  (row-major-aref matrix j)))))
      (case dim
        (2 (%gl3:uniform-matrix-2fv
            location matrix-count (if transpose 1 0) array))
        (3 (%gl3:uniform-matrix-3fv
            location matrix-count (if transpose 1 0) array))
        (4 (%gl3:uniform-matrix-4fv
            location matrix-count (if transpose 1 0) array))))))

;;; 2.15.4 Shader Execution

(import-export %gl3:validate-program)
