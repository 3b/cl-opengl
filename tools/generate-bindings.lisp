;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; generate-funcs.lisp --- generate CFFI bindings from gl.xml file.
;;;
;;; Copyright (c) 2013, Bart Botta  <00003b@gmail.com>
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
;;;

(require :asdf)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-systems 'alexandria 'cl-ppcre 'split-sequence
                     'cxml 'xpath 'cxml-stp
                     'cl-json))

(defvar *base-dir* (make-pathname :directory (pathname-directory
                                              (or *compile-file-pathname*
                                                  *load-pathname*))))

(defparameter *in-package-name* "cl-opengl-bindings")
(defparameter *package-nicknames* "#:%gl")
(defparameter *core-definer* "defglfun")
(defparameter *ext-definer* "defglextfun")
(defparameter *bitfields-in-glenum* t)
(defparameter *all-enums-in-glenum* t)

;; read from data files
(defparameter *glext-version* nil)
(defparameter *glext-last-updated* nil)
(defparameter *glext-git-sha* nil)

;; not sure if we should export all defined types or just specific types?
(defparameter *exported-enums*
  '("AttribMask" "ClearBufferMask" "ClientAttribMask" "BufferAccessMask"))
(defparameter *exported-types*
  '("char" "char-arb" "intptr" "sizeiptr" "intptr-arb" "sizeiptr-arb"
    "handle-arb" "half" "half-arb" "half-nv" "int64" "uint64" "clampd" "double"
    "clampf" "float" "sizei" "uint" "ushort" "ubyte" "int" "short" "byte"
    "void" "bitfield" "boolean" #| "enum" |# "string" "int64-ext" "uint64-ext"))
(defparameter *export-types-by-hand* t)


(defmacro add-dashes-by-regex (regex str &optional exceptions)
  ;; macro so we don't miss ppcre compiler macros on the regex
  (let ((r1 (gensym "R1"))
        (r2 (gensym "R2"))
        (match (gensym)))
    `(cl-ppcre:regex-replace-all
      ,regex
      ,str
      (lambda (,match ,r1 ,r2)
        (declare (ignorable ,match))
        ,@(if exceptions
              `((if (cl-ppcre:scan ,exceptions ,match)
                    ,match
                    (format nil "~A-~A" ,r1 ,r2)))
              `((format nil "~A-~A" ,r1 ,r2))))
      :simple-calls t)))

(defun split-vendor-extensions (str)
  (add-dashes-by-regex
   "(.*)((?:3DFX|3DL|AMD|APPLE|ARB|ATI|EXT|GREMEDY|HP|I3D|IBM|INGR|INTEL|MESA|NV|OES|OML|PGI|REND|S3|SGI|SGIS|SUN|WIN)X?$)"
   str))

(defun split-misc-prefix (str)
  (add-dashes-by-regex
   "^(VDPAU)(.*)"
   str))

(defun remove-gl-prefix (str)
  (if (equal 2 (mismatch str "gl"))
      (subseq str 2)
      str))

(defun mixedcaps->lcdash (str)
  (string-downcase
   ;; we split on caps and numbers after a lower case letter, but
   ;; need to watch out for the 2x2 style matrix size type
   ;; suffixes, so split in 2 steps
   (add-dashes-by-regex
    "([a-z])([A-Z])"
    (add-dashes-by-regex "((?:[^2-4][a-z])|[2-4][a-wyz])([0-9]+)"
                         (split-misc-prefix
                          (split-vendor-extensions
                           (remove-gl-prefix str)))
                         "i64|ui64|i64v|ui64v"))))

(defun convert-enum-name (name)
  (when (and name (string/= name ""))
    (intern (string-upcase (substitute #\- #\_ (subseq name 3)))
            :keyword)))

(defun read-name-map (gl-dir)
  "load name mapping from previously generated funcs-*.lisp"
  ;; maintaining a bunch of heuristics and special cases to split up
  ;; the C names seems inefficient, since they have to be checked by
  ;; hand after every update anyway, so just edit them by hand when
  ;; the trivial mapping doesn't work.
  ;; doesn't seem to be any point in storing a separate file for the names
  ;; when they are easily read from the generated bindings...
  (loop with hash = (make-hash-table :test 'equal)
        for funcs-file in (directory (merge-pathnames "funcs*.lisp" gl-dir))
        do (with-open-file (in funcs-file)
             (loop for i = (read in nil in)
                   until (eq i in)
                   when (and (consp i) (member (car i) '(defglfun defglextfun)))
                     do (setf (gethash (first (second i)) hash)
                              (second (second i)))))
        finally (return hash)))

(defun read-known-types (gl-dir)
  "get list of known types from types.lisp"
  ;; similar to name mapping, we don't try to translate types automatically,
  ;; just detect when there are new ones that need added by hand...
  (with-open-file (in (merge-pathnames "types.lisp" gl-dir))
    (loop for i = (read in nil in)
          until (eq i in)
          when (and (consp i) (member (car i) '(defctype defcstruct)))
            collect (second i))))


(defun load-bindings (gl-dir)
  ;; fixme: probably should combine this with read-name-map?
  (loop with hash = (make-hash-table :test 'equal)
        for funcs-file in (directory (merge-pathnames "funcs-*.lisp" gl-dir))
        for filename = (enough-namestring funcs-file (truename gl-dir))
        do (format t "~s -> ~s~%" funcs-file filename)
           (with-open-file (in funcs-file)
                (loop for i = (read in nil in)
                      until (eq i in)
                      when (and (consp i) (member (car i) '(defglfun defglextfun)))
                        do (setf (gethash (first (second i)) hash)
                                 (list filename i))))
        finally (return hash)))

(defun load-enums (gl-dir)
  (with-open-file (in (merge-pathnames "constants.lisp" gl-dir))
    (alexandria:alist-hash-table
     (loop for i = (read in nil in)
           until (eq i in)
           when (and (consp i) (member (car i) '(defbitfield defcenum)))
             collect (cons (second i) i))
     :test 'equal)))


(defparameter *base-types*
  '(("int"            . ":int")
    ("unsigned int"   . ":unsigned-int")
    ("char"           . ":char")
    ("signed char"    . ":char")
    ("unsigned char"  . ":unsigned-char")
    ("ptrdiff_t"      . ":unsigned-long")
    ("short"          . ":short")
    ("unsigned short" . ":unsigned-short")
    ("float"          . ":float")
    ("double"         . ":double")
    ("void"           . ":void")
    ("string"           . "string")
    ;; special cases
    ("GLenum" . "enum")))

(defun translate-type-name (type &optional offset-or-pointer)
  (setf type (string-trim '(#\space #\tab) type))
  (cond
    ((or (not type) (string= type "")) (error "got empty type?"))
    ((cdr (assoc type *base-types* :test 'equal)))
    ((eql (mismatch type "const ") 6)
     (translate-type-name (subseq type 6) offset-or-pointer))
    ((string= "const" type :start2 (- (length type) 5))
     (translate-type-name (subseq type 0 (- (length type) 5)) offset-or-pointer))
    ((string= "*" type :start2 (- (length type) 1))
     (if offset-or-pointer
         "offset-or-pointer"
         (format nil "(:pointer ~a)"
                 (translate-type-name (subseq type 0 (- (length type) 1)) nil))))
    (offset-or-pointer
     (error "offset or pointer for non-pointer type? ~s~%" type))
    ((string= type "GL" :end1 2)
     (string-downcase
      ;; we split on caps and numbers after a lower case letter, but
      ;; need to watch out for the 2x2 style matrix size type
      ;; suffixes, so split in 2 steps
      (add-dashes-by-regex
       "([a-z])([A-Z])"
       (split-misc-prefix
        (split-vendor-extensions (subseq type 2))))))
    ((and (> (length type) 7) (string= type "struct " :end1 7))
     ;; probably should handle struct types better...
     (mixedcaps->lcdash (subseq type 7)))
    (t
     (error "couldn't translate type name ~s?" type))))



;;; some functions optionally use 'pointer' fields as offsets, and
;;; passing offsets as pointers is apparently inefficient on some lisps,
;;; so add special cases for those functions to allow passing integers
;;; or pointers
(defparameter *pointer-is-offset-functions*
  ;; name . list of pointer/offset args (0-based)
  `(("glVertexAttribPointer" 5)
    ("glVertexAttribIPointer" 4)
    ("glVertexAttribLPointer" 4)
    ("glReadPixels" 6)
    ("glTexImage1D" 7)
    ("glTexImage2D" 8)
    ("glTexImage3D" 9)
    ("glGetTexImage" 4)
    ("glTexSubImage1D" 6)
    ("glTexSubImage2D" 8)
    ("glTexSubImage3D" 10)
    ("glCompressedTexImage1D" 6)
    ("glCompressedTexImage2D" 7)
    ("glCompressedTexImage3D" 8)
    ("glCompressedTexSubImage1D" 6)
    ("glCompressedTexSubImage2D" 8)
    ("glCompressedTexSubImage3D" 10)
    ("glGetCompressedTexImage" 2)
    ("glDrawArraysIndirect" 1)
    ("glDrawElementsIndirect" 2)
    ("glMultiDrawArraysIndirect" 1)
    ("glMultiDrawElementsIndirect" 2)
    ("glDrawElements" 3)
    ("glDrawRangeElements" 5)
    ("glDrawElementsInstanced" 3)
    ("glDrawElementsBaseVertex" 3)
    ("glDrawRangeElementsBaseVertex" 5)
    ("glDrawElementsInstancedBaseVertex" 3)
    ;;MultiDrawElements  = real pointer to offsets
    ;;MultiDrawElementsBaseVertex = real pointer to offsets

    ;; old/deprecated stuff
    ("glBitmap" 6)
    ("glColorPointer" 3)
    ("glColorSubTable" 5)
    ("glColorTable" 5)
    ("glConvolutionFilter1D" 5)
    ("glConvolutionFilter2D" 6)
    ("glDrawPixels" 4)
    ("glEdgeFlagPointer" 1)
    ("glFogCoordPointer" 2)
    ("glGetColorTable" 3)
    ("glGetConvolutionFilter" 3)
    ("glGetHistogram" 4)
    ("glGetMinmax" 4)
    ("glGetPixelMapfv" 1)
    ("glGetPixelMapuiv" 1)
    ("glGetPixelMapusv" 1)
    ("glGetPolygonStipple" 0)
    ("glGetSeparableFilter" 3 4 5)
    ("glIndexPointer" 2)
    ("glNormalPointer" 2)
    ("glPixelMapfv" 2)
    ("glPixelMapuiv" 2)
    ("glPixelMapusv" 2)
    ("glPolygonStipple" 0)
    ("glSecondaryColorPointer" 3)
    ("glSeparableFilter2D" 6 7)
    ("glTexCoordPointer" 3)
    ("glVertexPointer" 3)
    ;; todo: extensions?
    ))



(defun hex (str)
  (if (and (> (length str) 2)
           (string-equal str "0x" :end1 2 ))
      (parse-integer str :radix 16 :start 2)
      (parse-integer str :radix 10)))

(defmacro sv (x n)
  (let ((s (gensym)))
    `(let ((,s (string-trim
                '(#\space #\tab #\newline #\return)
                (xpath:string-value (xpath:evaluate ,x ,n)))))
       (unless (string= ,s "") ,s))))

(defun json (json &rest path)
  (loop for p in path
        do (setf json (cdr (assoc p json))))
  json)

(defun get-type (node)
  (string-trim '(#\space #\tab #\newline #\return)
               (apply 'concatenate 'string (mapcar 'xpath:string-value (xpath:all-nodes (xpath:evaluate "text()|ptype" node))))))


(let* ((this-dir *base-dir*)
       (relative-gl (make-pathname :directory '(:relative :up "gl")))
       (gl-dir (merge-pathnames relative-gl this-dir))
       (relative-spec (make-pathname :directory '(:relative :up "spec")))
       (spec-dir (merge-pathnames relative-spec this-dir))
       (binding-package-file (merge-pathnames "bindings-package.lisp" gl-dir))
       (enums-file (merge-pathnames "constants.lisp" gl-dir))
       (name-map (read-name-map gl-dir))
       (types (read-known-types gl-dir))
       (gl.xml (cxml:parse-file (merge-pathnames "gl.xml" spec-dir)
                                (cxml:make-whitespace-normalizer
                                 (stp:make-builder))))
       (copyright (xpath:string-value
                   (xpath:evaluate "/registry/comment" gl.xml)))
       (groups (make-hash-table :test 'equal))
       (bitfields (make-hash-table :test 'equal))
       (enums (make-hash-table :test 'equal))
       (funcs (make-hash-table :test 'equal))
       (function-apis (make-hash-table :test 'equal))
       (old-bindings (load-bindings gl-dir))
       (old-enums (load-enums gl-dir)))

  ;; remove some other text from the comment if present
  (let ((s (search "This file, gl.xml, is the OpenGL and OpenGL API Registry."
                   copyright)))
    (when s (setf copyright (string-trim '(#\space #\tab #\newline #\return)
                                         (subseq copyright 0 s)))))
  ;; make sure we still have a copyright notice
  (assert (search "Copyright" copyright))

  ;; read version info
  (let* ((github-info (json:decode-json-from-source
                       (merge-pathnames "github-info.json" spec-dir)))
         (date (json github-info :commit :author :date))
         (sha (json github-info :sha)))
    (setf *glext-version* (subseq (remove #\- date) 0 8))
    (setf *glext-last-updated* date)
    (setf *glext-git-sha* sha))

  ;; extract types
  (xpath:do-node-set (node (xpath:evaluate "/registry/types/type[name and not(apientry)]" gl.xml))
    (let ((name (xpath:string-value (xpath:evaluate "name" node))))
      (unless (or (find (string-upcase (translate-type-name name)) types
                        :test 'string=)
                  (find name *base-types* :key 'car :test 'string=))
        (format t "new type ~s : (defctype ~(~s~) ~s) ~%"
                name
                (string-upcase (translate-type-name name))
                (xpath:string-value (xpath:evaluate "text()" node))))))

  ;; extract groups
  (xpath:do-node-set (node (xpath:evaluate "/registry/groups/group" gl.xml))
    (let ((name (xpath:string-value (xpath:evaluate "@name" node))))
      (let ((groups (alexandria:ensure-gethash name groups
                                               (make-hash-table :test 'equal))))
        (flet ((add (k -bit)
                 (setf (gethash k groups) (or -bit k))))
          (xpath:do-node-set (e (xpath:evaluate "enum" node))
            (let ((n (convert-enum-name (xpath:string-value
                                         (xpath:evaluate "@name" e)))))
              ;; add an alias without the -bit suffix if any
              ;; (should we strip -bit before a vendor suffix also?
              ;;  for example :2x-bit-ati -> :2x-ati?)
              (when (cl-ppcre:scan "-BITS?$" (string n))
                (add (intern (or (cl-ppcre:register-groups-bind (a)
                                     ("(.*)-BITS?$" (string n))
                                   a)
                                 "???")
                             :keyword)
                     n))
              (add n nil)))))))

  ;; extract bitfields
  (xpath:do-node-set (node (xpath:evaluate "/registry/enums[@type=\"bitmask\"]" gl.xml))
    (let ((group (xpath:string-value (xpath:evaluate "@group" node))))
      (let ((enums (alexandria:ensure-gethash group bitfields
                                              (make-hash-table :test 'equal)))
            ;; optionally add to main 'GLenum' enum as well for back compat
            (%enums (alexandria:ensure-gethash "enum" enums (make-hash-table :test 'equal))))
        (flet ((add (k v -bit)
                 (when (and (gethash k enums)
                            (/= v (gethash k enums)))
                   (format t "duplicate enum ~s / ~s = ~s, ~s?~%"
                           group k v (gethash k enums)))
                 (when (and *bitfields-in-glenum* (not (eq enums %enums))
                            (not -bit))
                   (setf (gethash k %enums) v))
                 (setf (gethash k enums) v)))
          (xpath:do-node-set (e (xpath:evaluate "enum" node))
            (let ((n (convert-enum-name (xpath:string-value
                                         (xpath:evaluate "@name" e))))
                  (v (hex (xpath:string-value (xpath:evaluate "@value" e)))))
              ;; add an alias without the -bit suffix if any
              ;; (should we strip -bit before a vendor suffix also?
              ;;  for example :2x-bit-ati -> :2x-ati?)
              (when (cl-ppcre:scan "-BITS?$" (string n))
                (add (intern (or (cl-ppcre:register-groups-bind (a)
                                     ("(.*)-BITS?$" (string n))
                                   a)
                                 "???")
                             :keyword)
                     v t))
              (add n v nil)))))))

  ;; extract enum values
  (xpath:do-node-set (node (xpath:evaluate "/registry/enums[not (@type) or (@type!=\"bitmask\")]" gl.xml))
    (let ((group (xpath:string-value (xpath:evaluate "@group" node))))
      (when (or (not group) (string= group "") (string= group "SpecialNumbers"))
        (setf group "enum"))
      (let ((enums (alexandria:ensure-gethash group enums (make-hash-table :test 'equal)))
            ;; optionally add to main 'GLenum' enum as well for back compat
            (%enums (alexandria:ensure-gethash "enum" enums (make-hash-table :test 'equal))))
        (flet ((add (k v)
                 (when (and (gethash k enums)
                            (/= v (gethash k enums)))
                   (format t "duplicate enum ~s = ~s, ~s?~%" k v (gethash k enums)))
                 (when (and *all-enums-in-glenum* (not (eq enums %enums)))
                   (setf (gethash k %enums) v))
                 (setf (gethash k enums) v)))
          (xpath:do-node-set (e (xpath:evaluate "enum" node))
            (let ((n (convert-enum-name (xpath:string-value
                                         (xpath:evaluate "@name" e))))
                  (v (hex (xpath:string-value (xpath:evaluate "@value" e)))))
              (add n v)))))))

  ;; update values of bitfields with missing bits
  (loop for gn in (alexandria:hash-table-keys groups)
        for e = (gethash gn enums)
        for b = (gethash gn bitfields)
        for g = (gethash gn groups)
        unless (or e b)
          do (format t "group ~s defined without enum def?~%" gn)
        when b
          do (let ((n (alexandria:hash-table-keys b))
                   (o (alexandria:hash-table-keys g)))
               (unless (and (null (set-difference n o))
                            (null (set-difference o n)))
                 (format t "mismatch between group and bitfield definition: ~s~% +~s~% -~s)~%"
                         gn
                         (set-difference n o)
                         (set-difference o n)))
               (when (set-difference o n)
                 (assert *all-enums-in-glenum*)
                 (format t "fix ~s~%" n)
                 (loop with ee = (gethash "enum" enums)
                       for k in (alexandria:hash-table-keys g)
                       for v = (or (gethash k ee)
                                   (gethash (gethash k g) ee))
                       unless (gethash k b)
                         do (format t "  ~s -> ~s~%" k v)
                            (setf (gethash k b) v)))))
  (format t "check enums~%")
  (loop for e in (alexandria:hash-table-keys enums)
        unless (gethash e groups)
          do (format t "enum ~s defined without group def?~%" e))
  (format t "check bitfield~%")
  (loop for b in (alexandria:hash-table-keys bitfields)
        unless (gethash b groups)
          do (format t "bitfield ~s defined without group def?~%" b))


  ;; extract functions
  (xpath:do-node-set (node (xpath:evaluate "/registry/commands/command" gl.xml))
    (let* ((proto (xpath:first-node (xpath:evaluate "proto" node)))
           (name (sv "name" proto))
           (ret (if (equalp (sv "@group" proto) "String")
                    "string"
                    (get-type proto)))
           (args (xpath:map-node-set->list
                  (lambda (p)
                    (list* :name (let ((n (sv "name" p)))
                                   (if (string-equal n "t") "tee" n))
                           :type (get-type p)
                           (let ((g (sv "@group" p)))
                             (when (and g (string/= g ""))
                               (list :group g)))))
                  (xpath:evaluate "param" node))))
      (flet ((add (k v)
               (when (and (gethash k funcs)
                          (not (equalp v (gethash k funcs))))
                 (format t "duplicate func ~s =~%  ~s,~%  ~s?~%" k v (gethash k funcs)))
               (setf (gethash k funcs) v)))
        (add name (cons ret args)))))

  ;; load special cases
  (with-open-file (special (merge-pathnames "special-cases.lisp" this-dir))
    (loop for x = (read special nil special)
          until (eq x special)
          do (case (first x)
               (:bitfield
                (loop with name = (second x)
                      with hash = (alexandria:ensure-gethash
                                   name
                                   bitfields
                                   (make-hash-table :test 'equal))
                      for (k v) in (cddr x)
                      do (setf (gethash k hash) v)))
               (:enum
                (loop with name = (second x)
                      with hash = (alexandria:ensure-gethash
                                   name
                                   enums
                                   (make-hash-table :test 'equal))
                      for (k v) in (cddr x)
                      when (and (consp v) (eq (car v) :import))
                        do (setf v (gethash k (gethash (second v) enums v)))
                      do (setf (gethash k hash) v)))
               (:func
                (setf (gethash (second x) funcs)
                      (cddr x))))))

  ;; figure out which APIs (GL,ES1,ES2) include which functions
  (let ((x 0))
    (flet ((add (node apis ext api-ver)
             (setf apis (alexandria:ensure-list apis))
             ;; fixme: probably should just walk this by nodes instead
             ;; of doing a bunch of xpath to grab the children...
             (xpath:do-node-set (require (xpath:evaluate
                                          "./require[command]" node))
               (xpath:do-node-set (command (xpath:evaluate "command"
                                                           require))
                 (let ((name (sv "@name" command)))
                   (loop for api in apis
                         do (push (if ext
                                      (list api :ext ext)
                                      (list api))
                                  (getf (gethash name function-apis nil)
                                        :api)))
                   (unless (getf (gethash name function-apis nil)
                                 :order)
                     (setf (getf (gethash name function-apis nil)
                                 :order)
                           (incf x)))
                   (when api-ver
                     (push api-ver (getf (gethash name function-apis nil)
                                         :api-version))
                     (when (and (member :gl apis)
                                (or (string= api-ver "1.0")
                                    (string= api-ver "1.1")))
                       (setf (getf (gethash name function-apis nil)
                                   :definer)
                             *core-definer*))))))))
      (xpath:do-node-set (feature (xpath:evaluate "/registry/feature" gl.xml))
        (let ((api (sv "@api" feature))
              (api-number (sv "@number" feature)))
          (add feature (intern (string-upcase api) :keyword) nil api-number)))
      (xpath:do-node-set (ext (xpath:evaluate "/registry/extensions/extension"
                                              gl.xml))
        (add ext
             (mapcar (lambda (a) (intern (string-upcase a) :keyword))
                     (split-sequence:split-sequence
                      #\| (or (sv "@supported" ext) "GL")))
             (sv "@name" ext)
             nil))))

  ;; write files
  (when t
    (with-open-file (out enums-file :direction :output :if-exists :supersede)
      (format out ";;; this file is automatically generated, do not edit~%")
      (format out "(in-package #:cl-opengl-bindings)~%~%")
      (loop for (name . hash) in (sort (alexandria:hash-table-alist bitfields)
                                       'string< :key 'car)
            do ;; existing bitfields are named without #\-, so keep them that
               ;; way in case anyone used them directly...
               (format out "(defbitfield (~a :unsigned-int)" name)
               (loop for (k . v) in (sort (alexandria:hash-table-alist hash)
                                          '< :key 'cdr)
                     do (format out "~%  (:~(~a~) #x~x)" k v))
               (format out ")~%~%"))
      (loop for (name . hash) in (sort (alexandria:hash-table-alist enums)
                                       'string< :key 'car)
            do (format out "(defcenum (~a :unsigned-int)"
                       (mixedcaps->lcdash name))
               (loop for (k . v) in (sort (alexandria:hash-table-alist hash)
                                          'string< :key 'car)
                     do (format out "~%  (:~(~a~) #x~x)" k v))
               (format out ")~%~%"))))

  (let ((files nil))
    (flet ((name (v)
             (format nil "funcs~{~^-~(~a~)~}.lisp"
                     (sort (delete-duplicates
                            (mapcar 'first
                                    (getf v :api))
                            :test 'string=)
                           'string<))))
      (loop for (k . v) in (sort (alexandria:hash-table-alist function-apis)
                                 '< :key (lambda (a) (getf (cdr a) :order)))
            for n = (name v)
            for f = (assoc n files :test 'string=)
            do (if f
                   (push (list k (or (getf v :definer) *ext-definer*)) (cdr f))
                   (setf files (acons n (list (list k (or (getf v :definer)
                                                          *ext-definer*)))
                                      files))))

      (loop for (filename . file-funcs) in files
            for path = (merge-pathnames filename gl-dir)
            do (format t "~&writing functions to file ~s~%" path)
            do (with-open-file (out path :direction :output
                                         :if-exists :supersede)
                 (format out ";;; this file is automatically generated, do not edit~%")
                 (format out ";;; generated from files with the following copyright:~%;;;~%")
                 (with-input-from-string (c copyright)
                   (loop for l = (read-line c nil nil)
                         while l
                         do (if (string= l "")
                                (format out ";;;~%")
                                (format out ";;; ~a~%" l))))
                 ;; todo: break these up into separate packages?
                 (format out "~%(in-package #:cl-opengl-bindings)~%~%")

                 (format out "~{;;; generated ~d-~2,'0d-~2,'0dT~2,'0d:~2,'0d:~2,'0dZ~%~}"
                         (cdddr (reverse (multiple-value-list
                                          (decode-universal-time
                                           (get-universal-time) 0)))))
                 (format out ";;; from gl.xml @ git sha ~a, ~a~%~%"
                         *glext-git-sha* *glext-last-updated*)

                 (when (string= filename "funcs-gl-glcore-gles1-gles2-glsc2.lisp")
                   ;; fixme: figure out a better way to make sure this
                   ;; ends up in 1 file common to all APIs
                   (format out "(defparameter *glext-version* ~a)~%" *glext-version*)
                   (format out "(defparameter *glext-last-updated* ~s)~%~%" *glext-last-updated*))
                 (loop for (func definer) in (reverse file-funcs)
                       for (ret . args) = (gethash func funcs)
                       for offset-params
                         = (cdr (assoc func *pointer-is-offset-functions*
                                        :test 'string=))
                       do (format out "(~a (~s ~(~a~)) ~a"
                                  definer
                                  func
                                  (or (gethash func name-map)
                                      (mixedcaps->lcdash func))
                                  (translate-type-name ret))
                          (loop for a in args
                                for i from 0
                                for group = (getf a :group)
                                for type = (getf a :type)
                                for offset-param = (member i offset-params)
                                do (format out "~%  (~a ~a)"
                                           (getf a :name)
                                           (cond
                                             ((position #\* type)
                                              (translate-type-name type offset-param))
                                             ;; fixme: translate enum
                                             ;; and bitfield names
                                             ;; consistently
                                             ((gethash group bitfields) group)
                                             ((gethash group enums)
                                              (mixedcaps->lcdash group))
                                             ((gethash type bitfields) type)
                                             ((gethash type enums)
                                              (mixedcaps->lcdash type))
                                             (t
                                              (translate-type-name type offset-param)))))
                          (format out ")~%~%"))))))


  ;; write package file
  (with-open-file (out binding-package-file :direction :output
                                            :if-exists :supersede)
    (format t "~&;; Writing ~A.~%" (namestring binding-package-file))

    (format out ";;; generated file, do not edit~%")
    (format out ";;; glext version ~a ( ~a )~%~%" *glext-version*
            *glext-last-updated*)
    (format out "(defpackage #:~a~%" *in-package-name*)
    (when *package-nicknames*
      (format out "  (:nicknames ~a)~%" *package-nicknames*))
    (format out "  (:use #:common-lisp #:cffi)~%")
    (format out "  (:shadow #:char #:float #:byte #:boolean #:string)~%")
    (format out "  (:export~%")
    (format out "   #:*glext-version*~%")
    (format out "   #:*glext-last-updated*~%")
    (format out "   #:*gl-get-proc-address*~%")
    (format out "   #:opengl-error~%")
    (format out "   #:check-error~%")
    ;; enums/bitfields
    (format out "   #:enum~%")
    (loop for i in (if *export-types-by-hand*
                       *exported-enums*
                       (sort (alexandria:hash-table-keys bitfields)
                             'string<))
          do (format out "   #:~a~%" i))

    ;; types
    (format out "~%  ;; Types.~% ")
    (loop for type in (if *export-types-by-hand*
                          *exported-types*
                          types)
          do (format out "~(~<~% ~1,69:; #:~A~>~)" type))
    ;; functions
    (format out "~%~%  ;; Functions.~% ")
    (loop for i in (mapcar 'car
                           (sort (alexandria:hash-table-alist function-apis)
                                 '< :key (lambda (a) (getf (cdr a) :order))))
          do (format out "~(~<~% ~1,69:; #:~A~>~)"
                     (or (gethash i name-map)
                         (mixedcaps->lcdash i))))
    (format out "))~%~%"))

  ;; print out changes
  (let ((new-bindings (load-bindings gl-dir))
        (new-enums (load-enums gl-dir)))
    (flet ((eb (x)
             (ecase (first x)
               (defbitfield "bitfield")
               (defcenum "enum"))))
      ;; todo: check for changed types of enums/bitfields? (should
      ;; only be :unsigned-int currently, so not bothering for no)
      (format t "checking for removed enums/bitfields:~%")
      (loop for k being the hash-keys of old-enums using (hash-value v)
            unless (gethash k new-enums)
              do (format t "removed ~a ~s~%" (eb v) k))
      (format t "checking for new or modified enums/bitfields:~%")
      (loop for k1 being the hash-keys of new-enums using (hash-value new-form)
            for old-form = (gethash k1 old-enums nil)
            for k = (if (consp k1) (car k1) k)
            do (cond
                 ((not old-form)
                  (format t "new ~a ~s~%" (eb new-form) k))
                 ((not (eql (car new-form) (car old-form)))
                  (format t "~a ~s changed to ~a~%"
                          (eb old-form) k (eb new-form)))
                 ((not (equal new-form old-form))
                  (let ((removed (set-difference
                                  (mapcar 'first (cddr old-form))
                                  (mapcar 'first (cddr new-form)))))
                    (loop for i in removed
                          do (format t "~a ~s: removed ~s~%"
                                     (eb new-form) k i)))
                  (loop with h = (alexandria:alist-hash-table (cddr old-form))
                        for (name value) in (cddr new-form)
                        for (old-value) = (gethash name h)
                        when (not old-value)
                          do  (format t "~a ~s: added ~s = #x~x~%"
                                     (eb new-form) k name value)
                        else when (/= value old-value)
                        do  (format t "~a ~s: ~s value changed from #x~x to #x~x~%"
                                     (eb new-form) k name old-value value))))))

    (format t "checking for removed bindings:~%")
    (loop for k being the hash-keys of old-bindings
          unless (gethash k new-bindings)
            do (format t "removed binding ~s~%" k))
    (format t "checking for new or modified bindings:~%")
    (loop for k being the hash-keys of new-bindings using (hash-value v)
          for (new-file new-form) = v
          for (old-file old-form) = (gethash k old-bindings nil)
          do (cond
               ((not old-file)
                (format t "+~a ~{~s -> ~s~}~%" new-file (second new-form)))
               ((not (equal new-file old-file))
                (format t "binding ~s moves from ~s to ~s~%"
                        k old-file new-file))
               ((not (equal new-form old-form))
                ;; todo: ignore changes in names of args
                (format t "definition of binding ~s changed:~%from: ~s~%to:   ~s~%" k old-form new-form))))



)

  (force-output)
  nil)
