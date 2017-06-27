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

(import-export %gl:get-error
               %gl:opengl-error
               %gl:check-error)

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

(definline vertex-attrib (index x &optional (y 0.0) (z 0.0) (w 1.0))
  (%gl:vertex-attrib-4f index x y z w))

;;;
;;; 2.8 Vertex Arrays
;;;

(import-export %gl:array-element
               %gl:enable-client-state
               %gl:disable-client-state
               %gl:client-active-texture
               %gl:enable-vertex-attrib-array
               %gl:disable-vertex-attrib-array
               %gl:draw-arrays
               %gl:draw-arrays-instanced)

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
  (make-gl-array-from-pointer (null-pointer) type 0))

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

(definline draw-elements (mode array &key (count (gl-array-size array))
                               (offset 0))
  ;; fix count to whole array size?
  ;; bounds checking?
  (%gl:draw-elements mode count
                     (cffi-type-to-gl (gl-array-type array))
                     (gl-array-pointer-offset array offset)))

(definline draw-elements-instanced (mode array primcount &key
                                         (count (gl-array-size array))
                                         (offset 0))
  "When drawing using a bound IBO, the keyword argument COUNT must be
specified to denote the number of vertices that must be processed."
  (%gl:draw-elements-instanced mode count
                     (cffi-type-to-gl (gl-array-type array))
                     (gl-array-pointer-offset array offset)
                     primcount))

(import-export %gl:vertex-attrib-pointer
               %gl:vertex-attrib-ipointer)

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

(defun gen-buffer ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl:gen-buffers 1 array)
    (mem-aref array '%gl:uint 0)))

(import-export %gl:map-buffer
               %gl:unmap-buffer)

(define-get-function get-buffer-parameter (target pname)
  (%gl:get-buffer-parameter-iv :int int)
  (%gl:get-buffer-pointer-v :pointer))

;;; Offset is offset in array, buffer-offset in VBO.
(definline buffer-sub-data (target array &key (offset 0) (buffer-offset 0)
                                   (size (gl-array-byte-size array)))
  (%gl:buffer-sub-data target buffer-offset size
                       (gl-array-pointer-offset array offset)))

;;; NOTE: arguments are flipped compared to gl function to allow
;;; optional offset.
(definline buffer-data (target usage array &key (offset 0)
                               (size (gl-array-byte-size array)))
  (%gl:buffer-data target size (gl-array-pointer-offset array offset) usage))

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
    (let ((func-name (symbolicate-package '#:%gl array-type '#:-pointer))
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
              (,func-name ,size ,gl-type ,stride ,address-expr))))
        (edge-flag                      ; type is fixed
         `(,func-name ,stride ,address-expr))
        (vertex-attrib
         (destructuring-bind (&key (index 0) (normalized nil) &allow-other-keys)
             rest
           `(,func-name ,index ,size ,type ,normalized ,stride
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
  `(let ((,a (map-buffer-to-gl-array ,target ,access ,type)))
     (declare (dynamic-extent ,a))
     (unwind-protect
          (progn ,@body)
       (unmap-buffer ,target))))

;;;
;;; 2.10 Rectangles
;;;

(definline rect (x1 y1 x2 y2)
  (%gl:rect-f x1 y1 x2 y2))

;;;
;;; 2.10 Vertex Array Objects (3.0/ARB_vertex_array_object)
;;;
(defun delete-vertex-arrays (arrays)
  (with-opengl-sequence (array '%gl:uint arrays)
    (%gl:delete-vertex-arrays (length arrays) array)))

(defun gen-vertex-arrays (count)
  (with-foreign-object (array '%gl:uint count)
    (%gl:gen-vertex-arrays count array)
    (loop for i below count
       collecting (mem-aref array '%gl:uint i))))

;; shortcut for the common case where we only want 1
(defun gen-vertex-array ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl::gen-vertex-arrays 1 array)
    (mem-aref array '%gl:uint 0)))

(import-export %gl:bind-vertex-array)


;;;
;;; 2.11 Coordinate Transformations
;;;

;;; 2.11.1 Controlling the Viewport

(import-export %gl:depth-range
               %gl:viewport)

;;; 2.11.2 Matrices

(import-export %gl:matrix-mode)

(defmacro with-foreign-matrix ((sym matrix) &body body)
  `(with-foreign-object (,sym '%gl:float 16)
     (dotimes (i 16)
       (setf (mem-aref ,sym '%gl:float i) (row-major-aref ,matrix i)))
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
               %gl:load-identity
               %gl:push-matrix
               %gl:pop-matrix)

(defmacro with-pushed-matrix (&body body)
  `(progn
     (push-matrix)
     (multiple-value-prog1 (progn ,@body)
       (pop-matrix))))

(defmacro with-pushed-matrix* ((matrix) &body body)
  ;; fixme: should once-only matrix, but only if it isn't a keyword
  `(progn
     (matrix-mode ,matrix)
     (push-matrix)
     (unwind-protect
          (progn ,@body)
       (matrix-mode ,matrix)
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
  (when (stringp string-list) (setf string-list (list string-list)))
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
  (let ((attrib-max-length (get-program program :active-attribute-max-length)))
    (with-foreign-objects ((characters-written '%gl:sizei)
                           (size '%gl:int)
                           (type '%gl:uint)
                           (name '%gl:char attrib-max-length))
      (%gl:get-active-attrib program index attrib-max-length
                             characters-written size type name)
      (when (< 0 (mem-ref characters-written '%gl:sizei))
        (values (mem-ref size '%gl:int)
                (or (foreign-enum-keyword '%gl:enum (mem-ref type '%gl:uint)
                                          :errorp nil)
                    (mem-ref type '%gl:int))
                (foreign-string-to-lisp name))))))

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
  (let ((uniform-max-length (get-program program :active-uniform-max-length)))
    (with-foreign-objects ((characters-written '%gl:sizei)
                           (size '%gl:int)
                           (type '%gl:uint)
                           (name '%gl:char uniform-max-length))
      (%gl:get-active-uniform program index uniform-max-length
                              characters-written size type name)
      (when (< 0 (mem-ref characters-written '%gl:sizei))
        (values (mem-ref size '%gl:int)
                (foreign-enum-keyword '%gl:enum (mem-ref type '%gl:uint))
                (foreign-string-to-lisp name))))))

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

(defun program-uniformf (program location x &optional y z w)
  (cond
    (w (%gl:program-uniform-4f program location (float x) (float y) (float z) (float w)))
    (z (%gl:program-uniform-3f program location (float x) (float y) (float z)))
    (y (%gl:program-uniform-2f program location (float x) (float y)))
    (x (%gl:program-uniform-1f program location (float x)))))

(flet ((float* (x)
         (if (numberp x)
             (float x 1f0)
             `(float ,x 1f0))))
  (define-compiler-macro uniformf (&whole form location x &optional y z w)
    (declare (ignore form))
    (cond
      (w `(%gl:uniform-4f ,location ,(float* x) ,(float* y) ,(float* z) ,(float* w)))
      (z `(%gl:uniform-3f ,location ,(float* x) ,(float* y) ,(float* z)))
      (y `(%gl:uniform-2f ,location ,(float* x) ,(float* y)))
      (x `(%gl:uniform-1f ,location ,(float* x)))))

  (define-compiler-macro program-uniformf (&whole form program location x &optional y z w)
    (declare (ignore form))
    (cond
      (w `(%gl:program-uniform-4f ,program ,location ,(float* x) ,(float* y)
                                  ,(float* z) ,(float* w)))
      (z `(%gl:program-uniform-3f ,program ,location ,(float* x) ,(float* y) ,(float* z)))
      (y `(%gl:program-uniform-2f ,program ,location ,(float* x) ,(float* y)))
      (x `(%gl:program-uniform-1f ,program ,location ,(float* x))))))

(definline uniformfv (location a)
  (case (length a)
    (4 (%gl:uniform-4f location (aref a 0) (aref a 1) (aref a 2) (aref a 3)))
    (3 (%gl:uniform-3f location (aref a 0) (aref a 1) (aref a 2)))
    (2 (%gl:uniform-2f location (aref a 0) (aref a 1)))
    (1 (%gl:uniform-1f location (aref a 0)))))

(definline uniformiv (location a)
  (case (length a)
    (4 (%gl:uniform-4i location (aref a 0) (aref a 1) (aref a 2) (aref a 3)))
    (3 (%gl:uniform-3i location (aref a 0) (aref a 1) (aref a 2)))
    (2 (%gl:uniform-2i location (aref a 0) (aref a 1)))
    (1 (%gl:uniform-1i location (aref a 0)))))

(defun program-uniformi (program location x &optional y z w)
  (cond
    (w (%gl:program-uniform-4i program location x y z w))
    (z (%gl:program-uniform-3i program location x y z))
    (y (%gl:program-uniform-2i program location x y))
    (x (%gl:program-uniform-1i program location x))))

(define-compiler-macro program-uniformi (&whole form program location x &optional y z w)
  (declare (ignore form))
  (cond
    (w `(%gl:program-uniform-4i ,program ,location ,x ,y ,z ,w))
    (z `(%gl:program-uniform-3i ,program ,location ,x ,y ,z))
    (y `(%gl:program-uniform-2i ,program ,location ,x ,y))
    (x `(%gl:program-uniform-1i ,program ,location ,x))))

(definline program-uniformfv (program location a)
  (case (length a)
    (4 (%gl:program-uniform-4f program location (aref a 0) (aref a 1) (aref a 2) (aref a 3)))
    (3 (%gl:program-uniform-3f program location (aref a 0) (aref a 1) (aref a 2)))
    (2 (%gl:program-uniform-2f program location (aref a 0) (aref a 1)))
    (1 (%gl:program-uniform-1f program location (aref a 0)))))

(definline program-uniformiv (program location a)
  (case (length a)
    (4 (%gl:program-uniform-4i program location (aref a 0) (aref a 1) (aref a 2) (aref a 3)))
    (3 (%gl:program-uniform-3i program location (aref a 0) (aref a 1) (aref a 2)))
    (2 (%gl:program-uniform-2i program location (aref a 0) (aref a 1)))
    (1 (%gl:program-uniform-1i program location (aref a 0)))))

(defmacro with-foreign-matrices ((var lisp-matrices dim) &body body)
  (once-only ((matrices lisp-matrices) dim)
    (with-unique-names (matrix-count matrix-size)
      `(progn
         (check-type ,dim (integer 2 4))
         (let ((,matrix-count (length ,matrices))
               (,matrix-size (* ,dim ,dim)))
           (with-foreign-object (,var '%gl:float (* ,matrix-count ,matrix-size))
             (dotimes (i ,matrix-count)
               (let ((matrix (aref ,matrices i)))
                 (dotimes (j ,matrix-size)
                   (setf (mem-aref ,var '%gl:float (+ j (* i ,matrix-size)))
                         (row-major-aref matrix j)))))
             ,@body))))))

(defun uniform-matrix (location dim matrices &optional (transpose t))
  (with-foreign-matrices (array matrices dim)
    (let ((matrix-count (length matrices)))
      (case dim
        (2 (%gl:uniform-matrix-2fv
            location matrix-count transpose array))
        (3 (%gl:uniform-matrix-3fv
            location matrix-count transpose array))
        (4 (%gl:uniform-matrix-4fv
            location matrix-count transpose array))))))

(defun program-uniform-matrix (program location dim matrices &optional (transpose t))
  (with-foreign-matrices (array matrices dim)
    (let ((matrix-count (length matrices)))
      (case dim
        (2 (%gl:program-uniform-matrix-2fv program
            location matrix-count transpose array))
        (3 (%gl:program-uniform-matrix-3fv program
            location matrix-count transpose array))
        (4 (%gl:program-uniform-matrix-4fv program
            location matrix-count transpose array))))))

(macrolet ((def (n % comp &optional (direct-p nil))
             (flet ((args (rest) (append (when direct-p '(program)) rest)))
               `(defun ,n ,(args '(location matrices &optional (transpose t)))
                  ,(format nil
                           "Upload a matrix or matrices to uniform LOCATION. MATRICES is a single
matrix in a vector or array, or a vector of matrices in same formats.
Tries to optimize case where matrices are (SIMPLE-ARRAY SINGLE-FLOAT (~s))."
                           comp)
                  (assert (or (typep (aref matrices 0) 'number)
                              (typep (aref matrices 0) 'array)))
                  #+sbcl
                  (when (typep matrices '(simple-array single-float (,comp)))
                    (sb-sys:with-pinned-objects (matrices)
                      (return-from ,n
                        (,% ,@(args '(location 1 transpose
                                               (sb-sys:vector-sap matrices)))))))
                  #+ccl
                  (when (typep matrices '(simple-array single-float (,comp)))
                    ;; we need to be a bit more careful with CCL, since
                    ;; CCL:WITH-POINTER-TO-IVECTOR inhibits GC,  so we
                    ;; try to avoid signalling an error inside it
                    (handler-case
                        (ccl:with-pointer-to-ivector (p matrices)
                          (return-from ,n
                            (,% ,@(args '(location 1 transpose p)))))
                      ;; resignal any errors outside the 'no GC' scope
                      (error (e) (error e))))
                  (let* ((matrices (if (typep (aref matrices 0) 'vector)
                                       matrices
                                       (vector matrices)))
                         (matrix-count (length matrices)))
                    (with-foreign-object (array '%gl:float (* matrix-count ,comp))
                      (loop for matrix across matrices
                         for i from 0
                         do (if (typep matrix '(simple-array single-float
                                                (,comp)))
                                (loop for j below ,comp
                                   do (setf (mem-aref array '%gl:float
                                                      (+ j (* i ,comp)))
                                            (row-major-aref matrix j)))
                                (loop for j below ,comp
                                   do (setf (mem-aref array '%gl:float
                                                      (+ j (* i ,comp)))
                                            (float (row-major-aref matrix j)
                                                   1.0)))))
                      (,% ,@(args '(location matrix-count transpose array))))))))
             (d (&rest defs)
                `(progn
                   ,@(loop for def in defs collect `(def ,@def)))))
           (d (uniform-matrix-2fv %gl:uniform-matrix-2fv 4)
             (uniform-matrix-2x3-fv %gl:uniform-matrix-2x3-fv 6)
             (uniform-matrix-2x4-fv %gl:uniform-matrix-2x4-fv 8)

             (uniform-matrix-3x2-fv %gl:uniform-matrix-3x2-fv 6)
             (uniform-matrix-3fv %gl:uniform-matrix-3fv 9)
             (uniform-matrix-3x4-fv %gl:uniform-matrix-3x4-fv 12)

             (uniform-matrix-4x2-fv %gl:uniform-matrix-4x2-fv 8)
             (uniform-matrix-4x3-fv %gl:uniform-matrix-4x3-fv 12)
             (uniform-matrix-4fv %gl:uniform-matrix-4fv 16)

             (program-uniform-matrix-2fv %gl:program-uniform-matrix-2fv 4 t)
             (program-uniform-matrix-2x3-fv %gl:program-uniform-matrix-2x3-fv 6 t)
             (program-uniform-matrix-2x4-fv %gl:program-uniform-matrix-2x4-fv 8 t)

             (program-uniform-matrix-3x2-fv %gl:program-uniform-matrix-3x2-fv 6 t)
             (program-uniform-matrix-3fv %gl:program-uniform-matrix-3fv 9 t)
             (program-uniform-matrix-3x4-fv %gl:program-uniform-matrix-3x4-fv 12 t)

             (program-uniform-matrix-4x2-fv %gl:program-uniform-matrix-4x2-fv 8 t)
             (program-uniform-matrix-4x3-fv %gl:program-uniform-matrix-4x3-fv 12 t)
             (program-uniform-matrix-4fv %gl:program-uniform-matrix-4fv 16 t)))


;;; 2.15.4 Shader Execution

(import-export %gl:validate-program)

;;;
;;; 4.1.2.11.4 Program Pipeline Objects
;;;

(defun gen-program-pipelines (count)
  (with-foreign-object (pipeline-array '%gl:uint count)
    (%gl:gen-program-pipelines count pipeline-array)
    (loop for i below count
       collecting (mem-aref pipeline-array '%gl:uint i))))

(defun delete-program-pipelines (pipelines)
  (with-opengl-sequence (array '%gl:uint pipelines)
    (%gl:delete-program-pipelines (length pipelines) array)))

(defun gen-program-pipeline ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl:gen-program-pipelines 1 array)
    (mem-aref array '%gl:uint 0)))

(import-export %gl:bind-program-pipeline
               %gl:active-shader-program)

(defun use-program-stages (pipeline program &rest stages)
  (%gl:use-program-stages pipeline
                          (foreign-bitfield-value '%gl::UseProgramStageMask stages)
                          program))

(defun program-parameteri (program pname value)
  (let ((parsed-value (ecase pname
                 ((:program-separable :program-binary-retrievable-hint)
                  (foreign-enum-value '%gl:enum (if value :true :false))))))
    (%gl:program-parameter-i program pname parsed-value)))

;;;
;;; 4.0.2.6  Primitives and vertices
;;; 4.0.2.12 Tessellation
;;;

(defun patch-parameter (pname value)
  (etypecase value
    (sequence
     (let ((len (length value)))
       (with-foreign-object (a '%gl:float len)
         (dotimes (i len)
           (setf (mem-aref a '%gl:float i) (float (elt value i))))
       (%gl:patch-parameter-fv pname a))))
    (integer (%gl:patch-parameter-i pname value))))
