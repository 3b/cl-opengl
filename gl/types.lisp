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
  (:actual-type :int)
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
  (:actual-type ptrdiff-t)
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

(defctype boolean (:boolean :unsigned-char))
(defctype bitfield :unsigned-int)

(defctype char :char)
(defctype char-arb :char)
(defctype handle-arb :unsigned-int)
(defctype byte :char)
(defctype short :short)
(defctype int ensure-integer)
(defctype sizei ensure-integer)
(defctype ubyte :unsigned-char)
(defctype ushort :unsigned-short)
(defctype uint :unsigned-int)
(defctype half :unsigned-short)
(defctype half-arb :unsigned-short)
(defctype half-nv :unsigned-short)
(defctype int64 :int64)
(defctype uint64 :uint64)

(defctype void :void)
(defctype string :string)

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; try to figure out a good size for ptrdiff_t
  (cond
    ((= (foreign-type-size :pointer)
        (foreign-type-size :long))
     (defctype ptrdiff-t :long ))
    ((= (foreign-type-size :pointer)
        (foreign-type-size :long-long))
     (defctype ptrdiff-t :long-long))
    (t (error "not sure how big ptrdiff-t is on this platform"))))

(defctype intptr ptrdiff-t)
(defctype intptr-arb ptrdiff-t)
(defctype sizeiptr ptrdiff-t)
(defctype sizeiptr-arb ptrdiff-t)

(defctype float ensure-float)
(defctype clampf ensure-float)
(defctype double ensure-double)
(defctype clampd ensure-double)

(defctype clampx :int)
(defctype egl-image-oes (:pointer :void))
(defctype fixed int)
(defctype int64-ext :int64)
(defctype uint64-ext :uint64)
(defctype sync (:pointer)) ;; struct __GLsync *
(defctype vdpau-surface-nv intptr)

;; fixme: should these be here? better name if so?
(defcstruct _cl_context) ; "struct _cl_context"
(defcstruct _cl_event) ; "struct _cl_event"

 ;; fixme: include full signature?
(defctype debugproc (:pointer))
(defctype debugproc-arb (:pointer))
(defctype debugproc-amd (:pointer))
(defctype debugprockhr (:pointer))

