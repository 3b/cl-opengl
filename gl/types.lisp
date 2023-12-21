;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; Copyright (c) 2004, Oliver Markovic <entrox@entrox.org>
;;; Copyright (c) 2007, Luis Oliveira <loliveira@common-lisp.net>
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

(in-package #:cl-opengl-bindings)

;;;; GL types.

;;; Note: the symbols BOOLEAN, BYTE, FLOAT, CHAR and STRING have been
;;; shadowed from the CL package.

(define-foreign-type ensure-integer ()
  ()
  (:actual-type :int32)
  (:simple-parser ensure-integer))

(defmethod translate-to-foreign (value (type ensure-integer))
  (truncate value))

(defmethod expand-to-foreign (value (type ensure-integer))
  (if (constantp value)
      (truncate (eval value))
      `(truncate ,value)))

(define-foreign-type ensure-float ()
  ()
  (:actual-type :float)
  (:simple-parser ensure-float))

(defmethod translate-to-foreign (value (type ensure-float))
  (cl:float value 1.0f0))

(defmethod expand-to-foreign (value (type ensure-float))
  (if (constantp value)
      (cl:float (eval value) 1.0f0)
      `(cl:float ,value 1.0f0)))

(define-foreign-type ensure-double ()
  ()
  (:actual-type :double)
  (:simple-parser ensure-double))

(defmethod translate-to-foreign (value (type ensure-double))
  (cl:float value 1.0d0))

(defmethod expand-to-foreign (value (type ensure-double))
  (if (constantp value)
      (cl:float (eval value) 1.0d0)
      `(cl:float ,value 1.0d0)))

(define-foreign-type offset-or-pointer ()
  ()
  (:actual-type sizeiptr)
  (:simple-parser offset-or-pointer))

(defmethod translate-to-foreign (value (type offset-or-pointer))
  (if (pointerp value)
      (pointer-address value)
      value))

(defmethod expand-to-foreign (value (type offset-or-pointer))
  (cond
    ((and (constantp value) (pointerp value))
     (pointer-address value))
    ((and (constantp value) (typep value '(integer 0)))
     value)
    (t
     (alexandria:once-only (value)
       `(if (pointerp ,value)
            (pointer-address ,value)
            ,value)))))

;;;; Deftypes
;; spec lists exact sizes for most of these, but gl.xml defines them
;; with C types, so using the C types here to match the headers

;; to gl, 0->false, others-> true. from gl,false->0,true->1
(defctype boolean (:boolean :unsigned-char)) ;; spec = 8 bit, sign not specified
(defctype bitfield :unsigned-int) ;; spec = 32 bits, sign not specified

(defctype byte :int8)
(defctype ubyte :uint8)

(defctype short :int16)
(defctype ushort :uint16)

(defctype int ensure-integer) ;; gl.xml = :int, spec = :int32
(defctype uint :unsigned-int) ;; spec = :uint32
(defctype clampx :int32)
(defctype sizei ensure-integer) ;; gl.xml = :int, spec = :uint32?

(defctype float ensure-float)
(defctype clampf ensure-float)
(defctype double ensure-double)
(defctype clampd ensure-double)

(defctype char :char) ;; spec = 8 bit, sign not specified
(defctype char-arb :char)

(defctype handle-arb #+darwin :pointer #-darwin :uint32)

(defctype half :uint16)
(defctype half-arb :uint16)
(defctype half-nv :uint16)
(defctype fixed :int32)


;; enum is 'unsigned int', spec = 32

(defctype int64 :int64)
(defctype uint64 :uint64)
(defctype int64-ext :int64)
(defctype uint64-ext :uint64)

(defctype void :void)
(defctype string :string)

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; try to figure out a good size for intptr/ptrdiff_t and sizeiptr
  (cond
    ((= (foreign-type-size :pointer)
        (foreign-type-size :uint32))
     (defctype ptrdiff-t :int32)
     (defctype sizeiptr :uint32))
    ((= (foreign-type-size :pointer)
        (foreign-type-size :uint64))
     (defctype ptrdiff-t :int64)
     (defctype sizeiptr :uint64))
    (t (error "not sure how big ptrdiff-t is on this platform"))))

(defctype intptr ptrdiff-t)
(defctype intptr-arb ptrdiff-t)
(defctype sizeiptr-arb sizeiptr)

(defctype egl-image-oes (:pointer :void))
(defctype sync (:pointer)) ;; struct __GLsync *
(defctype vdpau-surface-nv intptr)
(defctype egl-client-buffer-ext (:pointer))

;; fixme: should these be here? better name if so?
(defcstruct _cl_context) ; "struct _cl_context"
(defcstruct _cl_event) ; "struct _cl_event"

 ;; fixme: include full signature?
(defctype debugproc (:pointer))
(defctype debugproc-arb (:pointer))
(defctype debugproc-amd (:pointer))
(defctype debugprockhr (:pointer))
(defctype vulkanproc-nv (:pointer))

;; some old definitions that were removed from spec, included only to
;; make old code that manually converted keywords to integers
;; work. New code should use the new bitfields.

;; use BufferStorageMask instead
(defbitfield (MapBufferUsageMask :unsigned-int)
  (:map-read-bit-ext #x1)
  (:map-read-bit #x1)
  (:map-read #x1)
  (:map-write-bit-ext #x2)
  (:map-write-bit #x2)
  (:map-write #x2)
  (:map-invalidate-range-bit-ext #x4)
  (:map-invalidate-range-bit #x4)
  (:map-invalidate-range #x4)
  (:map-invalidate-buffer-bit-ext #x8)
  (:map-invalidate-buffer-bit #x8)
  (:map-invalidate-buffer #x8)
  (:map-flush-explicit-bit-ext #x10)
  (:map-flush-explicit-bit #x10)
  (:map-flush-explicit #x10)
  (:map-unsynchronized-bit-ext #x20)
  (:map-unsynchronized-bit #x20)
  (:map-unsynchronized #x20)
  (:map-persistent-bit-ext #x40)
  (:map-persistent-bit #x40)
  (:map-persistent #x40)
  (:map-coherent-bit-ext #x80)
  (:map-coherent-bit #x80)
  (:map-coherent #x80)
  (:dynamic-storage-bit-ext #x100)
  (:dynamic-storage-bit #x100)
  (:dynamic-storage #x100)
  (:client-storage-bit-ext #x200)
  (:client-storage-bit #x200)
  (:client-storage #x200)
  (:sparse-storage-bit-arb #x400)
  (:per-gpu-storage-bit-nv #x800)
  (:lgpu-separate-storage-bit-nvx #x800))


;; use MapBufferAccessMask instead
(defbitfield (BufferAccessMask :unsigned-int)
  (:map-read #x1)
  (:map-read-bit #x1)
  (:map-read-bit-ext #x1)
  (:map-write #x2)
  (:map-write-bit #x2)
  (:map-write-bit-ext #x2)
  (:map-invalidate-range #x4)
  (:map-invalidate-range-bit #x4)
  (:map-invalidate-range-bit-ext #x4)
  (:map-invalidate-buffer #x8)
  (:map-invalidate-buffer-bit #x8)
  (:map-invalidate-buffer-bit-ext #x8)
  (:map-flush-explicit #x10)
  (:map-flush-explicit-bit #x10)
  (:map-flush-explicit-bit-ext #x10)
  (:map-unsynchronized #x20)
  (:map-unsynchronized-bit #x20)
  (:map-unsynchronized-bit-ext #x20)
  (:map-persistent #x40)
  (:map-persistent-bit #x40)
  (:map-persistent-bit-ext #x40)
  (:map-coherent #x80)
  (:map-coherent-bit #x80)
  (:map-coherent-bit-ext #x80))
