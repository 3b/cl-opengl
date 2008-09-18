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
;;; Chapter 3 - Rasterization
;;;

;;;
;;; 3.4 Line Segments
;;;

(import-export %gl:line-stipple)

;;;
;;; 3.5 Polygons
;;;

;;; 3.5.2 Stippling

(defun polygon-stipple (pattern)
  (with-opengl-sequence (p '%gl:ubyte pattern)
    (%gl:polygon-stipple p)))

;;; 3.5.4 Options Controlling Polygon Rasterization

;(import-export %gl:polygon-mode %gl:polygon-offset)

;;;
;;; 3.6 Pixel Rectangles
;;;

;;; 3.6.3 Pixel Transfer Modes

(defun pixel-transfer (pname value)
  (case pname
    ((:map-color :map-stencil)
     (%gl:pixel-transfer-i pname (if value 1 0)))
    ((:index-shift :index-offset)
     (%gl:pixel-transfer-i pname value))
    (t
     (%gl:pixel-transfer-f pname value))))

(defun pixel-map (map values)
  (let ((n (length values)))
    (with-foreign-object (p '%gl:float n)
      (dotimes (i n)
        (setf (mem-aref p '%gl:float i) (elt values i)))
      (%gl:pixel-map-fv map n p))))

;;; 3.6.4 Rasterization of Pixel Rectangles

(defun draw-pixels (width height format type data)
  (with-pixel-array (array type data)
    (%gl:draw-pixels width height format type array)))

;;;
;;; 3.8 Texturing
;;;

;;; The following two functions look awkward to use, so we'll provide the two
;;; lispier functions TEXTURE-RESIDENT-P and PRIORITIZE-TEXTURE, which can be
;;; used in mapping functions or like (every #'texture-resident-p texture-list).

;;; TODO: check whether the new gl:boolean semantics didn't break
;;; these functions.

(defun are-textures-resident (textures)
  (let ((count (length textures)))
    (with-opengl-sequence (texture-array '%gl:uint textures)
      (with-foreign-object (residence-array '%gl:boolean count)
        (if (%gl:are-textures-resident count texture-array residence-array)
            (loop for i below count
                  collecting (mem-aref residence-array '%gl:boolean i))
            t)))))

(defun prioritize-textures (textures priorities)
  (let ((texture-count (length textures))
        (priority-count (length priorities)))
    (when (/= texture-count priority-count)
      (error "There needs to be an equal number of textures and priorities."))
    (with-opengl-sequence (texture-array '%gl:uint textures)
      (with-opengl-sequence (priority-array '%gl:clampf priorities)
        (%gl:prioritize-textures texture-count texture-array priority-array)))))


(defun texture-resident-p (texture)
  (with-foreign-objects ((texture-pointer '%gl:uint)
                         (residence-pointer '%gl:boolean))
    (setf (mem-ref texture-pointer '%gl:uint) texture)
    (%gl:are-textures-resident 1 texture-pointer residence-pointer)))

(defun prioritize-texture (texture priority)
  (with-foreign-objects ((texture-pointer '%gl:uint)
                         (priority-pointer '%gl:clampf))
    (setf (mem-ref texture-pointer '%gl:uint) texture
          (mem-ref priority-pointer '%gl:clampf) priority)
    (%gl:prioritize-textures 1 texture-pointer priority-pointer)))


;;;
;;; 3.10 Fog
;;;

(defun fog (pname param)
  (ecase pname
    (:fog-color
     (with-foreign-object (c '%gl:float 4)
       (dotimes (i 4)
         (setf (mem-aref c '%gl:float i) (elt param i)))
       (%gl:fog-fv pname c)))
    (:fog-mode
     (%gl:fog-i pname (foreign-enum-value '%gl:enum param)))
    (:fog-coord-src
     (%gl:fog-i pname (foreign-enum-value '%gl:enum param)))
    ((:fog-density :fog-start :fog-end)
     (%gl:fog-f pname param))))
