;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; interface.lisp --- CLOS interface to GLU routines.
;;;
;;; Copyright (c) 2010, Boian Tzonev <boiantz@gmail.com>
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

;;;; Polygon Tessellation
(defparameter *tessellators* (make-hash-table))

(defparameter *tess-callbacks* '())

(defstruct tess-callback name generic-function callback callback-type arg-count)

(defmacro init-tessellation-callback (name callback-type arg-count)
  (let ((tessellation-callback (gl::symbolicate "%" name))
        (tessellation-name (intern (symbol-name name) '#:keyword)))
    `(push (make-tess-callback :name ,tessellation-name :generic-function #',name
                               :callback ',tessellation-callback :callback-type ,callback-type
                               :arg-count ,arg-count)
           *tess-callbacks*)))
  
(defmacro init-tessellation-callbacks (&body callback-specs)
  `(progn
     (setq *tess-callbacks* '())
     ,@(loop for (name callback-type args) in callback-specs
          collect `(init-tessellation-callback ,name ,callback-type ,args))))

(defmacro with-tess-polygon ((tess-obj &optional (polygon-data nil)) &body body)
  `(progn (tess-begin-polygon ,tess-obj ,polygon-data)
          (unwind-protect (progn ,@body)
            (tess-end-polygon ,tess-obj))))

(defmacro with-tess-contour (tess-obj &body body)
  `(progn (tess-begin-contour ,tess-obj)
          (unwind-protect (progn ,@body)
            (tess-end-contour ,tess-obj))))

(defclass tessellator ()
  ((glu-tessellator :reader glu-tessellator)
   (id :reader id)
   (data-to-free :accessor data :initform '())
   (vertex-data :accessor vertex-data :initform (make-hash-table))
   (polygon-data :accessor polygon-data :initform (make-hash-table))))

;;methods 
(defgeneric tess-delete (tessellator))
(defgeneric tess-begin-polygon (tessellator &optional polygon-data))
(defgeneric tess-begin-contour (tessellator))
(defgeneric tess-vertex (tessellator coords &optional vertex-data))
(defgeneric tess-end-contour (tessellator))
(defgeneric tess-end-polygon (tessellator))
(defgeneric tess-property (tessellator which value))

;;callbacks
(defgeneric begin-data-callback (tessellator type polygon-data))
(defgeneric edge-flag-data-callback (tessellator flag polygon-data))
(defgeneric end-data-callback (tessellator polygon-data))
(defgeneric vertex-data-callback (tessellator vertex-data polygon-data))
(defgeneric error-data-callback (tessellator error-number polygon-data))
(defgeneric combine-data-callback (tessellator coords vertex-data weight polygon-data))

(defmethod initialize-instance :after ((obj tessellator) &key)
  (let ((tess (glu-new-tess)))
    (if (null-pointer-p tess)
        (error "Error creating tessellator object")
        (progn
          (let ((tessellator-id (pointer-address tess)))
            (setf (slot-value obj 'glu-tessellator) tess)
            (setf (slot-value obj 'id) tessellator-id)
            ;;put the tessellator object in the table of known tessellators
            ;;key of the tessellator is the pointer address of its corresponding glu-tessellator
            (when (nth-value 1 (gethash tessellator-id *tessellators*))
              (warn "A tessellator with this id is already registred"))
            (setf (gethash tessellator-id *tessellators*) obj))
          (register-callbacks obj)))))

(defmethod tess-delete ((tess tessellator))
  (remhash (id tess) *tessellators*)
  (free-tess-data tess)
  (glu-delete-tess (glu-tessellator tess)))

(defmethod tess-begin-polygon ((tess tessellator) &optional (polygon-data nil))
  (let* ((polygon-data-id 
          (or (loop for value being the hash-values of (polygon-data tess)
                 using (hash-key key)
                 when (eq value polygon-data)
                 return key)
              (hash-table-count (polygon-data tess))))
         (foreign-key (foreign-alloc :uint64 :initial-contents (list (id tess) polygon-data-id))))
    
    (setf (gethash polygon-data-id (polygon-data tess)) polygon-data)

    (save-data-to-free foreign-key tess)
    (glu-tess-begin-polygon (glu-tessellator tess) foreign-key)))

(defmethod tess-begin-contour ((tess tessellator))
  (glu-tess-begin-contour (glu-tessellator tess)))

(defmethod tess-vertex ((tess tessellator) coords &optional vertex-data)
  (let* ((coords-data (coords-to-pointer coords))
         (vertex-data-pointer (vertex-data-to-pointer tess vertex-data)))
    
    (save-data-to-free coords-data tess)
    (glu-tess-vertex (glu-tessellator tess) coords-data vertex-data-pointer)))

(defmethod tess-end-contour ((tess tessellator))
  (glu-tess-end-contour (glu-tessellator tess)))

(defmethod tess-end-polygon ((tess tessellator))
  (glu-tess-end-polygon (glu-tessellator tess))
  (free-tess-data tess))

(defmethod tess-property ((tess tessellator) which value)
  (glu-tess-property (glu-tessellator tess) which value))

;;;; Callbacks
(defmethod begin-data-callback ((tess tessellator) which polygon-data)
  (declare (ignore polygon-data))
  (gl:begin which))

(defmethod error-data-callback ((tess tessellator) error-code polygon-data)
  (declare (ignore polygon-data))
  (free-tess-data tess)
  (error "Tessellation error: ~A~%" (error-string error-code)))

(defmethod end-data-callback ((tess tessellator) polygon-data)
  (declare (ignore polygon-data))
  (gl:end))

(defcallback %begin-data-callback :void ((type :unsigned-int) (polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer)))
    (begin-data-callback tess type polygon-data)))

(defcallback %edge-flag-data-callback :void ((flag %gl:boolean) (polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer)))
    (edge-flag-data-callback tess flag polygon-data)))

(defcallback %end-data-callback :void ((polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer)))
  (end-data-callback tess polygon-data)))

(defcallback %vertex-data-callback :void ((vertex-data-pointer :pointer) (polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer))
         (vertex-data (get-vertex-data tess vertex-data-pointer)))
    (vertex-data-callback tess vertex-data polygon-data)))

(defcallback %error-data-callback :void ((error-number :unsigned-int) (polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer)))
    (error-data-callback tess error-number polygon-data)))

(defcallback %combine-data-callback :void ((coords (:pointer %gl:double)) (vertex-data-pointer :pointer) (weight (:pointer %gl:float)) (out-data :pointer) (polygon-data-pointer :pointer))
  (let* ((tess (get-tessellator polygon-data-pointer))
         (polygon-data (get-polygon-data tess polygon-data-pointer))
         (coords-array (gl::make-gl-array-from-pointer coords '%gl:double 3))
         (vertex-data-array (->combine-vertex-data-array tess vertex-data-pointer))
         (weight-array (gl::make-gl-array-from-pointer weight '%gl:float 4))
         (combined-result (combine-data-callback tess coords-array vertex-data-array weight-array polygon-data))
         (combined-result-pointer (vertex-data-to-pointer tess combined-result)))
    (setf (cffi:mem-ref out-data :pointer) combined-result-pointer)))

;;;; Functions
(defun register-callbacks (tess)
  "When creating an object instance check what methods it specializes and regiser appropriate callbacks for each of them."
  (loop for tess-callback in *tess-callbacks*
     when (compute-applicable-methods
           (tess-callback-generic-function tess-callback)
           (cons tess (loop repeat (tess-callback-arg-count tess-callback) collect t)))
     do (glu-tess-callback (glu-tessellator tess)
                           (tess-callback-callback-type tess-callback)
                           (get-callback (tess-callback-callback tess-callback)))))

(defun save-data-to-free (data-to-free tess)
  (when (and (pointerp data-to-free)
             (not (null-pointer-p data-to-free)))
    (push data-to-free (data tess))))

(defun free-tess-data (tess)
  "Free data allocated with tess-vertex and tess-combine-callback"
  (loop for pointer in (data tess)
     when (and (pointerp pointer)
               (not (null-pointer-p pointer)))
     do (foreign-free pointer))
  (setf (data tess) nil)
  (clrhash (vertex-data tess))
  (clrhash (polygon-data tess)))

(defun vertex-data-to-pointer (tess vertex-data)
  (let* ((vertex-data-id 
          (or (loop for value being the hash-values of (vertex-data tess)
                 using (hash-key key)
                 when (eq value vertex-data)
                 return key)
              (hash-table-count (vertex-data tess))))
         (vertex-data-pointer (foreign-alloc :uint64 :initial-element vertex-data-id)))
    
    (setf (gethash vertex-data-id (vertex-data tess)) vertex-data)
    (save-data-to-free vertex-data-pointer tess)
  vertex-data-pointer))

(defun ->combine-vertex-data-array (tess vertex-data)
  (let ((result (make-array 4)))
    (loop for i from 0 below 4
       do (setf (aref result i)
                (get-vertex-data tess (mem-aref vertex-data ':pointer i))))
    result))

(defun coords-to-pointer (coords)
  (etypecase coords
    (sequence
     (let* ((coords-length (length coords))
            (pointer (foreign-alloc '%gl:double :count coords-length)))
       (etypecase coords
         (list
          (loop for elt in coords
             for i from 0
             do (setf (mem-aref pointer '%gl:double i)
                      (float elt))))
         (vector
          (loop for elt across coords
             for i from 0
             do (setf (mem-aref pointer '%gl:double i)
                      (float elt)))))
      pointer))
    (gl:gl-array
     (if (not (equal (gl::gl-array-type coords) '%gl:double))
         (error "Coordinates must have type gl:double")
         (gl::gl-array-pointer coords)))))

(defun get-tessellator (polygon-data-pointer)
  (unless (null-pointer-p polygon-data-pointer)
    (let ((tessellator-id (mem-aref polygon-data-pointer :uint64 0)))
      (or 
       (gethash tessellator-id *tessellators*)
       (error "Unable to get tessellator with id ~a" tessellator-id)))))

(defun get-polygon-data (tess polygon-data-pointer)
  (unless (null-pointer-p polygon-data-pointer)
    (let ((polygon-data-id (mem-aref polygon-data-pointer :uint64 1)))
      (gethash polygon-data-id (polygon-data tess)))))

(defun get-vertex-data (tess vertex-data-pointer)
  (unless (null-pointer-p vertex-data-pointer)
    (let ((vertex-data-id (mem-ref vertex-data-pointer :uint64)))
      (gethash vertex-data-id (vertex-data tess)))))

;;Initialize information about defined callbacks. The actual definition is handled separately.
(init-tessellation-callbacks 
  (begin-data-callback :begin-data 2)
  (edge-flag-data-callback :edge-flag-data 2)
  (end-data-callback :end-data 1)
  (vertex-data-callback :vertex-data 2)
  (error-data-callback :error-data 2)
  (combine-data-callback :combine-data 4))