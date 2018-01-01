;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; Copyright (c) 2015, Bart Botta <00003b@gmeil.com>
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

;;;; DSA functions from gl 4.5+

;;; buffers

(defun create-buffers (count)
  (with-foreign-object (buffer-array '%gl:uint count)
    (%gl:create-buffers count buffer-array)
    (loop for i below count
          collecting (mem-aref buffer-array '%gl:uint i))))

(defun create-buffer ()
  (with-foreign-object (array '%gl:uint 1)
    (%gl:create-buffers 1 array)
    (mem-aref array '%gl:uint 0)))

(defun buffer-storage (target data flags &key end)
  ;; DATA should be either a foreign pointer (with END specified),
  ;; NIL, or a typed CL vector of some scalar numerical type
  (setf flags (cffi:foreign-bitfield-value
               ;; not quite right type,
               '%gl::mapbufferusagemask
               flags))
  (when (cffi:pointerp data)
    (%gl:buffer-storage target end data flags)
    (return-from buffer-storage nil))
  (setf end (if end
                (min end (length data))
                (length data)))
  (macrolet ((copy (ctype size)
               `(with-foreign-object (b ,ctype (* end ,size))
                  (loop for element across data
                        for i below end
                        do (setf (cffi:mem-aref b ,ctype i)
                                 element))
                  (%gl:buffer-storage target end b flags))))
    ;; todo: handle more types, possibly untyped arrays?
    (etypecase data
      ((simple-array (unsigned-byte 8) (*))
       (copy :uint8 1))
      ((simple-array single-float (*))
       (copy :float 4))
      ((simple-array (unsigned-byte 16) (*))
       (copy :uint16 2))
      ((simple-array (unsigned-byte 32) (*))
       (copy :uint32 4)))))

(defun named-buffer-storage (buffer data flags &key end)
  ;; DATA should be either a foreign pointer (with END specified), NIL
  ;; (with END specified), or a typed CL vector of some scalar
  ;; numerical type
  (unless (integerp flags)
    (setf flags (cffi:foreign-bitfield-value
                 ;; not quite right type,
                 '%gl::mapbufferusagemask
                 flags)))
  (unless data
    (setf data (cffi:null-pointer)))
  (when (cffi:pointerp data)
    (%gl:named-buffer-storage buffer end data flags)
    (return-from named-buffer-storage nil))
  (setf end (if end
                (min end (length data))
                (length data)))
  (macrolet ((copy (ctype size)
               `(with-foreign-object (b ,ctype (* end ,size))
                  (loop for element across data
                        for i below end
                        do (setf (cffi:mem-aref b ,ctype i)
                                 element)
                           (%gl:named-buffer-storage buffer end b flags)))))
    ;; todo: handle more types, possibly untyped arrays?
    (etypecase data
      ((simple-array (unsigned-byte 8) (*))
       (copy :uint8 1))
      ((simple-array single-float (*))
       (copy :float 4))
      ((simple-array (unsigned-byte 16) (*))
       (copy :uint16 2))
      ((simple-array (unsigned-byte 32) (*))
       (copy :uint32 4)))))



;;; vertex arrays

(defun create-vertex-arrays (count)
  (with-foreign-object (arrays '%gl:uint count)
    (%gl:create-vertex-arrays count arrays)
    (loop for i below count
          collecting (mem-aref arrays '%gl:uint i))))

(defun create-vertex-array ()
  (with-foreign-object (arrays '%gl:uint 1)
    (%gl:create-vertex-arrays 1 arrays)
    (mem-aref arrays '%gl:uint 0)))
