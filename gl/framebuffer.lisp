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
;;; Chapter 4 - Per-fragment Operations and the Framebuffer
;;;

;;;
;;; 4.1 Per-fragment Operations
;;;

;;; 4.1.2 Scissor Test

(import-export %gl:scissor)

;;; 4.1.3 Multisample Fragment Operations

(import-export %gl:sample-coverage)

;;; 4.1.4 Alpha Test

(import-export %gl:alpha-func)

;;; 4.1.5 Stencil Test

(import-export %gl:stencil-func
               %gl:stencil-func-separate
               %gl:stencil-op
               %gl:stencil-op-separate)

;;; 4.1.6 Depth Buffer Test

(import-export %gl:depth-func)

;;; 4.1.7 Occlusion Queries

(import-export %gl:begin-query
               %gl:end-query)

(defun gen-queries (n)
  "Returns N previously unused query object names in a
list. These names are marked as used, but no object is associated
with them until the first time they are used by BEGIN-QUERY."
  (with-foreign-object (ids '%gl:uint n)
    (%gl:gen-queries n ids)
    (loop for i below n
          collecting (mem-aref ids '%gl:uint i))))

(defun delete-queries (ids)
  "Deletes the names of the query objects contained in the sequence IDS."
  (let ((count (length ids)))
    (with-foreign-object (id-array '%gl:uint count)
      (loop for id in ids
	    counting id into i
	    do (setf (mem-aref id-array '%gl:uint (1- i)) id))
      (%gl:delete-queries count id-array))))

(defmacro with-query ((target id) &body body)
  (if (keywordp target)
      #1=`(progn
            (gl:begin-query ,target ,id)
            (unwind-protect
                 (progn
                   ,@body)
              (gl:end-query ,target)))
      (alexandria:once-only (target)
        #1#)))

(defun get-query-object (id pname &optional buffer-offset)
  (if buffer-offset ;; user must bind buffer to :QUERY-RESULT-BUFFER
      (%gl:get-query-object-iv id pname (cffi:make-pointer buffer-offset))
      ;; user should ensure no buffer is bound to :QUERY-RESULT-BUFFER
      (ecase pname
        (:query-result-available
         (cffi:with-foreign-object (done '%gl:int)
           (%gl:get-query-object-iv id :query-result-available done)
           (not (zerop (cffi:mem-ref done '%gl:int)))))
        ((:query-result :query-result-no-wait)
         ;; -ui64v needs gl 3.3, possibly should add some option for
         ;;  supporting older versions too?
         (cffi:with-foreign-object (result '%gl:uint64)
           ;; avoid returning garbage for -no-wait
           (setf (cffi:mem-ref result '%gl:uint64) 0)
           (%gl:get-query-object-ui64v id pname result)
           (cffi:mem-ref result '%gl:uint64))))))

;;; 4.1.8 Blending

(import-export %gl:blend-equation
               %gl:blend-equation-separate
               %gl:blend-func
               %gl:blend-func-separate
               %gl:blend-color)

;;; 4.1.10 Logical Operation

(import-export %gl:logic-op)

;;;
;;; 4.2 Whole Framebuffer Operation
;;;

;;; 4.2.1 Selecting a Buffer for Writing

(import-export %gl:draw-buffer)

(defun draw-buffers (buffers)
  (with-opengl-sequence (seq '%gl:enum buffers)
    (%gl:draw-buffers (length buffers) seq)))


;;; 4.2.2 Fine Control of Buffer Updates

(import-export %gl:index-mask
               %gl:color-mask
               %gl:depth-mask
               %gl:stencil-mask
               %gl:stencil-mask-separate)

;;; 4.2.3 Clearing the Buffers

(definline clear (&rest bufs)
  (%gl:clear bufs))

(define-compiler-macro clear (&whole form &rest bufs)
  (if (every #'keywordp bufs)
      `(%gl:clear ,(foreign-bitfield-value '%gl::ClearBufferMask bufs))
      form))

(import-export %gl:clear-color
               %gl:clear-index
               %gl:clear-depth
               %gl:clear-stencil
               %gl:clear-accum)

;;; 4.2.4 The Accumulation Buffer

(import-export %gl:accum)

;;;
;;; 4.3 Drawing, Reading and Copying Pixels
;;;

;;; 4.3.2 Reading Pixels

(defun read-pixels (x y width height format type)
  (let* ((mult (ecase format
                 ((:red :green :blue :alpha :luminance) 1)
                 ((:depth-component :color-index :stencil-index) 1)
                 (:luminance-alpha 2)
                 ((:rgb :bgr) 3)
                 ((:rgba :bgra) 4)))
         (size (* width height mult))
         (result-data (make-sequence 'vector size))
         (real-type (symbolic-type->real-type type)))
    (with-foreign-object (array real-type size)
      (%gl:read-pixels x y width height format type array)
      (dotimes (i size result-data)
        (setf (svref result-data i)
              (mem-aref array real-type i))))))

(import-export %gl:read-buffer)

;;; 4.3.3 Copying Pixels

(import-export %gl:copy-pixels)
