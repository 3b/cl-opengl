;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; gears.lisp --- Lisp version of gears.c (GLUT Mesa demos).
;;;
;;; Simple program with rotating 3-D gear wheels.

;;; (lispier version)

(in-package #:cl-glut-examples)

;(declaim (optimize (speed 3) (safety 0) (compilation-speed 0) (debug 0)))

(defconstant +pif+ (coerce pi 'single-float))

(defun draw-gear (inner-radius outer-radius width n-teeth tooth-depth)
  "Draw a gear."
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

(defclass gears-window (glut:window)
  ((view-rotx :initform 20.0)
   (view-roty :initform 30.0)
   (view-rotz :initform 0.0)
   gear1 gear2 gear3
   (angle :initform 0.0)
   (count :initform 1)
   (t0 :initform 0))
  (:default-initargs :title "Gears" :mode '(:double :rgb :depth)))

(defmethod glut:display-window :before ((window gears-window))
  (with-slots (gear1 gear2 gear3) window
    (gl:light :light0 :position #(5.0 5.0 10.0 0.0))
    (gl:enable :cull-face :lighting :light0 :depth-test)
    ;; gear 1
    (setq gear1 (gl:gen-lists 1))
    (gl:with-new-list (gear1 :compile)
      (gl:material :front :ambient-and-diffuse #(0.8 0.1 0.0 1.0)) ; red
      (draw-gear 1.0 4.0 1.0 20 0.7))
    ;; gear 2
    (setq gear2 (gl:gen-lists 1))
    (gl:with-new-list (gear2 :compile)
      (gl:material :front :ambient-and-diffuse #(0.0 0.8 0.2 1.0)) ; green
      (draw-gear 0.5 2.0 2.0 10 0.7))
    ;; gear 3
    (setq gear3 (gl:gen-lists 1))
    (gl:with-new-list (gear3 :compile)
      (gl:material :front :ambient-and-diffuse #(0.2 0.2 1.0 1.0)) ; blue
      (draw-gear 1.3 2.0 0.5 10 0.7))
    (gl:enable :normalize)))

(defun print-frame-rate (window)
  "Prints the frame rate every ~5 seconds."
  (with-slots (count t0) window
    (incf count)
    (let ((time (get-internal-real-time)))
      (when (= t0 0)
        (setq t0 time))
      (when (>= (- time t0) (* 5 internal-time-units-per-second))
        (let* ((seconds (/ (- time t0) internal-time-units-per-second))
               (fps (/ count seconds)))
          (format *terminal-io* "~D frames in ~3,1F seconds = ~6,3F FPS~%"
                  count seconds fps))
        (setq t0 time)
        (setq count 0)))))

(defmethod glut:display ((window gears-window))
  (with-slots (view-rotx view-roty view-rotz angle gear1 gear2 gear3)
      window
    (gl:clear :color-buffer :depth-buffer)
    (gl:with-pushed-matrix
      (gl:rotate view-rotx 1 0 0)
      (gl:rotate view-roty 0 1 0)
      (gl:rotate view-rotz 0 0 1)
      (gl:with-pushed-matrix ; gear1
        (gl:translate -3 -2 0)
        (gl:rotate angle 0 0 1)
        (gl:call-list gear1))
      (gl:with-pushed-matrix ; gear2
        (gl:translate 3.1 -2 0)
        (gl:rotate (- (* -2 angle) 9) 0 0 1)
        (gl:call-list gear2))
      (gl:with-pushed-matrix ; gear3
        (gl:translate -3.1 4.2 0.0)
        (gl:rotate (- (* -2 angle) 25) 0 0 1)
        (gl:call-list gear3)))
    (glut:swap-buffers)
    (print-frame-rate window)))

(defmethod glut:idle ((window gears-window))
  (incf (slot-value window 'angle) 2.0)
  (glut:post-redisplay))

(defmethod glut:keyboard ((window gears-window) key x y)
  (declare (ignore x y))
  (case key
    (#\z (incf (slot-value window 'view-rotz) 5.0)
         (glut:post-redisplay))
    (#\Z (decf (slot-value window 'view-rotz) 5.0)
         (glut:post-redisplay))
    (#\Esc (glut:destroy-current-window))))

(defmethod glut:special ((window gears-window) special-key x y)
  (declare (ignore x y))
  (with-slots (view-rotx view-roty) window
    (case special-key
      (:key-up (incf view-rotx 5.0))
      (:key-down (decf view-rotx 5.0))
      (:key-left (incf view-roty 5.0))
      (:key-right (decf view-roty 5.0)))
    (glut:post-redisplay)))

(defmethod glut:reshape ((w gears-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (let ((h (/ height width)))
    (gl:frustum -1 1 (- h) h 5 60))
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (gl:translate 0 0 -40))

(defmethod glut:visibility ((w gears-window) state)
  (case state
    (:visible (glut:enable-event w :idle))
    (t (glut:disable-event w :idle))))

(defun gears ()
  (glut:display-window (make-instance 'gears-window)))
