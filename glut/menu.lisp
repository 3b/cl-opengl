;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; menu.lisp --- GLUT Menu Management API.
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

;;; TODO: high-level interface
(defcfun ("glutCreateMenu" create-menu) :int
  (callback :pointer)) ; void (*callback)(int menu)

(defcfun ("glutDestroyMenu" destroy-menu) :void
  (menu-id :int))

(defcfun ("glutGetMenu" get-menu) :int)

(defcfun ("glutSetMenu" set-menu) :void
  (menu-id :int))

(defcfun ("glutAddMenuEntry" add-menu-entry) :void
  (label :string)
  (value :int))

(defcfun ("glutAddSubMenu" add-sub-menu) :void
  (label :string)
  (sub-menu-id :int))

(defcfun ("glutChangeToMenuEntry" change-to-menu-entry) :void
  (item :int)
  (label :string)
  (value :int))

(defcfun ("glutChangeToSubMenu" change-to-sub-menu) :void
  (item :int)
  (label :string)
  (value :int))

(defcfun ("glutRemoveMenuItem" remove-menu-item) :void
  (item :int))

(defcfun ("glutAttachMenu" attach-menu) :void
  (button mouse-button))

(defcfun ("glutDetachMenu" detach-menu) :void
  (button mouse-button))

(defvar *menu-active* nil)
;;; todo: handle more deferred menu ops, use atomic queue or something
;; currently we only defer destroy since that is somewhat easy to
;; trigger by closing a window with a menu open. We also push onto
;; this list and call them in list order, which would be wrong if
;; order matters (for example when destroying and rebuilding), and
;; might have problems with threads.
(defvar *deferred-menu-ops* nil)

(defcallback %menu-status-callback :void ((state menu-state)
                                          (x :int) (y :int))
  (format t "menu status ~s~%" state)
  (setf *menu-active* (unless (eql state :menu-not-in-use)
                        ;; might as well store something potentially
                        ;; useful there for true
                        (list x y)))
  (unless *menu-active*
    (loop while *deferred-menu-ops*
          do (funcall (pop *deferred-menu-ops*)))))

#++
(defcallback %menu-state-callback :void ((state menu-state))
  (setf *menu-active* (eql state :menu-in-use)))
