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
;;; Chapter 5 - Special Functions
;;;

;;;
;;; 5.1 Evaluators
;;;

(defun map1 (target u1 u2 points)
  (let* ((stride (array-dimension points 1))
         (order (array-dimension points 0))
         (count (* stride order)))
    (with-foreign-object (array '%gl:float count)
      (dotimes (i count)
        (setf (mem-aref array '%gl:float i) (float (row-major-aref points i))))
      (%gl:map-1f target (float u1) (float u2) stride order array))))

(defun map2 (target u1 u2 v1 v2 points)
  (let* ((ustride (array-dimension points 2))
         (uorder (array-dimension points 1))
         (vstride (* ustride uorder))
         (vorder (array-dimension points 0))
         (count (* vorder ustride uorder)))
    (with-foreign-object (array '%gl:float count)
      (dotimes (i count)
        (setf (mem-aref array '%gl:float i) (float (row-major-aref points i))))
      (%gl:map-2f target
                (float u1) (float u2) ustride uorder
                (float v1) (float v2) vstride vorder
                array))))

(definline eval-coord-1 (x)
  (%gl:eval-coord-1f x))

(definline eval-coord-2 (x y)
  (%gl:eval-coord-2f x y))

(definline map-grid-1 (n u1 u2)
  (%gl:map-grid-1f n u1 u2))

(definline map-grid-2 (nu u1 u2 nv v1 v2)
  (%gl:map-grid-2f nu u1 u2 nv v1 v2))

(import-export %gl:eval-mesh-1
               %gl:eval-mesh-2
               %gl:eval-point-1
               %gl:eval-point-2)

;;;
;;; 5.2 Selection
;;;

(import-export %gl:init-names
               %gl:pop-name
               %gl:push-name
               %gl:load-name
               %gl:render-mode)

(defun select-buffer (array)
  (declare (ignore array))
  (error "not implemented"))

;;;
;;; 5.3 Feedback
;;;

(defun feedback-buffer (array)
  (declare (ignore array))
  (error "not implemented"))

(import-export %gl:pass-through)

;;;
;;; 5.4 Display Lists
;;;

(import-export %gl:new-list
               %gl:end-list
               %gl:call-list)

;;; Maybe we could optimize some more here if LISTS is vector
;;; with a suitable element-type.
(defun call-lists (lists)
  (with-opengl-sequence (array '%gl:uint lists)
    (%gl:call-lists (length lists)
                  #.(foreign-enum-value '%gl:enum :unsigned-int)
                  array)))

(import-export %gl:list-base
               %gl:gen-lists
               ;; to be consistent we probably should rename this
               ;; LISTP but it'd conflict with CL:LISTP
               %gl:is-list
               %gl:delete-lists)

;;; Maybe UNWIND-PROTECT instead of PROG2?
(defmacro with-new-list ((id mode) &body body)
  `(prog2 (new-list ,id ',mode)
       (progn ,@body)
     (end-list)))

;;;
;;; 5.5 Flush and Finish
;;;

(import-export %gl:flush
               %gl:finish)

;;;
;;; 5.6 Hints
;;;

(import-export %gl:hint)
