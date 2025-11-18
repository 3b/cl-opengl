(in-package #:cl-opengl-examples/core)

(declaim (inline deg-to-rad rad-to-deg sf vec))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun sf (x) (coerce x 'single-float)))

(defconstant +pif+ (sf pi))

(defun vec (x y z) (sb-cga:vec (sf x) (sf y) (sf z)))

(defun deg-to-rad (x)
  (typecase x
    (single-float
     (* x (/ +pif+ 180.0)))
    (t (* x (/ +pif+ 180)))))

(defun rad-to-deg (x)
  (typecase x
    (single-float
     (sf (* x (/ 180.0 +pif+))))
    (t (* x (/ 180 +pif+)))))

(defmacro incf-mod-360 (x &optional (increment 1.0))
  `(setf ,x (mod (+ ,x ,increment) 360)))

(declaim (inline rotate* translate))
(defun rotate* (a x y z)
  (sb-cga:rotate-around (vec x y z)
                        (deg-to-rad (sf a))))
(defun translate (x y z)
  (sb-cga:translate* (sf x) (sf y) (sf z)))

(defun frustum (left right bottom top near far)
  (let ((r-l (- (sf right) (sf left)))
        (t-b (- (sf top) (sf bottom)))
        (f-n (- (sf far) (sf near)))
        (2near (* 2 (sf near))))
    (sb-cga:matrix (/ 2near r-l) 0.0 (/ (+ right left) r-l) 0.0
                   0.0 (/ 2near t-b) (/ (+ top bottom) t-b) 0.0
                   0.0 0.0 (- (/ (+ far near) f-n)) (/ (* -2 far near) f-n)
                   0.0 0.0 -1.0 0.0)))

(defun perspective (fovy-degrees aspect z-near z-far)
  (let ((f (float (/ (tan (/ (deg-to-rad fovy-degrees) 2))) 1.0))
        (dz (float (- z-near z-far))))
    (sb-cga:matrix (/ f aspect) 0.0 0.0 0.0
                   0.0 f 0.0 0.0
                   0.0 0.0 (/ (+ z-near z-far) dz) (/ (* 2 z-near z-far) dz)
                   0.0 0.0 -1.0 0.0)))

(defun normal-matrix (mat)
  (declare (optimize speed))
  ;; cofactor (= transpose of adjugate) of upper left 3x3 of mat,
  (check-type mat (simple-array single-float (16)))
  ;; try to help implementations that can't propagate from check-type
  (locally (declare (type (simple-array single-float (16)) mat))
    (let ((a (aref mat 0))
          (b (aref mat 1))
          (c (aref mat 2))
          (d (aref mat 4))
          (e (aref mat 5))
          (f (aref mat 6))
          (g (aref mat 8))
          (h (aref mat 9))
          (i (aref mat 10)))
      (sb-cga:matrix
       (- (* E I) (* H F)) (- (* H C) (* B I)) (- (* B F) (* E C)) 0.0
       (- (* G F) (* D I)) (- (* A I) (* G C)) (- (* D C) (* A F)) 0.0
       (- (* D H) (* G E)) (- (* G B) (* A H)) (- (* A E) (* D B)) 0.0
       0.0 0.0 0.0 1.0))))

(defun normal-matrix3 (mat)
  (declare (optimize speed))
  ;; cofactor (= transpose of adjugate) of upper left 3x3 of mat,
  (check-type mat (simple-array single-float (16)))
  ;; try to help implementations that can't propagate from check-type
  (locally (declare (type (simple-array single-float (16)) mat))
    (let ((a (aref mat 0))
          (b (aref mat 1))
          (c (aref mat 2))
          (d (aref mat 4))
          (e (aref mat 5))
          (f (aref mat 6))
          (g (aref mat 8))
          (h (aref mat 9))
          (i (aref mat 10)))
      (make-array 9 :element-type 'single-float
                    :initial-contents (list
                                       (- (* E I) (* H F))
                                       (- (* G F) (* D I))
                                       (- (* D H) (* G E))

                                       (- (* H C) (* B I))
                                       (- (* A I) (* G C))
                                       (- (* G B) (* A H))

                                       (- (* B F) (* E C))
                                       (- (* D C) (* A F))
                                       (- (* A E) (* D B)))))))

(defun compile-program (vert frag &key verbose)
  (let ((vs (gl:create-shader :vertex-shader))
        (fs (gl:create-shader :fragment-shader))
        (p (gl:create-program)))
    (when verbose
      (format t "program = ~s, ~s, ~s~%" vs fs p))
    (gl:shader-source vs vert)
    (gl:compile-shader vs)
    (when verbose
      (format t " vs status = ~s~%" (gl:get-shader vs :compile-status))
      (format t "   ~s~%" (gl:get-shader-info-log vs)))
    (gl:attach-shader p vs)
    (gl:shader-source fs frag)
    (gl:compile-shader fs)
    (when verbose
      (format t " fs status = ~s~%" (gl:get-shader fs :compile-status))
      (format t "   ~s~%" (gl:get-shader-info-log fs)))
    (gl:attach-shader p fs)
    (gl:link-program p)
    (when verbose
      (format t " link status = ~s~%" (gl:get-program p :link-status))
      (format t "   ~s~%" (gl:get-program-info-log p)))
    (gl:delete-shader vs)
    (gl:delete-shader fs)
    (let ((uh (make-hash-table)))
      (loop with active = (gl:get-program p :active-uniforms)
            for i below active
            for n = (nth-value 2 (gl:get-active-uniform p i))
            for k = (intern (string-upcase n) :keyword)
            for l = (gl:get-uniform-location p n)
            do (when verbose
                 (format t " uniform ~s/~s = ~s (~s) @ ~s~%" i active n k l))
               (setf (gethash k uh) l))
      (when verbose
        (format t " ->~%~{ ~s~%~}" (a:hash-table-alist uh)))
      (list p uh))))

(defun make-vao (data attrib-pointers)
  (let ((vbo (gl:gen-buffer))
        (ibo (gl:gen-buffer))
        (vao (gl:gen-vertex-array)))
    (gl:bind-vertex-array vao)
    (gl:bind-buffer :array-buffer vbo)
    (cffi:with-pointer-to-vector-data (p (first data))
      (%gl:buffer-data :array-buffer (* 4 (length (first data)))
                       p :static-draw))
    (gl:bind-buffer :element-array-buffer ibo)
    (cffi:with-pointer-to-vector-data (p (second data))
      (%gl:buffer-data :element-array-buffer (* 2 (length (second data)))
                       p :static-draw))
    (loop for ap in attrib-pointers
          for (i) = ap
          do (gl:enable-vertex-attrib-array i)
             (apply #'gl:vertex-attrib-pointer ap))
    (gl:bind-vertex-array 0)
    ;; buffers will be kept alive by the VAO even if name is deleted
    (gl:delete-buffers (vector vbo ibo))
    (list vao (length (second data)))))

(defclass core-example ()
  ((programs :reader programs :initform (make-hash-table))
   (vaos :reader vaos :initform (make-hash-table))
   (projection :accessor projection :initform (sb-cga:identity-matrix))
   (view :accessor view :initform (sb-cga:identity-matrix))
   (width :reader width :initform 1)
   (height :reader height :initform 1)
   (now :reader now :initform 0)
   (dt :reader dt :initform 0)
   (api :reader api)))

(defmethod draw :before((e core-example) now)
  (setf (slot-value e 'dt) (- now (shiftf (slot-value e 'now) now))))

(defmethod add-program ((e core-example) name &key vertex fragment verbose)
  (when verbose
    (format t "~&compiling program ~s...~%" name))
  (setf (gethash name (programs e))
        (compile-program vertex fragment :verbose verbose)))

(defmethod use-program ((e core-example) name)
  (gl:use-program (first (gethash name (programs e)))))

(defmacro with-program ((e name) &body body)
  (a:with-gensyms (uniform-hash p)
    `(let* ((,p (gethash ,name (programs ,e)))
            (,uniform-hash (second ,p)))
       (assert ,p () "no program named ~s, or program compile failed" ',name)
       (gl:use-program (first ,p))
       (flet ((uniform-location (name)
                (gethash name ,uniform-hash -1)))
         ,@body))))

(defmethod add-vao((e core-example) name data vertex-format)
  (setf (gethash name (vaos e))
        (make-vao data vertex-format)))

(defmethod draw-vao ((e core-example) name)
  ;; todo: option to specify offset and count instead of drawing whole
  ;; vao?
  (let ((v (gethash name (vaos e))))
    (gl:bind-vertex-array (first v))
    (%gl:draw-elements :triangles (second v) :unsigned-short 0)))

(defmethod init-gl :before ((c core-example))
  (let ((version (gl:get-string :version)))
    (setf (slot-value c 'api)
          ;; emscripten reports "OpenGL ES 3.0 (WebGL 2.0)", but these
          ;; are intended to use the webgl subset in :gles, so not
          ;; being that specific
          (if (a:starts-with-subseq "OpenGL ES " version)
              :gles
              :gl))
    (ecase (api c)
      (:gles (assert (>= (gl:gl3-major-version) 3)))
      ;; fixme: figure out what GL version we actually need, and/or
      ;; check for glsl version
      (:gl (assert (or (> (gl:gl3-major-version) 3)
                       (and (= (gl:gl3-major-version) 3)
                            (>= (gl:gl3-minor-version) 3))))))))

(defmethod shutdown-gl :after ((c core-example))
  (loop for k being the hash-values of (vaos c)
        do (gl:delete-vertex-array (first k)))
  (clrhash (vaos c))
  (loop for k being the hash-values of (programs c)
        do (gl:delete-program (first k)))
  (clrhash (programs c)))

(defmethod reshape ((e core-example) w h)
  (setf (slot-value e 'width) w
        (slot-value e 'height) h)
  (gl:viewport 0 0 w h))
