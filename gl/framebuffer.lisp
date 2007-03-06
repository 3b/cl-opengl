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

(declaim (inline scissor))
(defun scissor (left bottom width height)
  "Specifies the scissoring rectangle used by the scissor test (enabled with
the symbolic constant :SCISSOR-TEST"
  (%gl:scissor left bottom width height))

;;; 4.1.3 Multisample Fragment Operations

(declaim (inline sample-coverage))
(defun sample-coverage (value invertp)
  "Specifies the values for SAMPLE-COVERAGE-VALUE and SAMPLE-COVERAGE-INVERT."
  (%gl:sample-coverage (float value) (if invertp 1 0)))

;;; 4.1.4 Alpha Test

(declaim (inline alpha-func))
(defun alpha-func (func ref)
  "Specifies the comparison function for use in the alpha
test (enabled by :ALPHA-TEST). REF is a reference value in the
range [0, 1]. The possible constants specifying the test function
are :NEVER, :ALWAYS, :LESS, :LEQUAL, :EQUAL, :GEQUAL,
:GREATER, or :NOTEQUAL, meaning pass the fragment never, always,
if the fragment's alpha value is less than, less than or equal
to, equal to, greater than or equal to, greater than, or not
equal to the reference value, respectively."
  (%gl:alpha-func func (float ref)))


;;; 4.1.5 Stencil Test

(declaim (inline stencil-func))
(defun stencil-func (func ref mask)
  (%gl:stencil-func func ref mask))

(declaim (inline stencil-func-separate))
(defun stencil-func-separate (face func ref mask)
  (%gl:stencil-func-separate face func ref mask))

(declaim (inline stencil-op))
(defun stencil-op (sfail dpfail dppass)
  "Specifies the action that happens to the stencil value in the
current fragment if the stencil test fails (SFAIL), depth buffer
test fails (DPFAIL) and depth buffer test passes (DPPASS). Possible
values are :KEEP, :ZERO, :REPLACE, :INCR, :DECR,:INVERT, :INCR-WRAP,
and :DECR-WRAP."
  (%gl:stencil-op sfail dpfail dppass))

(declaim (inline stencil-op-separate))
(defun stencil-op-separate (face sfail dpfail dppass)
  "Specifies the action that happens to the stencil value in the current fragment
if the stencil test fails (SFAIL), depth buffer test fails (DPFAIL) and depth buffer
test passes (DPPASS). Possible values are :KEEP, :ZERO, :REPLACE, :INCR, :DECR,
:INVERT, :INCR-WRAP, and :DECR-WRAP. The argument FACE indicates which set of state
is affected and is one of :FRONT, :BACK or :FRONT-AND-BACK."
  (%gl:stencil-op-separate face sfail dpfail dppass))

;;; 4.1.6 Depth Buffer Test

(declaim (inline depth-func))
(defun depth-func (func)
  "Specifies the comparison function to be used for the depth
test (enabled with the symbolic constant :DEPTH-TEST). FUNC must
be one of :NEVER, :ALWAYS,:LESS, :LEQUAL, :EQUAL, :GREATER, :GEQUAL
or :NOTEQUAL. Accordingly, the depth buffer test passes never, always,
if the incoming fragment's zw value is less than, less than or equal to,
equal to, greater than, greater than or equal to, or not equal to
the depth value stored at the location given by the incoming fragment."
  (%gl:depth-func func))

;;; 4.1.7 Occlusion Queries

(declaim (inline begin-query))
(defun begin-query (target id)
  "Starts an occlusion query. TARGET must be the symbolic constant :SAMPLES-PASSED.
If called with an unused id, that name is marked as used and associated with a new
query object."
  (%gl:begin-query target id))

(declaim (inline end-query))
(defun end-query (target)
  "Finishes an occlusion query currently running on target TARGET."
  (%gl:end-query target))

(defun gen-queries (n)
  "Returns N previously unused query object names in a list. These names are marked
as used, but no object is associated with them until the first time they are used by
BEGIN-QUERY."
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


;;; 4.1.8 Blending

(declaim (inline blend-equation))
(defun blend-equation (mode)
  "Specifies the blend equation to be used for both RGB and alpha values. MODE
must be one of the symbolic constants :FUNC-ADD, :FUNC-SUBTRACT, :FUNC-REVERSE-SUBTRACT,
:MIN, :MAX or :LOGIC-OP."
  (%gl:blend-equation mode))

(declaim (inline blend-equation-separate))
(defun blend-equation-separate (mode-rgb mode-alpha)
  "Specifies the blend equations to be used for RGB and alpha values respectively.
MODE-RGB and MODE-ALPHA must be one of the symbolic constants :FUNC-ADD, :FUNC-SUBTRACT,
:FUNC-REVERSE-SUBTRACT, :MIN, :MAX or :LOGIC-OP."
  (%gl:blend-equation-separate mode-rgb mode-alpha))

(declaim (inline blend-func))
(defun blend-func (src dst)
  "Specifies the blend functions. SRC determines both RGB and alpha source functions,
while DST determines both RGB and alpha destination functions. Possible values are
:ZERO, :ONE, :SRC-COLOR, :ONE-MINUS-SRC-COLOR, :DST-COLOR, :ONE-MINUS-DST-COLOR,
:SRC-ALPHA, :ONE-MINUS-SRC-ALPHA, :DST-ALPHA, :ONE-MINUS-DST-ALPHA, :CONSTANT-COLOR,
:ONE-MINUS-CONSTANT-COLOR, :CONSTANT-ALPHA, :ONE-MINUS-CONSTANT-ALPHA and
:SRC-ALPHA-SATURATE (only valid for source blending functions)."
  (%gl:blend-func src dst))

(declaim (inline blend-func-separate))
(defun blend-func-separate (src-rgb dst-rgb src-alpha dst-alpha)
  "Specifies the blend functions. SRC-RGB and DST-RGB determine the source and
destination RGB blend functions, respectively, while SRC-ALPHA and DST-ALPHA determine
the source and destination alpha blend functions. Possible values are
:ZERO, :ONE, :SRC-COLOR, :ONE-MINUS-SRC-COLOR, :DST-COLOR, :ONE-MINUS-DST-COLOR,
:SRC-ALPHA, :ONE-MINUS-SRC-ALPHA, :DST-ALPHA, :ONE-MINUS-DST-ALPHA, :CONSTANT-COLOR,
:ONE-MINUS-CONSTANT-COLOR, :CONSTANT-ALPHA, :ONE-MINUS-CONSTANT-ALPHA and
:SRC-ALPHA-SATURATE (only valid for source blending functions)."
  (%gl:blend-func-separate src-rgb dst-rgb src-alpha dst-alpha))

(declaim (inline blend-color))
(defun blend-color (red green blue alpha)
  "Specifies the constant color to be used in blending. The four parameters are
clamped to the range [0, 1] before being stored."
  (%gl:blend-color (float red) (float green) (float blue) (float alpha)))


;;; 4.1.10 Logical Operation

(declaim (inline logic-op))
(defun logic-op (op)
  "Selects the logical operation used when :INDEX-LOGIC-OP or :COLOR-LOGIC-OP is
enabled. Possible values are :CLEAR, :AND, :AND-REVERSE, :COPY, :AND-INVERTED,
:NOOP, :XOR, :OR, :NOR, :EQUIV, :INVERT, :OR-REVERSE, :COPY-INVERTED, :OR-INVERTED,
:NAND and :SET."
  (%gl:logic-op op))



;;;
;;; 4.2 Whole Framebuffer Operation
;;;

;;; 4.2.1 Selecting a Buffer for Writing

(declaim (inline draw-buffer))
(defun draw-buffer (buffer)
  (%gl:draw-buffer buffer))

(defun draw-buffers (buffers)
  (with-opengl-sequence (seq '%gl:enum buffers)
    (%gl:draw-buffers (length buffers) seq)))


;;; 4.2.2 Fine Control of Buffer Updates

(declaim (inline index-mask))
(defun index-mask (mask)
  (%gl:index-mask mask))

(declaim (inline color-mask))
(defun color-mask (r g b a)
  (%gl:color-mask (if r 1 0) (if g 1 0) (if b 1 0) (if a 1 0)))

(declaim (inline depth-mask))
(defun depth-mask (mask)
  (%gl:depth-mask mask))

(declaim (inline stencil-mask))
(defun stencil-mask (mask)
  (%gl:stencil-mask mask))

(declaim (inline stencil-mask-separate))
(defun stencil-mask-separate (face mask)
  (%gl:stencil-mask-separate face mask))



;;; 4.2.3 Clearing the Buffers

(declaim (inline clear))
(defun clear (&rest bufs)
  (%gl:clear (make-bitfield '%gl:enum bufs)))

(define-compiler-macro clear (&whole form &rest bufs)
  (if (every #'keywordp bufs)
      `(%gl:clear ,(make-bitfield '%gl:enum bufs))
      form))

(declaim (inline clear-color))
(defun clear-color (r g b a)
  (%gl:clear-color (float r) (float g) (float b) (float a)))

(declaim (inline clear-index))
(defun clear-index (index)
  (%gl:clear-index (float index)))

(declaim (inline clear-depth))
(defun clear-depth (depth)
  (%gl:clear-depth (float depth 1.0d0)))

(declaim (inline clear-stencil))
(defun clear-stencil (s)
  (%gl:clear-stencil s))

(declaim (inline clear-accum))
(defun clear-accum (r g b a)
  (%gl:clear-accum (float r) (float g) (float b) (float a)))


;;; 4.2.4 The Accumulation Buffer

(declaim (inline accum))
(defun accum (op value)
  (%gl:accum op (float value)))

;;;
;;; 4.3 Drawing, Reading and Copying Pixels
;;;

;;; 4.3.2 Reading Pixels

(defun read-pixels (x y width height)
  (declare (ignore x y width height))
  (error "not implemented"))

(defun read-buffer (src)
  (%gl:read-buffer src))

;;; 4.3.3 Copying Pixels

(defun copy-pixels (x y width height type)
  (%gl:copy-pixels x y width height type))
