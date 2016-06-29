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
    (:unsigned-int-5-9-9-9-rev '%gl:uint)
    (:unsigned-int-2-10-10-10-rev '%gl:uint)))

;;; Converts a CFFI type to the appropriate GL enum.
(defun cffi-type-to-gl (type)
  (ecase type
    ((:char :signed-char) :byte)
    ((:uchar :unsigned-char) :unsigned-byte)
    ((:short :signed-short) :short)
    ((:ushort :unsigned-short) :unsigned-short)
    ((:int :signed-int) :int)
    ((:uint :unsigned-int) :unsigned-int)
    (:float :float)
    (:double :double)))

(defmacro with-opengl-array ((var type lisp-array) &body body)
  (check-type var symbol)
  (let ((count (gensym "COUNT"))
        (array (gensym "ARRAY"))
        (original-type type))
    (once-only (type)
      `(let* ((,array ,lisp-array)
              (,count (length ,array)))
         (with-foreign-object (,var ,type ,count)
           ;; we need type to be a constant within the loop so cffi can
           ;; optimize it, so check type outside the loop, and make a
           ;; copy of the loop for any types we care about
           ;; (unless we know the type at compile time, in which case only
           ;;  generate code for that type)
           ,(if (or (keywordp original-type)
                    (and (consp original-type)
                         (eq (first original-type) 'quote)))
                `(loop for i below ,count
                    do (setf (mem-aref ,var ,original-type i)
                             (aref ,array i)))
                `(case ,type
                   ,@(loop for ctype in '(%gl:byte %gl:ubyte %gl:short
                                          %gl:ushort %gl:int %gl:uint %gl:float)
                        collect
                          `(,ctype
                            (loop for i below ,count
                               do (setf (mem-aref ,var ',ctype i) (aref ,array i)))))
                   (t
                    (loop for i below ,count
                       do (setf (mem-aref ,var ,type i) (aref ,array i))))))
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

;;; The following util was taken from SBCL's
;;; src/code/*-extensions.lisp

(defun symbolicate-package (package &rest things)
  "Concatenate together the names of some strings and symbols,
producing a symbol in the current package."
  (let* ((length (reduce #'+ things
                         :key (lambda (x) (length (string x)))))
         (name (make-array length :element-type 'character)))
    (let ((index 0))
      (dolist (thing things (values (intern name package)))
        (let* ((x (string thing))
               (len (length x)))
          (replace name x :start1 index)
          (incf index len))))))

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

;;; A generic generator for all kinds of OpenGL get functions
;;; (define-get-function NAME (ARG1 ARG2 ... ARGn)
;;;   (TYPE1 FUNC1)
;;;   (TYPE2 FUNC2)
;;;   ...)
;;;
;;; defines a function (NAME ARG1 ... ARGn TYPE [COUNT]) which calls
;;; the right FUNCi where TYPEi equals TYPE like (FUNCi ARG1 ... ARGn
;;; P) where P is a pointer to COUNT values of TYPE.  when COUNT is
;;; odmitted or 1 a simple value is returned, a list of values
;;; otherwise.
;;;
;;; NOTE: should we drop this function or extend define-query-function
;;;       to allow more than one argument? Do we want one function per
;;;       return type or the return type as argument (with sane
;;;       default? per hashtable lookup? also for count?)
(defmacro define-get-function (name (&rest head-args) &body clauses)
  (with-unique-names (return-type return-count p)
    `(defun ,name (,@head-args ,return-type &optional (,return-count 1))
       (with-foreign-object (,p ,return-type ,return-count)
         (ecase ,return-type
           ,@(loop for (func . types) in clauses
                   collect `((,@types) (,func ,@head-args ,p))))
         (if (= ,return-count 1)
             (mem-aref ,p ,return-type 0)
             (loop for i from 0 to (1- ,return-count)
                   collect (mem-aref ,p ,return-type i)))))))

;;; (define-array-pointer NAME BUILTIN-NAME ARG*) defines a very thin
;;; wrapper over BUILTIN-NAME to allow passing a GL-ARRAY,[OFFSET]
;;; last arguments to glFooPointer insteand of a pointer.
(defmacro define-array-pointer (name builtin-name &rest head-args)
  (with-unique-names (array offset)
    `(definline ,name (,@head-args ,array ,offset)
       (,builtin-name ,@head-args (gl-array-pointer-offset ,array ,offset)))))


;;; hack for dealing with duplicate enum values in %gl:enum
;;; todo: &rest ...
(defun enum= (a b)
  (= (if (numberp a) a (cffi:foreign-enum-value '%gl:enum a))
     (if (numberp b) b (cffi:foreign-enum-value '%gl:enum b))))

(define-compiler-macro enum= (&whole whole a b)
  (if (or (constantp a) (constantp b))
      `(= ,(if (constantp a)
               (if (numberp a) a (cffi:foreign-enum-value '%gl:enum a))
               `(if (numberp ,a) ,a (cffi:foreign-enum-value '%gl:enum ,a)))
          ,(if (constantp b)
               (if (numberp b) b (cffi:foreign-enum-value '%gl:enum b))
               `(if (numberp ,b) ,b (cffi:foreign-enum-value '%gl:enum ,b))))
      whole))
