;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; gears.lisp --- Lisp version of gears.c (GLUT Mesa demos).
;;;
;;; Simple program with rotating 3-D gear wheels.

;;; This is an example using the raw bindings to GLUT and CFFI.
;;; Compare with the CLOS version in gears.lisp

(defpackage #:mesademos-gears-raw
  (:use #:cl)
  (:export #:run))
(in-package #:mesademos-gears-raw)

;(declaim (optimize (speed 3) (safety 0) (compilation-speed 0) (debug 0)))

(defconstant +pif+ (coerce pi 'single-float))

(defun gear (inner-radius outer-radius width n-teeth tooth-depth)
  (declare (single-float inner-radius outer-radius width tooth-depth)
           (fixnum n-teeth))
  (let ((r0 inner-radius)
        (r1 (- outer-radius (/ tooth-depth 2.0)))
        (r2 (+ outer-radius (/ tooth-depth 2.0)))
        (da (/ (* 2.0 +pif+) n-teeth 4.0)))
    (gl:shade-model :flat)
    (gl:normal 0 0 1)
    ;; Draw front face.
    (gl:with-primitives :quad-strip
      (dotimes (i (1+ n-teeth))
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* width 0.5))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* width 0.5))
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* width 0.5))
          (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                     (* r1 (sin (+ angle (* 3 da))))
                     (* width 0.5)))))
    ;; Draw front sides of teeth.
    (gl:with-primitives :quads
      (dotimes (i n-teeth)
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* width 0.5))
          (gl:vertex (* r2 (cos (+ angle da))) (* r2 (sin (+ angle da)))
                     (* width 0.5))
          (gl:vertex (* r2 (cos (+ angle (* 2 da))))
                     (* r2 (sin (+ angle (* 2 da))))
                     (* width 0.5))
          (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                     (* r1 (sin (+ angle (* 3 da))))
                     (* width 0.5)))))
    (gl:normal 0 0 -1)
    ;; Draw back face.
    (gl:with-primitives :quad-strip
      (dotimes (i (1+ n-teeth))
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* width -0.5))
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* width -0.5))
          (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                       (* r1 (sin (+ angle (* 3 da))))
                       (* width -0.5))
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* width -0.5)))))
    ;; Draw back sides of teeth.
    (gl:with-primitives :quads
      (dotimes (i n-teeth)
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                     (* r1 (sin (+ angle (* 3 da))))
                     (* (- width) 0.5))
          (gl:vertex (* r2 (cos (+ angle (* 2 da))))
                     (* r2 (sin (+ angle (* 2 da))))
                     (* (- width) 0.5))
          (gl:vertex (* r2 (cos (+ angle da))) (* r2 (sin (+ angle da)))
                     (* (- width) 0.5))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* (- width) 0.5)))))
    ;; Draw outward faces of teeth.
    (gl:with-primitives :quad-strip
      (dotimes (i n-teeth)
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* width 0.5))
          (gl:vertex (* r1 (cos angle)) (* r1 (sin angle)) (* (- width) 0.5))
          (let* ((u (- (* r2 (cos (+ angle da))) (* r1 (cos angle))))
                 (v (- (* r2 (sin (+ angle da))) (* r1 (sin angle))))
                 (len (sqrt (+ (* u u) (* v v)))))
            (setq u (/ u len))
            (setq v (/ u len))
            (gl:normal v (- u) 0.0)
            (gl:vertex (* r2 (cos (+ angle da))) (* r2 (sin (+ angle da)))
                       (* width 0.5))
            (gl:vertex (* r2 (cos (+ angle da))) (* r2 (sin (+ angle da)))
                       (* (- width) 0.5))
            (gl:normal (cos angle) (sin angle) 0.0)
            (gl:vertex (* r2 (cos (+ angle (* 2 da))))
                       (* r2 (sin (+ angle (* 2 da))))
                       (* width 0.5))
            (gl:vertex (* r2 (cos (+ angle (* 2 da))))
                       (* r2 (sin (+ angle (* 2 da))))
                       (* (- width) 0.5))
            (setq u (- (* r1 (cos (+ angle (* 3 da))))
                       (* r2 (cos (+ angle (* 2 da))))))
            (setq v (- (* r1 (sin (+ angle (* 3 da))))
                       (* r2 (sin (+ angle (* 2 da))))))
            (gl:normal v (- u) 0.0)
            (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                       (* r1 (sin (+ angle (* 3 da))))
                       (* width 0.5))
            (gl:vertex (* r1 (cos (+ angle (* 3 da))))
                       (* r1 (sin (+ angle (* 3 da))))
                       (* (- width) 0.5))
            (gl:normal (cos angle) (sin angle) 0.0))))
      (gl:vertex (* r1 (cos 0)) (* r1 (sin 0)) (* width 0.5))
      (gl:vertex (* r1 (cos 0)) (* r1 (sin 0)) (* (- width) 0.5)))
    ;; Draw inside radius cylinder.
    (gl:shade-model :smooth)
    (gl:with-primitives :quad-strip
      (dotimes (i (1+ n-teeth))
        (let ((angle (/ (* i 2.0 +pif+) n-teeth)))
          (gl:normal (- (cos angle)) (- (sin angle)) 0.0)
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* (- width) 0.5))
          (gl:vertex (* r0 (cos angle)) (* r0 (sin angle)) (* width 0.5)))))))

(declaim (single-float *view-rotx* *view-roty* *view-rotz* *angle*)
         (fixnum *gear1* *gear2* *gear3* *limit* *count* *t0*))
(defvar *view-rotx* 20.0)
(defvar *view-roty* 30.0)
(defvar *view-rotz* 0.0)
(defvar *gear1*)
(defvar *gear2*)
(defvar *gear3*)
(defvar *angle* 0.0)
(defvar *limit*)
(defvar *count* 1)
(defvar *t0* 0)

(cffi:defcallback draw :void ()
  (gl:clear :color-buffer :depth-buffer)
  (gl:push-matrix)
  (gl:rotate *view-rotx* 1 0 0)
  (gl:rotate *view-roty* 0 1 0)
  (gl:rotate *view-rotz* 0 0 1)
  ;; gear 1
  (gl:push-matrix)
  (gl:translate -3 -2 0)
  (gl:rotate *angle* 0 0 1)
  (gl:call-list *gear1*)
  (gl:pop-matrix)
  ;; gear 2
  (gl:push-matrix)
  (gl:translate 3.1 -2 0)
  (gl:rotate (- (* -2 *angle*) 9) 0 0 1)
  (gl:call-list *gear2*)
  (gl:pop-matrix)
  ;; gear 3
  (gl:push-matrix)
  (gl:translate -3.1 4.2 0.0)
  (gl:rotate (- (* -2 *angle*) 25) 0 0 1)
  (gl:call-list *gear3*)
  (gl:pop-matrix)
  ;; ..
  (gl:pop-matrix)
  (glut:swap-buffers)
  ;; Calculating frame rate
  (incf *count*)   ; if count == limit: exit? nahhh
  (let ((time (get-internal-real-time)))
    (declare (fixnum time)) ;  bogus?
    (when (= *t0* 0)
      (setq *t0* time))
    (when (>= (- time *t0*) (* 5 internal-time-units-per-second))
      (let* ((seconds (/ (- time *t0*) internal-time-units-per-second))
             (fps (/ *count* seconds)))
        (format *terminal-io* "~D frames in ~3,1F seconds = ~6,3F FPS~%"
                *count* seconds fps))
      (setq *t0* time)
      (setq *count* 0))))

(cffi:defcallback idle :void ()
  (incf *angle* 2.0)
  (glut:post-redisplay))

(cffi:defcallback key :void ((key :uchar) (x :int) (y :int))
  (declare (ignore x y))
  (case (code-char key)
    (#\z (incf *view-rotz* 5.0))
    (#\Z (decf *view-rotz* 5.0))
    (#\Esc (glut:leave-main-loop)))
  (glut:post-redisplay))

(cffi:defcallback special :void ((key glut:special-keys) (x :int) (y :int))
  (declare (ignore x y))
  (case key
    (:key-up (incf *view-rotx* 5.0))
    (:key-down (decf *view-rotx* 5.0))
    (:key-left (incf *view-roty* 5.0))
    (:key-right (decf *view-roty* 5.0)))
  (glut:post-redisplay))

(cffi:defcallback reshape :void ((width :int) (height :int))
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (let ((h (coerce (/ height width) 'double-float)))
    (gl:frustum -1 1 (- h) h 5 60))
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (gl:translate 0 0 -40))

(defun init ()
  (gl:light :light0 :position #(5.0 5.0 10.0 0.0))
  (gl:enable :cull-face :lighting :light0 :depth-test)
  ;; Make the gears.
  ;; gear 1
  (setq *gear1* (gl:gen-lists 1))
  (gl:new-list *gear1* :compile)
  (gl:material :front :ambient-and-diffuse #(0.8 0.1 0.0 1.0)) ; red
  (gear 1.0 4.0 1.0 20 0.7)
  (gl:end-list)
  ;; gear 2
  (setq *gear2* (gl:gen-lists 1))
  (gl:new-list *gear2* :compile)
  (gl:material :front :ambient-and-diffuse #(0.0 0.8 0.2 1.0)) ; green
  (gear 0.5 2.0 2.0 10 0.7)
  (gl:end-list)
  ;; gear 3
  (setq *gear3* (gl:gen-lists 1))
  (gl:new-list *gear3* :compile)
  (gl:material :front :ambient-and-diffuse #(0.2 0.2 1.0 1.0)) ; blue
  (gear 1.3 2.0 0.5 10 0.7)
  (gl:end-list)
  ;; ..
  (gl:enable :normalize))

(cffi:defcallback visible :void ((visibility glut:visibility-state))
  (if (eq visibility :visible)
      (glut:idle-func (cffi:callback idle))
      (glut:idle-func (cffi:null-pointer))))

(defun run (&optional (limit 0))
  (glut:init)
  (setq *limit* limit)
  (glut:init-display-mode :double :rgb :depth)
  (glut:create-window "Gears")
  (init)
  (glut:display-func (cffi:callback draw))
  (glut:reshape-func (cffi:callback reshape))
  (glut:keyboard-func (cffi:callback key))
  (glut:special-func (cffi:callback special))
  (glut:visibility-func (cffi:callback visible))
  (glut:main-loop))