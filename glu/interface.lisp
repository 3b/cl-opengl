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

(defstruct tess-callback name gf cb arg-count)

(defmacro define-tessellation-callback (name args &body callback-body)
  (let ((arg-names (mapcar #'car (cdr args)))
        (tessellation-cb (gl::symbolicate "%" name))
        (tessellation-name (intern (symbol-name name) '#:keyword)))
     `(progn
        ;;define generic function
	(defgeneric ,name (,(car args) ,@arg-names))
        ;;define callback
        ,(if callback-body
             `(defcallback ,tessellation-cb :void ,(cdr args)
                ,@callback-body)
             `(defcallback ,tessellation-cb :void ,(cdr args)
                (,name *active-tessellator* ,@arg-names)))
        (push (make-tess-callback :name ,tessellation-name :gf #',name 
                                  :cb ',tessellation-cb :arg-count ,(length arg-names))
              *tess-callbacks*))))

(defmacro define-tessellation-callbacks (&body callback-specs)
  `(progn
     (setq *tess-callbacks* '())
     ,@(loop for (name args) in callback-specs 
          collect `(define-tessellation-callback ,name ,args))))

(define-tessellation-callbacks
  (tess-begin (tessellator (type %gl:enum)))
  (tess-edge-flag (tessellator (flag  %gl:boolean)))
  (tess-vertex (tessellator (vertex-data :pointer)))
  (tess-end (tessellator))
  ;;TODO error enum
  (tess-error (tessellator (error-number %gl:enum)))  
  ;:TODO add body to convert to arrays
  (tess-combine (tessellator (coords :pointer) (vertex-data :pointer) (weight :pointer) (out-data :pointer))
                (let ((coords-array (make-gl-array coords %gl:double 3))
                      (vertex-data-array (make-gl-vertex-array vertex-data gl-vertex 4))
                      (weight-array (make-gl-array weight %gl:float 4))))
                ;;todo handle out data
                )
  ;;TODO consider declaring only one flavor of callbacks
  (tess-begin-data (tessellator (type %gl:enum) (polygon-data :pointer)))
  (tess-edge-flag-data (tessellator (flag %gl:boolean) (polygon-data :pointer)))
  (tess-end-data (tessellator (polygon-data :pointer)))
  (tess-vertex-data (tessellator (vertex-data :pointer) (polygon-data :pointer)))
  ;;TODO error enum
  (tess-error-data (tessellator (error-number %gl:enum) (polygon-data :pointer)))
  (tess-combine-data (tessellator (coords :pointer) 
                                  (vertex-data :pointer) 
                                  (weight :pointer) 
                                  (out-data :pointer) 
                                  (polygon-data :pointer))))

(defclass tessellator ()
  ((glu-tessellator :reader glu-tessellator)))

(defmethod initialize-instance :after ((obj tessellator) &key)
  ;;TODO signal error if return value is 0
  (setf (slot-value obj 'glu-tessellator) (new-tess))
  (register-callbacks obj))

;;TODO make polygon-data optional
(defmethod begin-polygon ((tess tessellator) polygon-data)
  (setf *active-tessellator* tess)
  (tess-begin-polygon (glu-tessellator tess) 
                      (or polygon-data (null-pointer))))

(defmethod begin-contour ((tess tessellator))
  (tess-begin-contour (glu-tessellator tess)))

(defmethod vertex ((tess tessellator) coords vertex-data)
  (tess-vertex (glu-tessellator tess) coords vertex-data))

(defmethod end-contour ((tess tessellator))
  (tess-end-contour (glu-tessellator tess)))

(defmethod end-polygon ((tess tessellator))
  (tess-end-polygon (glu-tessellator tess)))

(defmethod tess-begin :before ((tess tessellator) which)
  (gl:begin which))

(defmethod tess-error ((tess tessellator) error-code)
  ;;TODO handle error
  (break "tess-error"))

(defmethod tess-end :after ((tess tessellator))
  (gl:end)
  (setf *active-tessellator* nil))

(defun register-callbacks (tess)
  (loop for tess-cb in *tess-callbacks*
     when (compute-applicable-methods 
           (tess-callback-gf tess-cb) 
           (cons tess (loop repeat (tess-callback-arg-count tess-cb) collect t)))
     do (tess-callback (glu-tessellator tess) 
                       (tess-callback-name tess-cb)
                       (get-callback (tess-callback-cb tess-cb)))))