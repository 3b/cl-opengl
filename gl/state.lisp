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


;;;
;;; Chapter 6 - State and State Requests
;;;
;;; 6.1 Querying GL State
;;;


;;; 6.1.1 Simple queries

;;; FIXME: Enable/Disable do not belong here, but I can't find the proper
;;; place to put them. They appear the first time in 2.11.3, but that's
;;; about normal transformations.

(defcfun ("glEnable" %glEnable) :void (target enable-cap))
(defcfun ("glDisable" %glDisable) :void (target enable-cap))
(defcfun ("glIsEnabled" %glIsEnabled) GLboolean (target enable-cap))

;; external
(defun enable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%glEnable cap)))

;; external
(defun disable (&rest caps)
  (declare (dynamic-extent caps))
  (dolist (cap caps)
    (%glDisable cap)))

;; external
(defun enabledp (cap)
  (not (zerop (%glIsEnabled cap))))





;;; 6.1.11 Pointer and String Queries

;;; FIXME: missing glGetPointer

(defcfun ("glGetString" %glGetString) :pointer
  (name string-name))

;; external
(defun get-string (name)
  (foreign-string-to-lisp (%glGetString name)))

;; external
(defun major-version ()
  (multiple-value-bind (num characters-read)
      (parse-integer (get-string :version) :end 1)
    (declare (ignore characters-read))
    num))

;; external
(defun minor-version ()
  (multiple-value-bind (num characters-read)
      (parse-integer (get-string :version) :start 2 :end 3)
    (declare (ignore characters-read))
    num))

;; external
(defun extension-present-p (name)
  (not (null (search name (get-string :extensions)))))





;;; 6.1.15 Saving and Restoring State

(defcfun ("glPushAttrib" %glPushAttrib) :void
  (mask GLbitfield))

(defcfun ("glPushClientAttrib" %glPushClientAttrib) :void
  (mask GLbitfield))

(defun make-bitfield (enum-name attributes)
  (apply #'logior 0 (mapcar (lambda (x)
			      (foreign-enum-value enum-name x))
			    attributes)))

;; external
(defun push-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%glPushAttrib (make-bitfield 'server-attributes attributes)))

(define-compiler-macro push-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%glPushAttrib ,(make-bitfield 'server-attributes attributes))
      form))

;; external
(defun push-client-attrib (&rest attributes)
  (declare (dynamic-extent attributes))
  (%glPushClientAttrib (make-bitfield 'client-attributes attributes)))

(define-compiler-macro push-client-attrib (&whole form &rest attributes)
  (if (every #'keywordp attributes)
      `(%glPushClientAttrib ,(make-bitfield 'client-attributes attributes))
      form))


;; external
(defcfun ("glPopAttrib" pop-attrib) :void)

;; external
(defcfun ("glPopClientAttrib" pop-client-attrib) :void)
