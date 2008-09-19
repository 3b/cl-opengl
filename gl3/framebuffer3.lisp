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
;;; Chapter 4 - Per-fragment Operations and the Framebuffer
;;;

;;;
;;; 4.1 Per-fragment Operations
;;;

;;; 4.1.2 Scissor Test

(import-export %gl3:scissor)

;;; 4.1.3 Multisample Fragment Operations

(import-export %gl3:sample-coverage)

;;; 4.1.5 Stencil Test

(import-export %gl3:stencil-func
               %gl3:stencil-func-separate
               %gl3:stencil-op
               %gl3:stencil-op-separate)

;;; 4.1.6 Depth Buffer Test

(import-export %gl3:depth-func)

;;; 4.1.7 Occlusion Queries

(import-export %gl3:begin-query
               %gl3:end-query)

(defun gen-queries (n)
  "Returns N previously unused query object names in a
list. These names are marked as used, but no object is associated
with them until the first time they are used by BEGIN-QUERY."
  (with-foreign-object (ids '%gl3:uint n)
    (%gl3:gen-queries n ids)
    (loop for i below n
          collecting (mem-aref ids '%gl3:uint i))))

(defun delete-queries (ids)
  "Deletes the names of the query objects contained in the sequence IDS."
  (let ((count (length ids)))
    (with-foreign-object (id-array '%gl3:uint count)
      (loop for id in ids
	    counting id into i
	    do (setf (mem-aref id-array '%gl3:uint (1- i)) id))
      (%gl3:delete-queries count id-array))))


;;; 4.1.8 Blending

(import-export %gl3:blend-equation
               %gl3:blend-equation-separate
               %gl3:blend-func
               %gl3:blend-func-separate
               %gl3:blend-color)

;;; 4.1.10 Logical Operation

(import-export %gl3:logic-op)

;;;
;;; 4.2 Whole Framebuffer Operation
;;;

;;; 4.2.1 Selecting a Buffer for Writing

(import-export %gl3:draw-buffer)

(defun draw-buffers (buffers)
  (with-opengl-sequence (seq '%gl3:enum buffers)
    (%gl3:draw-buffers (length buffers) seq)))


;;; 4.2.2 Fine Control of Buffer Updates

(import-export %gl3:color-mask
               %gl3:depth-mask
               %gl3:stencil-mask
               %gl3:stencil-mask-separate)

;;; 4.2.3 Clearing the Buffers

(definline clear (&rest bufs)
  (%gl3:clear bufs))

(define-compiler-macro clear (&whole form &rest bufs)
  (if (every #'keywordp bufs)
      `(%gl3:clear ,(foreign-bitfield-value '%gl3::clearbuffermask bufs))
      form))

(import-export %gl3:clear-color
               %gl3:clear-depth
               %gl3:clear-stencil)

;;;
;;; 4.3 Drawing, Reading and Copying Pixels
;;;

;;; 4.3.2 Reading Pixels

(defun read-pixels (x y width height format type)
  (let* ((mult (ecase format
                 ((:red :green :blue :alpha :luminance) 1)
                 ;; :color-index not valid for gl3fc
                 ((:depth-component :color-index :stencil-index) 1)
                 (:luminance-alpha 2)
                 ((:rgb :bgr) 3)
                 ((:rgba :bgra) 4)))
         (size (* width height mult))
         (result-data (make-sequence 'vector size))
         (real-type (symbolic-type->real-type type)))
    (with-foreign-object (array real-type size)
      (%gl3:read-pixels x y width height format type array)
      (dotimes (i size result-data)
        (setf (svref result-data i)
              (mem-aref array real-type i))))))

(import-export %gl3:read-buffer)

;;; 4.3.3 Copying Pixels

(import-export %gl3:copy-pixels)
