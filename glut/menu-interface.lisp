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

;; (instance menu-name) -> id. EQL hash, so store cons in window
;; (defvar *menus* (make-hash-table))
;; id -> (instance menu-name)
(defvar *id->menu* (make-hash-table))
;; used while building submenus
(defvar *sub-menus*)

;; user callback to handle menu clicks
;;; 'menu' is name of mouse button, or keyword naming a submenu
(defgeneric menu (window menu item))

(defun id->menu-item (window menu-name item-id)
  (let* ((m (gethash menu-name (%menu-ids window)))
         (id->item (second m)))
    (gethash item-id id->item)))

(defcallback menu-callback :void ((item-id :int))
  (let* ((menu-id (get-menu))
         (menu (gethash menu-id *id->menu*))
         (window-id (get-window))
         (window (aref *id->window* window-id))
         (button (cadr menu)))
    (assert menu)
    (assert (eql (car menu) window))
    (with-simple-restart (continue "Skip processing this event")
      (menu window button (id->menu-item window (second menu) item-id)))))


(defun canonicalize-menu-description (description)
  (loop
    for i in description
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
                            (list (substitute #\space #\- (symbol-name n)) n)))
                         (canonicalize-menu-description (cddr i)))))
                 sub))
              (cons
               i)
              (string (list i (intern (string-upcase i)
                                      (find-package :keyword))))
              (symbol (list (substitute #\space #\- (symbol-name i)) i)))))

(defun ensure-menu-for-window (menu-name window items)
  (let* ((m (gethash menu-name (%menu-ids window))))
;;; ideally this should be able to update menus in-place, but for
;;; now just requiring all changes to destroy and recreate all
;;; menus for window to change any of them
    (when m
      (error "can't modify menus yet"))
    (unless m
      (setf m (list (create-menu (callback menu-callback))
                    (make-hash-table)
                    items))
      (setf (gethash menu-name (%menu-ids window)) m)
      (setf (gethash (first m) *id->menu*)
            (list window menu-name)))
    (let ((menu-id (first m))
          (item-hash (second m)))
      (set-menu menu-id)
      (loop for (text key . rest) in items
            do (cond
                 ((eql text :menu)
                  (ensure-menu-for-window (second key) window rest)
                  (set-menu menu-id)
                  (add-sub-menu (first key)
                                (first (gethash (second key)
                                                (%menu-ids window)))))
                 (t (let ((i (hash-table-count item-hash)))
                      (setf (gethash i item-hash) key)
                      (add-menu-entry text i))))))))

(defmethod create-window-menus ((window base-window))
  (when (left-menu window)
    (ensure-menu-for-window :left-button window (left-menu window))
    (set-window (id window))
    (set-menu (first (gethash :left-button (%menu-ids window))))
    (attach-menu :left-button))
  (when (right-menu window)
    (ensure-menu-for-window :right-button window (right-menu window))
    (set-window (id window))
    (set-menu (first (gethash :right-button (%menu-ids window))))
    (attach-menu :right-button))
  (when (middle-menu window)
    (ensure-menu-for-window :middle-button window (middle-menu window))
    (set-window (id window))
    (set-menu (first (gethash :middle-button (%menu-ids window))))
    (attach-menu :middle-button)))


(defmethod destroy-window-menus ((window base-window))
  (flet ((thunk ()
           (with-window window
             (loop for k being the hash-keys of (%menu-ids window)
                     using (hash-value (id))
                   do (remhash k (%menu-ids window))
                      (remhash id *id->menu*)
                      ;; don't bother detaching menus if window was
                      ;; destroyed already
                      (when-current-window-exists
                        (when (member k '(:left-button :right-button :middle-button))
                          (detach-menu k)))
                      (destroy-menu id)))))
    (if *menu-active*
        (push #'thunk *deferred-menu-ops*)
        (thunk))))

(defmethod rebuild-window-menus ((window base-window) button)
  (destroy-window-menus window)
  (create-window-menus window))

(defmethod (setf left-menu) :around (new (window base-window))
  (let ((old (left-menu window))
        (new (canonicalize-menu-description new)))
    (setf (slot-value window 'left-menu) new)
    (when (and (slot-boundp window 'id) (id window))
      (unless (tree-equal old new :test 'equal)
        (rebuild-window-menus window :left-button)))
    new))

(defmethod (setf right-menu) :around (new (window base-window))
  (let ((old (right-menu window))
        (new (canonicalize-menu-description new)))
    (setf (slot-value window 'right-menu) new)
    (when (and (slot-boundp window 'id) (id window))
      (unless (tree-equal old new :test 'equal)
        (rebuild-window-menus window :right-button)))
    new))

(defmethod (setf middle-menu) :around (new (window base-window))
  (let ((old (middle-menu window))
        (new (canonicalize-menu-description new)))
    (setf (slot-value window 'middle-menu) new)
    (when (and (slot-boundp window 'id) (id window))
      (unless (tree-equal old new :test 'equal)
        (rebuild-window-menus window :middle-button)))
    new))
