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
    (:byte 'GLbyte)
    (:unsigned-byte 'GLubyte)
    (:bitmap 'GLubyte)
    (:short 'GLshort)
    (:unsigned-short 'GLushort)
    (:int 'GLint)
    (:unsigned-int 'GLuint)
    (:float 'GLfloat)
    (:unsigned-byte-3-3-2 'GLubyte)
    (:unsigned-byte-2-3-3-rev 'GLubyte)
    (:unsigned-short-5-6-5 'GLushort)
    (:unsigned-short-5-6-5-rev 'GLushort)
    (:unsigned-short-4-4-4-4 'GLushort)
    (:unsigned-short-4-4-4-4-rev 'GLushort)
    (:unsigned-short-5-5-5-1 'GLushort)
    (:unsigned-short-1-5-5-5-rev 'GLushort)
    (:unsigned-int-8-8-8-8 'GLuint)
    (:unsigned-int-8-8-8-8-rev 'GLuint)
    (:unsigned-int-10-10-10-2 'GLuint)
    (:unsigned-int-2-10-10-10-rev 'GLuint)))


(defmacro with-opengl-array ((var type lisp-array) &body body)
  (check-type var symbol)
  (let ((count (gensym "COUNT")))
    (once-only (type)
     (once-only (lisp-array)
       `(let ((,count (length ,lisp-array)))
          (with-foreign-object (,var ,type ,count)
            (loop for i below ,count
                  do (setf (mem-aref ,var ,type i) (aref ,lisp-array i)))
            ,@body))))))

(defmacro with-pixel-array ((var type lisp-array) &body body)
  `(with-opengl-array (,var (symbolic-type->real-type ,type) ,lisp-array)
     ,@body))


(defmacro with-opengl-sequence ((var type lisp-sequence) &body body)
  (check-type var symbol)
  (let ((count (gensym "COUNT")))
    (once-only (type)
     (once-only (lisp-sequence)
       `(let ((,count (length ,lisp-sequence)))
          (with-foreign-object (,var ,type ,count)
            (loop for i below ,count
                  do (setf (mem-aref ,var ,type i) (elt ,lisp-sequence i)))
            ,@body))))))
