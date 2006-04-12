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
;;; Chapter 5 - Special Functions
;;;

;;;
;;; 5.1 Evaluators
;;;

(defun map1 (target u1 u2 points)
  (let* ((stride (array-dimension points 1))
         (order (array-dimension points 0))
         (count (* stride order)))
    (with-foreign-object (array 'float count)
      (dotimes (i count)
        (setf (mem-aref array 'float i) (float (row-major-aref points i))))
      (%glMap1f target (float u1) (float u2) stride order array))))

(defun map2 (target u1 u2 v1 v2 points)
  (let* ((ustride (array-dimension points 2))
         (uorder (array-dimension points 1))
         (vstride (* ustride uorder))
         (vorder (array-dimension points 0))
         (count (* vorder ustride uorder)))
    (with-foreign-object (array 'float count)
      (dotimes (i count)
        (setf (mem-aref array 'float i) (float (row-major-aref points i))))
      (%glMap2f target
                (float u1) (float u2) ustride uorder
                (float v1) (float v2) vstride vorder
                array))))

(declaim (inline eval-coord-1))
(defun eval-coord-1 (x)
  (%glEvalCoord1f (float x)))

(declaim (inline eval-coord-2))
(defun eval-coord-2 (x y)
  (%glEvalCoord2f (float x) (float y)))


(declaim (inline map-grid-1))
(defun map-grid-1 (n u1 u2)
  (%glMapGrid1f n (float u1) (float u2)))

(declaim (inline map-grid-2))
(defun map-grid-2 (nu u1 u2 nv v1 v2)
  (%glMapGrid2f nu (float u1) (float u2)
                nv (float v1) (float v2)))


(declaim (inline eval-mesh-1))
(defun eval-mesh-1 (mode p1 p2)
  (%glEvalMesh1 mode p1 p2))

(declaim (inline eval-mesh-2))
(defun eval-mesh-2 (mode p1 p2 q1 q2)
  (%glEvalMesh2 mode p1 p2 q1 q2))


(declaim (inline eval-point-1))
(defun eval-point-1 (p)
  (%glEvalPoint1 p))

(declaim (inline eval-point-2))
(defun eval-point-2 (p q)
  (%glEvalPoint2 p q))


;;;
;;; 5.2 Selection
;;;

(declaim (inline init-names))
(defun init-names ()
  (%glInitNames))

(declaim (inline pop-name))
(defun pop-name ()
  (%glPopName))

(declaim (inline push-name))
(defun push-name (name)
  (%glPushName name))

(declaim (inline load-name))
(defun load-name (name)
  (%glLoadName name))

(declaim (inline render-mode))
(defun render-mode (mode)
  (%glRenderMode mode))

(defun select-buffer (array)
  (declare (ignore array))
  (error "not implemented"))



;;;
;;; 5.3 Feedback
;;;

(defun feedback-buffer (array)
  (declare (ignore array))
  (error "not implemented"))

(declaim (inline pass-through))
(defun pass-through (token)
  (%glPassThrough (float token)))

;;;
;;; 5.4 Display Lists
;;;

(declaim (inline new-list))
(defun new-list (n mode)
  (%glNewList n mode))

(declaim (inline end-list))
(defun end-list ()
  (%glEndList))

(declaim (inline call-list))
(defun call-list (n)
  (%glCallList n))

;;; Maybe we could optimize some more here if LISTS is vector
;;; with a suitable element-type.
(defun call-lists (lists)
  (with-opengl-sequence (array 'uint lists)
    (%glCallLists (length lists)
                  #.(foreign-enum-value 'call-lists-type :unsigned-int)
                  array)))

(declaim (inline list-base))
(defun list-base (base)
  (%glListBase base))

(declaim (inline gen-lists))
(defun gen-lists (range)
  (%glGenLists range))

(declaim (inline is-list))
(defun is-list (list)
  (not (zerop (%glIsList list))))

(declaim (inline delete-lists))
(defun delete-lists (first range)
  (%glDeleteLists first range))

;;; Maybe UNWIND-PROTECT instead of PROG2?
(defmacro with-new-list ((id mode) &body body)
  `(prog2 (new-list ,id ',mode)
       (progn ,@body)
     (end-list)))

;;;
;;; 5.5 Flush and Finish
;;;

(declaim (inline flush))
(defun flush ()
  (%glFlush))

(declaim (inline finish))
(defun finish ()
  (%glFinish))


;;; 
;;; 5.6 Hints
;;;

(declaim (inline hint))
(defun hint (target hint)
  (%glHint target hint))
