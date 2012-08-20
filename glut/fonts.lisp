;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; fonts.lisp --- GLUT Font Rendering API.
;;;
;;; Copyright (c) 2006, Luis Oliveira <loliveira@common-lisp.net>
;;;   All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;  o Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;;  o Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;  o Neither the name of the author nor the names of the contributors may
;;;    be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;; A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package #:cl-glut)

;;; Erm, should we want CLISP cross-platform fasl portability I think
;;; those conditionals should be changed to calls to FEATURE-P.

;;; Ugh, freeglut's font macros seem to expand into a pointer to
;;; to a couple of global variables that point somewhere else.
;;; Unless it's windows, in which case it's a sort of enum-as-pointer
;;; thing. "So here it goes:"

(defvar +stroke-roman+)
(defvar +stroke-mono-roman+)
(defvar +bitmap-9-by-15+)
(defvar +bitmap-8-by-13+)
(defvar +bitmap-times-roman-10+)
(defvar +bitmap-times-roman-24+)
(defvar +bitmap-helvetica-10+)
(defvar +bitmap-helvetica-12+)
(defvar +bitmap-helvetica-18+)

;; we need to be able to reinitialize the pointers after loading a
;; saved core, so move it to a separate function...
(defun init-font-pointers ()
  (setf +stroke-roman+
        #+windows (make-pointer 0)
        #-windows (foreign-symbol-pointer "glutStrokeRoman"))

  (setf +stroke-mono-roman+
        #+windows (make-pointer 1)
        #-windows (foreign-symbol-pointer "glutStrokeMonoRoman"))

  (setf +bitmap-9-by-15+
        #+windows (make-pointer 2)
        #-windows (foreign-symbol-pointer "glutBitmap9By15"))

  (setf +bitmap-8-by-13+
        #+windows (make-pointer 3)
        #-windows (foreign-symbol-pointer "glutBitmap8By13"))

  (setf +bitmap-times-roman-10+
        #+windows (make-pointer 4)
        #-windows (foreign-symbol-pointer "glutBitmapTimesRoman10"))

  (setf +bitmap-times-roman-24+
        #+windows (make-pointer 5)
        #-windows (foreign-symbol-pointer "glutBitmapTimesRoman24"))

  (setf +bitmap-helvetica-10+
        #+windows (make-pointer 6)
        #-windows (foreign-symbol-pointer "glutBitmapHelvetica10"))

  (setf +bitmap-helvetica-12+
        #+windows (make-pointer 7)
        #-windows (foreign-symbol-pointer "glutBitmapHelvetica12"))

  (setf +bitmap-helvetica-18+
        #+windows (make-pointer 8)
        #-windows (foreign-symbol-pointer "glutBitmapHelvetica18")))

(init-font-pointers)

;;; Functions

;;; Do we want CHAR-CODE conversion here?

(defcfun ("glutBitmapCharacter" bitmap-character) :void
  (font :pointer)
  (character :int))

(defcfun ("glutBitmapWidth" bitmap-width) :int
  (font :pointer)
  (character :int))

(defcfun ("glutStrokeCharacter" stroke-character) :void
  (font :pointer)
  (character :int))

(defcfun ("glutStrokeWidth" stroke-width) :int
  (font :pointer)
  (character :int))

;; freeglut ext?
(defcfun ("glutBitmapLength" bitmap-length) :int
  (font :pointer)
  (string :string))

;; freeglut ext?
(defcfun ("glutStrokeLength" stroke-length) :int
  (font :pointer)
  (string :string))

;; freeglut ext
#-darwin
(defcfun ("glutBitmapHeight" bitmap-height) :int
  (font :pointer))

;; freeglut ext
#-darwin
(defcfun ("glutStrokeHeight" stroke-height) %gl:float
  (font :pointer))

;; freeglut ext
#-darwin
(defcfun ("glutBitmapString" bitmap-string) :void
  (font :pointer)
  (string :string))

;; freeglut ext
#-darwin
(defcfun ("glutStrokeString" stroke-string) :void
  (font :pointer)
  (string :string))