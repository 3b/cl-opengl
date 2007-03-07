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

;;; the following three where taken from CFFI

(defun starts-with (list x)
  "Is x a list whose first element is x?"
  (and (consp list) (eql (first list) x)))

(defun side-effect-free? (exp)
  "Is exp a constant, variable, or function,
  or of the form (THE type x) where x is side-effect-free?"
  (or (atom exp) (constantp exp)
      (starts-with exp 'function)
      (and (starts-with exp 'the)
           (side-effect-free? (third exp)))))

(defmacro once-only (variables &rest body)
    "Returns the code built by BODY.  If any of VARIABLES
  might have side effects, they are evaluated once and stored
  in temporary variables that are then passed to BODY."
    (assert (every #'symbolp variables))
    (let ((temps nil))
      (dotimes (i (length variables)) (push (gensym "ONCE") temps))
      `(if (every #'side-effect-free? (list .,variables))
   (progn .,body)
   (list 'let
    ,`(list ,@(mapcar #'(lambda (tmp var)
                `(list ',tmp ,var))
            temps variables))
    (let ,(mapcar #'(lambda (var tmp) `(,var ',tmp))
             variables temps)
      .,body)))))

(defun symbolic-type->real-type (type)
  (ecase type
    (:byte '%gl:byte)
    (:unsigned-byte '%gl:ubyte)
    (:bitmap '%gl:ubyte)
    (:short '%gl:short)
    (:unsigned-short '%gl:ushort)
    (:int '%gl:int)
    (:unsigned-int '%gl:uint)
    (:float '%gl:float)
    (:unsigned-byte-3-3-2 '%gl:ubyte)
    (:unsigned-byte-2-3-3-rev '%gl:ubyte)
    (:unsigned-short-5-6-5 '%gl:ushort)
    (:unsigned-short-5-6-5-rev '%gl:ushort)
    (:unsigned-short-4-4-4-4 '%gl:ushort)
    (:unsigned-short-4-4-4-4-rev '%gl:ushort)
    (:unsigned-short-5-5-5-1 '%gl:ushort)
    (:unsigned-short-1-5-5-5-rev '%gl:ushort)
    (:unsigned-int-8-8-8-8 '%gl:uint)
    (:unsigned-int-8-8-8-8-rev '%gl:uint)
    (:unsigned-int-10-10-10-2 '%gl:uint)
    (:unsigned-int-2-10-10-10-rev '%gl:uint)))

(defmacro with-opengl-array ((var type lisp-array) &body body)
  (check-type var symbol)
  (let ((count (gensym "COUNT"))
        (array (gensym "ARRAY")))
    (once-only (type)
      `(let* ((,array ,lisp-array)
              (,count (length ,array)))
         (with-foreign-object (,var ,type ,count)
           (loop for i below ,count
                 do (setf (mem-aref ,var ,type i) (aref ,array i)))
           ,@body)))))

(defmacro with-opengl-arrays (bindings &body body)
  (if (null bindings)
      `(let nil ,@body)
      `(with-opengl-array ,(car bindings)
         (with-opengl-arrays ,(cdr bindings)
           ,@body))))

(defmacro with-pixel-array ((var type lisp-array) &body body)
  `(with-opengl-array (,var (symbolic-type->real-type ,type) ,lisp-array)
     ,@body))

;;; TODO: maybe define opengl-sequence as a CFFI type. possibly something
;;; that would enforce a given length and type.
(defmacro with-opengl-sequence ((var type lisp-sequence) &body body)
  (check-type var symbol)
  (flet ((converting (form)            ; um, assuming type is constant
           (case (eval type)           ; silly hack.. FIXME
             (float `(float ,form))
             (double `(float ,form 1.0d0))
             (t form))))
    (let ((count (gensym "COUNT")))
      (once-only (type lisp-sequence)
        `(let ((,count (length ,lisp-sequence)))
           (with-foreign-object (,var ,type ,count)
             (loop for i below ,count
                   do (setf (mem-aref ,var ,type i)
                            ,(converting `(elt ,lisp-sequence i))))
             ,@body))))))

;;; The following utils were taken from SBCL's
;;; src/code/*-extensions.lisp

(defun symbolicate (&rest things)
  "Concatenate together the names of some strings and symbols,
producing a symbol in the current package."
  (let* ((length (reduce #'+ things
                         :key (lambda (x) (length (string x)))))
         (name (make-array length :element-type 'character)))
    (let ((index 0))
      (dolist (thing things (values (intern name)))
        (let* ((x (string thing))
               (len (length x)))
          (replace name x :start1 index)
          (incf index len))))))

;;; Automate an idiom often found in macros:
;;;   (LET ((FOO (GENSYM "FOO"))
;;;         (MAX-INDEX (GENSYM "MAX-INDEX-")))
;;;     ...)
;;;
;;; "Good notation eliminates thought." -- Eric Siggia
;;;
;;; Incidentally, this is essentially the same operator which
;;; _On Lisp_ calls WITH-GENSYMS.
(defmacro with-unique-names (symbols &body body)
  `(let ,(mapcar (lambda (symbol)
                   (let* ((symbol-name (symbol-name symbol))
                          (stem (if (every #'alpha-char-p symbol-name)
                                    symbol-name
                                    (concatenate 'string symbol-name "-"))))
                     `(,symbol (gensym ,stem))))
                 symbols)
     ,@body))

;;; Yes, this is somewhat silly since package.lisp interns and exports
;;; the symbols then we unintern, import from %GL and re-export.  It,
;;; however, (a) avoids importing the %GL package which shadows some
;;; CL symbols, (b) allows us to keep a full list of exported symbols
;;; in package.lisp, (c) serves as documentation regarding which
;;; functions are being exposed directly and (d) avoids that dreaded
;;; SBCL PACKAGE-AT-VARIANCE warning.
(defmacro import-export (&rest symbols)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ;; Unintern first to avoid conflicts.
     (dolist (sym ',symbols)
       (let ((s (find-symbol (symbol-name sym))))
         (when s (unintern s))))
     ;; Import and re-export.
     (import ',symbols)
     (export ',symbols)))

(defmacro definline (name args &body body)
  `(progn
     (declaim (inline ,name))
     (defun ,name ,args ,@body)))