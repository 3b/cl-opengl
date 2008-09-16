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
;;; Chapter 6 - State and State Requests
;;;


;;; 6.1.11 Pointer and String Queries
;;; FIXME: missing glGetPointer


;;; 6.1.15 Saving and Restoring State

;; not used anymore?
;;(defun make-bitfield (enum-name attributes)
;;  (apply #'logior 0 (mapcar (lambda (x)
;;                              (foreign-enum-value enum-name x))
;;                            attributes)))
;;

;; external
(defun push-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%gl:push-attrib attributes))

(define-compiler-macro push-attrib (&whole form &rest attributes)
 (if (every #'keywordp attributes)
      `(%gl:push-attrib ,(foreign-bitfield-value '%gl::AttribMask attributes))
      form))


(import-export %gl:pop-attrib)

(defmacro with-pushed-attrib ((&rest attributes) &body body)
  `(progn
     (push-attrib ,@attributes)
     (multiple-value-prog1 (progn ,@body)
       (pop-attrib))))

;; external
(defun push-client-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%gl:push-client-attrib attributes))

(define-compiler-macro push-client-attrib (&whole form &rest attributes)
 (if (every #'keywordp attributes)
     `(%gl:push-client-attrib ,(foreign-bitfield-value '%gl::ClientAttribMask attributes))
     form))

(import-export %gl:pop-client-attrib)

(defmacro with-pushed-client-attrib ((&rest attributes) &body body)
  `(progn
     (%gl:push-client-attrib ,attributes)
     (multiple-value-prog1 (progn ,@body)
       (pop-client-attrib))))
