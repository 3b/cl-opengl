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

;;;; 5. Polygon Tessellation
(defmacro define-tessellation-callback (name args &body callback-body)
  (let ((arg-names (mapcar #'car (cdr args)))
	 (tessellation-cb (gl::symbolicate "%" name)))
     `(progn
	(defgeneric ,name (,(car args) ,@arg-names))
	(defcallback ,tessellation-cb :void ,(cdr args)
	  ,@callback-body))))

(defmacro define-tessellation-callbacks (&body callback-specs)
  `(progn
     ,(loop for (name args) in callback-specs 
	 do `(define-tessellation-callback ,name ,args))))

(define-tessellation-callbacks
  (begin (tesselator (type  tessellation-type)))
  (edge-flag (tesselator (flag  %gl:boolean)))
  (vertex (tesselator (vertex-data :pointer)))
  (end (tesselator)))
  ;;TODO
  ;;(tess-error (tesselator ( GLenum errno )))
;;   (combine ( GLdouble coords[3], void *vertex data[4],
;; 		      GLfloat weight[4], void **outData );
;; 	   void beginData( GLenum type, void *polygon data );
;; 	   void edgeFlagData( GLboolean ag, void *polygon data );
;; 	   void endData( void *polygon data );
;; 	   void vertexData( void *vertex data, void *polygon data );
;; 	   void errorData( GLenum errno, void *polygon data );
;; 	   void combineData( GLdouble coords[3],
;; 				      void *vertex data[4], GLfloat weight[4], void **outDatab,
;; 				      void *polygon data );

(defclass tesselator ()
  ((glu-tesselator :reader glu-tesselator)))

(defmethod initialize-instance :after ((obj tesselator) &key)
  ;;TODO signal error if return value is 0
  (setf (slot-value obj 'glu-tesselator) (new-tess)))