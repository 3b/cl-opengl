;; Doug Hoyte, March 2007
;; Assignment 2: Molecule Viewer
;; COSC414 with Dr. Alan Paeth, UBC Okanagan

;; This program is distributed under the terms and
;; conditions of the BSD license:
;; http://www.opensource.org/licenses/bsd-license.php

;; This should be ANSI Common Lisp code that uses the OpenGL
;; libraries through the cl-opengl bindings.

;; Tested with SBCL 1.0.3 and the most recent cl-opengl bindings
;; available here: http://common-lisp.net/project/cl-opengl/

;; Usage:
;; $ sbcl --load molview.lisp
;; ...
;; * (molview ethanol)
;; or
;; * (molview (with-open-file ...))

;; Commands:
;; x/X - Rotate molecule around X axis
;; y/Y - Rotate molecule around Y axis
;; z/Z - Rotate molecule around Z axis
;; t/T - Rotate light source around theta
;; p/P - Rotate light source around phi
;; r/R - Increase/decrease red light component
;; g/G - Increase/decrease green light component
;; b/B - Increase/decrease blue light component
;; s/S - Increase/decrease number of sphere slices
;; w   - Toggle "random walk" frame-rate testing mode
;; m   - Toggle solid sphere vs wire sphere
;; l   - Toggle showing light source


;; We depend on cl-glut (which depends on cl-opengl and cffi)
;;(require :cl-glut)

(defpackage #:cl-glut-examples-molview
  (:use :cl)
  (:import-from #:cl-glut-examples
                #:molview)
  (:export #:molview
           #:ethanol
           #:water))
(in-package #:cl-glut-examples-molview)

;; Hard-coded molecules

(alexandria:define-constant water
  '((O  0.000 0.000 0.000)
    (H -0.900 0.000 0.000)
    (H  0.000 1.000 0.000))
  :test 'equal)

(alexandria:define-constant ethanol
  '((C -0.426  -0.115  -0.147)
    (O -0.599   1.244  -0.481)
    (H -0.750  -0.738  -0.981)
    (H -1.022  -0.351   0.735)
    (H -1.642   1.434  -0.689)
    (C  1.047  -0.383   0.147)
    (H  1.370   0.240   0.981)
    (H  1.642  -0.147  -0.735)
    (H  1.180  -1.434   0.405))
  :test 'equal)



;; Variables/Constants

(defconstant spin-speed 5)
(defvar slices 40)    ; number of hori/verti slices on spheres
(defvar model-type 'solid)
(defvar curr-mol)
(defvar view-rotx 20)
(defvar view-roty 30)
(defvar view-rotz 0)
(defvar show-light-source nil)
(defvar light-theta 0)
(defvar light-phi 0)
(defvar light-dist 5)
(defconstant light-spin-speed .0872664625) ; 5 degrees in radians
(defvar light-r .8)
(defvar light-g .8)
(defvar light-b .8)
(defconstant light-colour-vel .1)
(defvar walk-mode nil)



;; Main function

(defun molview (&optional (mol ethanol))
  (setq curr-mol mol)
  (glut:display-window (make-instance 'mol-window)))


;; Our molecule viewer class

(defclass mol-window (glut:window)
  ()
  (:default-initargs :title "Doug Hoyte - Molecule Viewer"
                     :width 500 :height 500 :mode '(:double :rgb :depth)))


(defun draw-light-source ()
  (gl:with-pushed-matrix
    (gl:material :front :ambient (vector light-r light-g light-b 1))

    (gl:translate (* light-dist (cos light-theta) (sin light-phi))
                  (* light-dist (sin light-theta) (sin light-phi))
                  (* light-dist (cos light-phi)))

    (glut:solid-sphere 0.1 20 20)))

(defun draw-atom (element x y z)
  (gl:with-pushed-matrix
    (gl:rotate view-rotx 1 0 0)
    (gl:rotate view-roty 0 1 0)
    (gl:rotate view-rotz 0 0 1)

    (gl:material :front :ambient-and-diffuse
      (case element
        ((H) #(0.8 0.8 0.8 1))
        ((O) #(0.8 0.1 0.0 1))
        ((C) #(0.2 0.2 0.2 1))))

    (gl:translate x y z)
    (funcall
      (if (eq model-type 'wire) #'glut:wire-sphere #'glut:solid-sphere)
      (case element
        ((H) 0.7)
        ((O) 1.0)
        ((C) 1.2))
      slices slices)))

(defmethod glut:display ((window mol-window))
  (gl:clear :color-buffer-bit :depth-buffer-bit)
  (gl:light :light0 :position (vector (* light-dist (cos light-theta) (sin light-phi))
                                      (* light-dist (sin light-theta) (sin light-phi))
                                      (* light-dist (cos light-phi))
                                      0))
  (gl:light :light0 :diffuse (vector light-r light-g light-b 1))
  (gl:enable :cull-face :lighting :light0 :depth-test)
  (if show-light-source (draw-light-source))
  (dolist (a curr-mol)
    (apply #'draw-atom a))
  (glut:swap-buffers))

(defmethod glut:reshape ((w mol-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (let ((h (/ height width)))
    (gl:frustum -1 1 (- h) h 9 50))
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (gl:translate 0 0 -40))



;; Input methods

(defmacro lim-between (sym bot top)
  `(setq ,sym (max ,bot (min ,top ,sym))))

(defmethod glut:keyboard ((window mol-window) key x y)
  (declare (ignore x y)) 
  (case key
    (#\x (incf view-rotx spin-speed))
    (#\X (decf view-rotx spin-speed))
    (#\y (incf view-roty spin-speed))
    (#\Y (decf view-roty spin-speed))
    (#\z (incf view-rotz spin-speed))
    (#\Z (decf view-rotz spin-speed))

    (#\t (incf light-theta light-spin-speed))
    (#\T (decf light-theta light-spin-speed))
    (#\p (incf light-phi light-spin-speed))
    (#\P (decf light-phi light-spin-speed))

    (#\r (incf light-r light-colour-vel))
    (#\R (decf light-r light-colour-vel))
    (#\g (incf light-g light-colour-vel))
    (#\G (decf light-g light-colour-vel))
    (#\b (incf light-b light-colour-vel))
    (#\B (decf light-b light-colour-vel))

    (#\w (if walk-mode
           (glut:disable-event window :idle)
           (glut:enable-event window :idle))
         (setq walk-mode (not walk-mode)))

    (#\m (setq model-type (if (eq model-type 'wire) 'solid 'wire)))

    (#\s (incf slices))
    (#\S (decf slices))

    (#\l (setq show-light-source (not show-light-source))) 

    (#\q (glut:destroy-current-window)
         (return-from glut:keyboard))
    (#\escape
     (glut:destroy-current-window)
     (return-from glut:keyboard)))

  (lim-between light-r 0 1)
  (lim-between light-g 0 1)
  (lim-between light-b 0 1)

  (lim-between slices 1 100)
  
  (glut:post-redisplay))

(defvar origclick)
(defvar origrot)

(defmethod glut:mouse ((window mol-window) button state x y)
  (if (eq button :left-button)
    (if (eq state :down)
      (progn (setf origrot (list view-rotx view-roty))
             (setf origclick (list x y)))
      (setf origclick ()))))

(defmethod glut:motion ((window mol-window) x y)
  (setf view-rotx (+ (car origrot) (- y (cadr origclick))))
  (setf view-roty (+ (cadr origrot) (- x (car origclick))))
  (glut:post-redisplay))


(defun random-interval (bot top)
  (+ (* (- top bot) (/ (random 100000) 100000.0)) bot))

(defvar view-rotx-vel 0)
(defvar view-roty-vel 0)
(defvar view-rotz-vel 0)

(defvar last-update 0)
(defvar counter 0)

(defmethod glut:idle ((window mol-window))
  (if walk-mode
    (progn
      (incf counter)

      (if (< (+ last-update internal-time-units-per-second) (get-internal-real-time))
        (progn
          (format t "~a frames per second with ~a slices.~%" counter slices)
          (setq counter 0)
          (setq last-update (get-internal-real-time))))

      (incf view-rotx-vel (random-interval -.1 .1))
      (incf view-roty-vel (random-interval -.1 .1))
      (incf view-rotz-vel (random-interval -.1 .1))
      (lim-between view-rotx-vel -2 2)
      (lim-between view-roty-vel -2 2)
      (lim-between view-rotz-vel -2 2)
      (incf view-rotx view-rotx-vel)
      (incf view-roty view-roty-vel)
      (incf view-rotz view-rotz-vel)

      (incf light-r (random-interval -.02 .02))
      (incf light-g (random-interval -.02 .02))
      (incf light-b (random-interval -.02 .02))
      (lim-between light-r 0 1)
      (lim-between light-g 0 1)
      (lim-between light-b 0 1)))
  (glut:post-redisplay))
