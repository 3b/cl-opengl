;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; interface.lisp --- CLOS interface to the GLUT API.
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

;;; This an experimental interface to GLUT. The main goal of this interface
;;; is to provide an easy, flexible way to explore OpenGL. GLUT is not very
;;; helpful in achieving this goal (even though Freeglut is much better than
;;; the original GLUT in this aspect).
;;;
;;; Not all of GLUT's capabilities are accessible when using this high-level
;;; interface *exclusively*. Patches and suggestions are most welcome!

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(special close)))

(export '(;; events / GFs
          timer idle keyboard special reshape visibility display mouse
          motion entry menu-state spaceball-motion spaceball-rotate
          spaceball-button button-box dials tablet-motion tablet-button
          menu-status overlay-display window-status keyboard-up special-up
          joystick mouse-wheel close wm-close menu-destroy
          enable-event disable-event
          ;; classes and accessors
          base-window window sub-window
          find-window with-glut-window title name id events parent
          ))

(defvar *id->window* (make-array 0 :adjustable t)
  "Mapping of GLUT window IDs to instances of the BASE-WINDOW class.")

;;;# Events
;;;
;;; One callback is defined for each GLUT event. Enabling an event for
;;; a given window means registering the respective shared callback
;;; for its window id (using the *-func GLUT functions).
;;;
;;; There is one generic function for each event which is called by
;;; the shared callback to dispatch to the correct method based on the
;;; window (and possibly the other arguments).
;;;
;;; Ugh, some of these event are not implemented by Freeglut, which
;;; is what we care about... Better remove them?
;;;
;;; TODO: the TIMER event is not related to a GLUT window and therefore
;;;       doesn't fit this pattern. Implement it in some other way.
;;; TODO: The JOYSTICK event has parameters, meaning a way to accept
;;;       parameters eg: (:joytick n m) when enabling an event is
;;;       necessary.

(defparameter +event-alist+
  (loop for event in '(:timer :idle :keyboard :special :reshape :visibility
                       :display :mouse :motion :entry :menu-state
                       :spaceball-motion :spaceball-rotate :spaceball-button
                       :button-box :dials :tablet-motion :tablet-button
                       :menu-status :overlay-display :window-status
                       :keyboard-up :special-up :joystick :mouse-wheel :close
                       :wm-close :menu-destroy)
        collect (let ((name (symbol-name event)))
                  (list event (intern name)
                        (intern (concatenate 'string "%" name))
                        (intern (concatenate 'string name
                                             (symbol-name '#:-func)))))))

(defun event-gf (event)
  "Return the generic function that handles EVENT."
  (or (second (assoc event +event-alist+))
      (error "No such event: ~A" event)))

(defun event-cb (event)
  "Returns the CFFI callback name that handles EVENT."
  (or (third (assoc event +event-alist+))
      (error "No such event: ~A" event)))

(defun event-func (event)
  "Return the foreign function that registers EVENT."
  (or (fourth (assoc event +event-alist+))
      (error "No such event: ~A" event)))

(defgeneric enable-event (window event))
(defgeneric disable-event (window event))

(defmacro when-current-window-exists (&body body)
  "Evals BODY when GLUT's exists in *ID->WINDOW*. Lexically binds
CURRENT-WINDOW to the respective object."
  (let ((id (gensym)))
    `(let ((,id (get-window)))
       (when (> (length *id->window*) ,id)
         (let ((current-window (aref *id->window* ,id)))
           (unless (null current-window)
             ,@body))))))

(defctype ascii-to-char :unsigned-char :translate-p t #-(and) nil)

#-(and)
(define-type-translator-macro ascii-to-char :from-foreign (value)
  `(code-char ,value))

(defmethod translate-to-foreign (value (type (eql 'ascii-to-char)))
  (code-char value))

(defmacro define-glut-events (&body event-specs)
  `(progn
     ,@(loop for (name (window-arg . args)) in event-specs
             for arg-names = (mapcar #'car args)
             collect
             `(progn
                (defgeneric ,name (,window-arg ,@arg-names))
                (defcallback ,(intern
                               (concatenate 'string "%" (symbol-name name)))
                    :void ,args
                  (when-current-window-exists
                    (,name current-window ,@arg-names)))))))

(define-glut-events
  (idle             (window))
  (keyboard         (window (key ascii-to-char) (x :int) (y :int)))
  (special          (window (special-key special-keys) (x :int) (y :int)))
  (reshape          (window (width :int) (height :int)))
  (visibility       (window (state visibility-state)))
  (display          (window))
  (mouse            (window (button mouse-button) (state mouse-button-state)
                            (x :int) (y :int)))
  (motion           (window (x :int) (y :int)))
  (entry            (window (state entry-state)))
  (menu-state       (window (state menu-state)))
  (spaceball-motion (window (x :int) (y :int) (z :int)))
  (spaceball-rotate (window (x :int) (y :int) (z :int)))
  (spaceball-button (window (button :int) (state :int)))
  (button-box       (window (button :int) (state :int)))
  (dials            (window (dial :int) (value :int)))
  (tablet-motion    (window (x :int) (y :int)))
  (tablet-button    (window (button :int) (state :int) (x :int) (y :int)))
  (menu-status      (window (status menu-state) (x :int) (y :int)))
  (overlay-display  (window))
  (window-status    (window (state window-status)))
  (keyboard-up      (window (key ascii-to-char) (x :int) (y :int)))
  (special-up       (window (special-key special-keys) (x :int) (y :int)))
  (joystick         (window (buttons joystick-buttons) (x :int) (y :int)
                            (z :int)))
  (mouse-wheel      (window (button mouse-button) (pressed mouse-button-state)
                            (x :int) (y :int)))
  (close            (window))
  (wm-close         (window))
  (menu-destroy     (window)))

;;; These two functions should not be called directly and are called
;;; by ENABLE-EVENT and DISABLE-EVENT. See further below.

(defun register-callback (event)
  (funcall (event-func event)
           (get-callback (event-cb event))))

(defun unregister-callback (event)
  (funcall (event-func event) (null-pointer)))

;;;# Classes
;;;
;;; The WINDOW (top-level windows) and SUB-WINDOW (those pseudo-windows
;;; that live inside top-level windows and have their own GL context)
;;; classes inherit BASE-WINDOW.
;;;
;;; INITIALIZE-INSTANCE has various specialized methods for these 3
;;; classes that take care of accepting a couple of initargs, register
;;; events, create the actual GLUT windows and save the CLOS objects
;;; in *ID->WINDOWS*.

(defclass base-window ()
  ((name :reader name :initarg :name :initform (gensym "GLUT-WINDOW"))
   (id :reader id)
   (events :accessor events :initarg :events :initform nil)))

(defun find-window (name)
  (loop for window across *id->window*
        when (and (not (null window)) (eq (name window) name))
        do (return window)))

(defmacro with-glut-window (window &body body)
  (let ((current-id (gensym)))
    `(let ((,current-id (get-window)))
       (unwind-protect
            (progn
              (glut:set-window (id ,window))
              ,@body)
         (glut:set-window ,current-id)))))

(defmethod initialize-instance :after
    ((w base-window) &key (pos-x -1) (pos-y -1) (height 300) (width 300) title)
  (with-glut-window w
    (glut:position-window pos-x pos-y)
    (glut:reshape-window height width)
    (when title
      (glut:set-window-title title))
    (dolist (event (events w))
      (register-callback event)))
  ;; save window in the *id->window* array
  (when (<= (length *id->window*) (id w))
    (setq *id->window*
          (adjust-array *id->window* (1+ (id w)) :initial-element nil)))
  (setf (aref *id->window* (id w)) w))

(defmethod enable-event ((window base-window) event)
  (with-glut-window window
    (register-callback event))
  (push event (events window)))

(defmethod disable-event ((window base-window) event)
  (with-glut-window window
    (unregister-callback event))
  (setf (events window) (delete event (events window))))

;;;## Top-level Windows

(defclass window (base-window)
   ((title :reader title :initarg :title
           :initform (concatenate 'string (lisp-implementation-type) " "
                                  (lisp-implementation-version)))
    (sub-windows :accessor sub-windows :initform nil)
    icon-title))

(defmethod (setf title) (string (w window))
  (set-window-title string)
  (setf (slot-value w 'title) string))

(defmethod initialize-instance :before ((w window) &key)
  (setf (slot-value w 'id) (glut:create-window "")))

(defmethod initialize-instance :after ((w window) &key)
  (setf (title w) (title w)))

;;;## Sub-windows

(defclass sub-window (base-window)
  ((parent :reader parent)))

(defmethod initialize-instance :before ((w sub-window) &key parent)
  (unless parent
    (error "Must specify a PARENT window."))
  (let ((parent-window (typecase parent
                         (window parent)
                         (symbol (find-window parent)))))
    (check-type parent-window window)
    ;; XXX: check if it's ok to use these default values for
    (setf (slot-value w 'id) (create-sub-window (id parent-window) 0 0 0 0))
    (push w (sub-windows parent-window))))

;;;; For posterity:

;;; "This is quite ugly: OS X is very picky about which thread gets to handle
;;; events and only allows the main thread to do so. We need to run any event
;;; loops in the initial thread on multithreaded Lisps, or in this case,
;;; OpenMCL."

;; #-openmcl
;; (defun run-event-loop ()
;;   (glut:main-loop))

;; #+openmcl
;; (defun run-event-loop ()
;;   (flet ((start ()
;;            (ccl:%set-toplevel nil)
;;            (glut:main-loop)))
;;     (ccl:process-interrupt ccl::*initial-process*
;;                            (lambda ()
;;                              (ccl:%set-toplevel #'start)
;;                              (ccl:toplevel)))))