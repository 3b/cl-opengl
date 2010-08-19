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

#|
Sample output for input:
 (define-tessellation-callback
		    tess-begin (tesselator (type  tessellation-type)))

 (DEFGENERIC TESS-BEGIN
     (TESSELATOR TYPE))
 (DEFCALLBACK %TESS-BEGIN
    :VOID
    ((TYPE TESSELLATION-TYPE))
  (TESS-BEGIN *ACTIVE-TESSELLATOR* TYPE)))
|#

(defmacro define-tessellation-callback (name args &body callback-body)
  (let ((arg-names (mapcar #'car (cdr args)))
	 (tessellation-cb (gl::symbolicate "%" name)))
     `(progn
	(defgeneric ,name (,(car args) ,@arg-names))
        ,(if callback-body
             `(defcallback ,tessellation-cb :void ,(cdr args)
                ,@callback-body)
             `(defcallback ,tessellation-cb :void ,(cdr args)
               (,name *active-tessellator* ,@arg-names))))))

(defmacro define-tessellation-callbacks (&body callback-specs)
  `(progn
     ,(loop for (name args) in callback-specs 
	 do `(define-tessellation-callback ,name ,args))))

(define-tessellation-callbacks
  (tess-begin (tesselator (type  tessellation-type)))
  (tess-edge-flag (tesselator (flag  %gl:boolean)))
  (tess-vertex (tesselator (vertex-data :pointer)))
  (tess-end (tesselator))
  ;;TODO error enum
  (tess-error (tesselator (error-number %gl:enum)))  
  ;:TODO add body to convert to arrays
  (tess-combine (tesselator (coords :pointer) (vertex-data :pointer) (weight :pointer) (out-data :pointer)))
  (tess-begin-data (tesselator (type %gl:enum) (polygon-data :pointer)))
  (tess-edge-flag-data (tesselator (flag %gl:boolean) (polygon-data :pointer)))
  (tess-end-data (tesselator (polygon-data :pointer)))
  (tess-vertex-data (tesselator (vertex-data :pointer) (polygon-data :pointer)))
  ;;TODO error enum
  (tess-error-data (tesselator (error-number %gl:enum) (polygon-data :pointer)))
  (tess-combine-data (tesselator (coords :pointer) (vertex-data :pointer) (weight :pointer) (out-data :pointer) (polygon-data :pointer)))

(defclass tessellator ()
  ((glu-tessellator :reader glu-tessellator)))

(defmethod initialize-instance :after ((obj tessellator) &key)
  ;;TODO signal error if return value is 0
  (setf (slot-value obj 'glu-tessellator) (new-tess)))

(defmethod begin-polygon ((tess tessellator) polygon-data)
  (setf *active-tessellator* tess)
  (tess-begin-polygon tess polygon-data))

(defmethod begin-contour ((tess tessellator))
  ;;todo assert tess is equal *active-tessellator*???
  (tess-begin-contour tess))

(defmethod vertex ((tess tessellator) coords vertex-data)
  (tess-vertex tess coods vertex-data))

(defmethod end-contour ((tess tessellator))
  (tess-end-contour tess))

(defmethod end-polygon ((tess tessellator))
  (setf *active-tessellator nil)
  (tess-end-polygon tess))
