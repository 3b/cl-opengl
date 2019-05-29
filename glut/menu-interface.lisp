;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; menu.lisp --- CLOS interface to GLUT Menu Management API.
;;;
;;; Copyright (c) 2019, Bart Botta <00003b@gmail.com>
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

(defparameter *menus* (make-hash-table))
(defparameter *id->menu* (make-hash-table))
(defvar *sub-menus*)

(defclass menu ()
  ((name :initarg :name :reader name)
   (items :initform :items :reader items)
   (id->item :initform (make-hash-table) :reader id->item)
   (windows :initform (make-hash-table) :reader windows)
   (sub-menus :initform nil :accessor sub-menus)
   (id :initform nil :accessor id)))

(defgeneric menu (window menu item))

(defcallback menu-callback :void ((item-id :int))
  (let* ((menu-id (get-menu))
         (menu (gethash menu-id *id->menu*))
         (window-id (get-window))
         (window (aref *id->window* window-id)))
    (assert menu)
    (menu window menu (gethash item-id (id->item menu)))))

(defun ensure-menu-for-window (menu-name window)
  (let* ((menu (gethash menu-name *menus*)))
    (unless (id menu)
      (setf (id menu) (create-menu (callback menu-callback)))
      (setf (gethash (id menu) *id->menu*) menu)
      (loop for (text key . rest) in (items menu)
            do (cond
                 ((eql text :menu)
                  (ensure-menu-for-window (second key) window)
                  (set-menu (id menu))
                  (add-sub-menu (first key)
                                (id (gethash (second key) *menus*))))
                 (t (let ((i (hash-table-count (id->item menu))))
                      (setf (gethash i (id->item menu)) key)
                      (add-menu-entry text i))))))
    (setf (gethash window (windows menu)) window)))

(defun maybe-destroy-menu (menu-name window)
  (let* ((menu (gethash menu-name *menus*)))
    (when menu
      (remhash window (windows menu))
      (when (and (id menu)
                 (zerop (hash-table-count (windows menu))))
        (destroy-menu (shiftf (id menu) nil))
        (loop for s in (sub-menus menu) do (maybe-destroy-menu s window))))))

(defun define-menu (name items)
  ;; item is string, keyword or (string keyword)
  (let ((sub-menus nil))
    (setf items
          (loop
            for i in items
            collect (etypecase i
                      ((cons (eql :menu))
                       (let* ((n (second i))
                              (sub
                                (list*
                                 (first i)
                                 (etypecase n
                                   (cons n)
                                   (string
                                    (list n
                                          (intern (string-upcase n)
                                                  (find-package :keyword))))
                                   (symbol
                                    (list (symbol-name n) n)))
                                 (cddr i))))
                         (pushnew (second (second sub)) sub-menus)
                         (define-menu (second (second sub))
                             (cddr sub))
                         sub))
                      (cons
                       i)
                      (string (list i (intern (string-upcase i)
                                              (find-package :keyword))))
                      (symbol (list (symbol-name i) i)))))
    (unless (gethash name *menus*)
      (setf (gethash name *menus*)
            (make-instance 'menu :name name)))
    (let ((menu (gethash name *menus*)))
      (setf (sub-menus menu) sub-menus)
      (if (and (items menu) (id menu))
          ;; can't redefine menus while in use
          (assert (tree-equal items (items menu) :test 'equal))
          (setf (slot-value menu 'items) items)))))

(defmacro defmenu (name &body items)
  `(define-menu ',name ',items))

(defclass menu-mixin ()
  ((menus :initarg :menus :initform nil :reader menus)))

(defmethod display-window :before ((window menu-mixin))
  (loop for menu in (menus window)
        if (consp menu)
          do (ensure-menu-for-window (first menu) window)
             (set-menu (id (gethash (first menu) *menus*)))
             (let ((b (second menu)))
               (attach-menu (if (numberp b)
                                b
                                (foreign-enum-value 'mouse-button b))))
        else do (ensure-menu-for-window menu window)))

(defmethod close :around ((window menu-mixin))
  (loop for menu in (menus window)
        if (consp menu)
          do (set-window (id window))
             (set-menu (id (gethash (first menu) *menus*)))
             (let ((b (second menu)))
               (detach-menu (if (numberp b)
                                b
                                (foreign-enum-value 'mouse-button b))))
             (maybe-destroy-menu (first menu) window)
        else do
          (maybe-destroy-menu menu window))
  (when (next-method-p) (call-next-method)))

(defmethod close ((window menu-mixin)))
