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
(defparameter *active-tessellator* nil)

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

(defmacro with-tess-polygon ((tess-obj polygon-data) &body body)
  `(unwind-protect 
       (progn 
         (tess-begin-polygon ,tess-obj ,polygon-data)
         ,@body)
     (tess-end-polygon ,tess-obj)))

(defmacro with-tess-contour (tess-obj &body body)
  `(unwind-protect 
       (progn 
         (tess-begin-contour ,tess-obj)
         ,@body)
     (tess-end-contour ,tess-obj)))

(defclass tessellator ()
  ((glu-tessellator :reader glu-tessellator)
   (data-to-free :accessor data :initform '())
   (vertex-data-length :accessor vertex-data-length :initform 0)
   (polygon-data-length :accessor polygon-data-length :initform 0)))

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
          (setf (slot-value obj 'glu-tessellator) (glu-new-tess))
          (register-callbacks obj)))))

(defmethod tess-delete ((tess tessellator))
  (glu-delete-tess (glu-tessellator tess))
  (free-tess-data tess))

(defmethod tess-begin-polygon ((tess tessellator) &optional (polygon-data nil))
  (setf *active-tessellator* tess)
  (glu-tess-begin-polygon (glu-tessellator tess)
                      (or polygon-data (null-pointer))))

(defmethod tess-begin-contour ((tess tessellator))
  (glu-tess-begin-contour (glu-tessellator tess)))

(defmethod tess-vertex ((tess tessellator) coords &optional (vertex-data nil))
  (let* ((coords-data (list-to-pointer coords))
         (vertex-data-pointer (if vertex-data 
                                  (list-to-pointer vertex-data)
                                  coords-data)))
    (glu-tess-vertex (glu-tessellator tess) coords-data vertex-data-pointer)
    (save-data-to-free coords-data tess)
    (save-data-to-free vertex-data-pointer tess)
    (if (and (< 0 (vertex-data-length tess))
             (not (= (vertex-data-length tess) (length coords))))
        (warn "Vertex coordinates data must have the same length for one polygon.")
        (setf (vertex-data-length tess) (length coords)))))

(defmethod tess-end-contour ((tess tessellator))
  (glu-tess-end-contour (glu-tessellator tess)))

(defmethod tess-end-polygon ((tess tessellator))
  (glu-tess-end-polygon (glu-tessellator tess))
  (free-tess-data tess))

(defmethod tess-property ((tess tessellator) which value)
  (glu-tess-property (glu-tessellator tess) which value))

;;;; Callbacks
(defmethod begin-data-callback ((tess tessellator) which polygon-data)
  (gl:begin which))

(defmethod error-data-callback ((tess tessellator) error-code polygon-data)
  (free-tess-data tess)
  (error "Tessellation error: ~A~%" (error-string error-code)))

(defmethod end-data-callback ((tess tessellator) polygon-data)
  (gl:end))

(defcallback %begin-data-callback :void ((type :unsigned-int) (polygon-data :pointer))
  (begin-data-callback *active-tessellator* type (->polygon-data-array polygon-data *active-tessellator*)))

(defcallback %edge-flag-data-callback :void ((flag %gl:boolean) (polygon-data :pointer))
  (edge-flag-data-callback *active-tessellator* flag (->polygon-data-array polygon-data *active-tessellator*)))

(defcallback %end-data-callback :void ((polygon-data :pointer))
  (end-data-callback *active-tessellator* (->polygon-data-array polygon-data *active-tessellator*)))

(defcallback %vertex-data-callback :void ((vertex-data :pointer) (polygon-data :pointer))
  (let ((vertex-data-array (->vertex-data-array vertex-data *active-tessellator*))
        (polygon-data-array (->polygon-data-array polygon-data *active-tessellator*)))
    (vertex-data-callback *active-tessellator* vertex-data-array polygon-data-array)))

(defcallback %error-data-callback :void ((error-number :unsigned-int) (polygon-data (:pointer :void)))
  (error-data-callback *active-tessellator* error-number (->polygon-data-array polygon-data *active-tessellator*)))

(defcallback %combine-data-callback :void ((coords (:pointer %gl:double)) (vertex-data (:pointer %gl:double)) (weight (:pointer %gl:float)) (out-data :pointer) (polygon-data :pointer))
  (let* ((coords-array (gl::make-gl-array-from-pointer coords '%gl:double 3))
         (vertex-data-array (->combine-vertex-data-array vertex-data *active-tessellator*))
         (weight-array (gl::make-gl-array-from-pointer weight '%gl:float 4))
         (polygon-data-array (->polygon-data-array polygon-data *active-tessellator*))
         (combined-result (list-to-pointer (combine-data-callback *active-tessellator* coords-array vertex-data-array weight-array polygon-data-array))))
    (setf (cffi:mem-ref out-data :pointer) combined-result)
    (save-data-to-free combined-result *active-tessellator*)))

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
    (pushnew data-to-free (data tess) :test 'cffi:pointer-eq)))

(defun free-tess-data (tess)
  "Free data allocated with tess-vertex and tess-combine-callback"
  (loop for pointer in (data tess)
     when (and (pointerp pointer)
               (not (null-pointer-p pointer)))
     do (foreign-free pointer))
  (setf (data tess) nil)
  (setf (vertex-data-length tess) 0)
  (setf (polygon-data-length tess) 0))

(defun ->vertex-data-array (vertex-data tessellator)
  (when (and (pointerp vertex-data)
             (not (null-pointer-p vertex-data))
             (< 0 (vertex-data-length tessellator)))
    (gl::make-gl-array-from-pointer vertex-data '%gl:double (vertex-data-length tessellator))))

(defun ->combine-vertex-data-array (vertex-data tessellator)
  (let ((result (cl:make-array 4)))
    (loop for i from 0 below 4
       do (setf (aref result i) (->vertex-data-array (mem-aref vertex-data ':pointer i) tessellator)))
    result))

(defun ->polygon-data-array (polygon-data tessellator)
  (when (and (pointerp polygon-data)
             (not (null-pointer-p polygon-data))
             (< 0 (polygon-data-length tessellator)))
    (gl::make-gl-array-from-pointer polygon-data '%gl:double (polygon-data-length tessellator))))

(defun list-to-pointer (list)
  (when list
    (let* ((list-length (length list))
           (pointer (foreign-alloc '%gl:double :count list-length)))
      (loop for elt in list
         for i from 0
         do (setf (mem-aref pointer '%gl:double i)
                  (float elt)))
      pointer)))

;;Initialize information about defined callbacks. The actual definition is handled separately."
(init-tessellation-callbacks 
  (begin-data-callback :begin-data 2)
  (edge-flag-data-callback :edge-flag 2)
  (end-data-callback :end-data 1)
  (vertex-data-callback :vertex-data 2)
  (error-data-callback :error-data 2)
  (combine-data-callback :combine-data 4))