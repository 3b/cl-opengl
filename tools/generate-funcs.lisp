;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; generate-funcs.lisp --- generate CFFI bindings from .spec files.
;;;
;;; Copyright (c) 2006, Bart Botta  <00003b@gmail.com>
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

#+:sbcl
(require :asdf)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:operate 'asdf:load-op :cl-ppcre)
  (asdf:operate 'asdf:load-op :cffi))

(defpackage #:spec-parser
  (:use #:common-lisp #:cffi #:cl-ppcre)
  (:export #:main))

(in-package #:spec-parser)

;;; use names-like-this (if nil, make names like %glFooBar)
(defparameter *lispy-function-names* t)
(defparameter *define-package* t)
(defparameter *in-package-name* "cl-opengl-bindings")
(defparameter *package-nicknames* "#:%gl")
(defparameter *dump-functions* t)
(defparameter *core-definer* "defglfun")
(defparameter *ext-definer* "defglextfun")

;;; list of names that confuse the regexes, so get renamed by hand
;;; include anything that uses 's' or 'sv' type specifier, or that
;;; ends in 'd' that isn't intended to mean 'double'
(defparameter *special-case-list*
  '(("Rects" . "rect-s")
    ;; ("Rectsv" . "rect-sv")
    ("Indexs" . "index-s")
    ("GlobalAlphaFactorsSUN" . "global-alpha-factor-s-sun")
    ("TexSubImage4DSGIS" . "tex-sub-image-4d-sgis")
    ("TexImage4DSGIS" . "tex-image-4d-sgis")
    ;;("ShaderOp1EXT" . "shader-op-1-ext")
    ;;("ShaderOp2EXT" . "shader-op-2-ext")
    ;;("ShaderOp3EXT" . "shader-op-3-ext")
    ("UniformMatrix2x3fv" . "uniform-matrix-2x3-fv")
    ("UniformMatrix3x2fv" . "uniform-matrix-3x2-fv")
    ("UniformMatrix2x4fv" . "uniform-matrix-2x4-fv")
    ("UniformMatrix4x2fv" . "uniform-matrix-4x2-fv")
    ("UniformMatrix3x4fv" . "uniform-matrix-3x4-fv")
    ("UniformMatrix4x3fv" . "uniform-matrix-4x3-fv")
    ("GetQueryObjecti64vEXT" . "get-query-object-i64v-ext")
    ("GetQueryObjectui64vEXT" . "get-query-object-ui64v-ext")
    ("GetBooleanIndexedvEXT" . "get-boolean-indexed-v-ext")
    ("GetIntegerIndexedvEXT" . "get-integer-indexed-v-ext")))

(defparameter *whole-words*
  '("push" "depth" "mesh" "finish" "flush" "attach" "detach" "through" "width"
    "interleaved" "load" "end" "bind" "named" "grid" "coord" "read" "blend"
    "compressed" "attached" "enabled" "attrib" "multi" "status" "mapped"
    "instanced" "indexed"))

;;; words ending in 's'...
;;; is arrays textures names pixels lists attribs parameters programs
;;; queries fences points maps pos buffers elements renderbuffers
;;; framebuffers status shaders symbols bounds pntriangles
(defun fix-type-suffix (name)
  (cond
    ((string-equal name "nv") name) ; vendor name, not vector
    ((cl-ppcre:scan "^[0-9]N?u?[hbifds]v?$" name) name) ;count+type
    ((member name *whole-words* :test #'string-equal) name)
    ;; fix [1-3]D(EXT|ARB) (TexImage1DEXT etc) (but don't break -3dfx)
    ((cl-ppcre:scan "[1-3]D(EXT|ARB)" name)
     ;; fixme: stop running the regex twice here...
     (cl-ppcre:regex-replace "([1-3]D)(EXT|ARB)" name "\\1-\\2"))
    ;; fix Op1ATI etc from ATI_fragment_shader and Op1EXT from
    ;; ext_vertex_shader
    ((cl-ppcre:scan "[1-3](ATI|EXT)" name)
     (cl-ppcre:regex-replace "([1-3])(EXT|ATI)" name "\\1-\\2"))
    ;; nv-gpu-program4 extension has a bunch of functions with I before the
    ;; type signature, not sure if it should be separate or not,
    ;; leaving it as i4ui etc. for now, but still gets special cased
    ;; since it confuses the main regex...
    ((cl-ppcre:scan "^I[1-4]?[bisuv]+$" name) name)

    (t ; anything else, try to split
     (cl-ppcre:regex-replace-all
      ;;#
      ;;N (normalized VertexAttrib)
      ;;b s i f d ub us ui
      ;;v
      ;; (can't catch the u?i64v? types here, so special case them for now...)
      ;; 's' catches too many plurals, so skipping for now...
      ;; (just rect,index anyway, can special case them...)
      "([a-z][a-tv-z])((?:h|b|i|f|d|ub|us|ui|hv|bv|iv|fv|dv|sv|ubv|usv|uiv|v)|[0-9]+)$"
      name
      (lambda (match r1 r2)
        (declare (ignore match))
        (format nil "~A-~A" r1 r2))
      :simple-calls t))))

;;; TODO: fix special cases.
(defun fix-type-suffixes (name)
  (cl-ppcre:regex-replace-all
   "([^-]+)(-|$)" name
   (lambda (match r1 r2)
     (declare (ignore match))
     (format nil "~A~A" (fix-type-suffix r1) (or r2 "")))
   :simple-calls t))

(defun mixedcaps->lcdash (str)
  (string-downcase
   (if (assoc str *special-case-list* :test #'string=)
       (cdr (assoc str *special-case-list* :test #'string=))
       (fix-type-suffixes (cl-ppcre:regex-replace-all
                           "([a-z])([0-9A-Z])" str
                           (lambda (match r1 r2)
                             (declare (ignore match))
                             (format nil "~A-~A" r1 r2))
                           :simple-calls t)))))

(defun fix-gl-function-name (name)
  (mixedcaps->lcdash name))

;;; tags in gl.spec file:
;;;  required-props:
;;;  param: ...
;;;  dlflags: ...
;;;  glxflags: ...
;;;  vectorequiv: ...
;;;  catgory: ...
;;;  version: ....
;;;  glxsingle: ...
;;;  glxropcode: ...
;;;  glxvendorpriv: ...
;;;  glsflags: ...
;;;  glsopcode: ...
;;;  glsalias: ...
;;;  wglflags: ...
;;;  extension: ...
;;;  alias: ...
;;;  offset: ...
;;;  passthru: ...
;;;  newcategory
;;;
;;; function def:
;;;  name({var{,var2{,...}})
;;;    return type
;;;    param name type [in/out] [value/array ...]
;;;    dlflags ...
;;;    category cat
;;;    version ver
;;;    extension
;;;    glxsingle ...
;;;    glsopcode ...
;;;    wglflags ...
;;;    offset ...

(defparameter *gl-types*
  '("char" "char-arb" "intptr" "sizeiptr" "intptr-arb" "sizeiptr-arb"
    "handle-arb" "half" "half-arb" "half-nv" "int64" "uint64" "clampd" "double"
    "clampf" "float" "sizei" "uint" "ushort" "ubyte" "int" "short" "byte"
    "void" "bitfield" "boolean" #| "enum" |# "string" "int64-ext" "uint64-ext"))

(defparameter *type-map* (make-hash-table :test 'equal))

(defun add-type-map (line)
  (unless (scan "^\\s*#.*" line)
    (multiple-value-bind (match regs)
        (scan-to-strings "^([^,]+),\\*,\\*,\\s*([^, ]+),*,*\\s*" line)
      (if match
          (if (string= (aref regs 1) "*")
              (setf (gethash (aref regs 0) *type-map*) (aref regs 0))
              (setf (gethash (aref regs 0) *type-map*) (aref regs 1)))
          (format t "failed to parse type-map line: ~a ~%" line)))))

(defun load-type-map (stream)
  (setf *type-map* (make-hash-table :test 'equal))
  (loop for line = (read-line stream nil nil)
        while line do (add-type-map line))
  ;; add some missing types by hand...
  (setf (gethash "Int64EXT" *type-map*)
        (gethash "Int64EXT" *type-map* "GLint64EXT"))
  (setf (gethash "UInt64EXT" *type-map*)
        (gethash "UInt64EXT" *type-map* "GLuint64EXT"))
  ;; more types. The gl.tm file is outdated and apparently belongs to
  ;; the ogl-sample project at: http://oss.sgi.com/projects/ogl-sample/
  (loop for (from to)
        in '(("BufferSize" "GLsizeiptr")
             ("BufferOffset" "GLintptr")
             ("BufferTargetARB" "GLenum")
             ("BufferUsageARB" "GLenum")
             ("BufferAccessARB" "GLenum")
             ("BufferPNameARB" "GLenum")
             ("BufferPointerNameARB" "GLenum")
             ("BufferSizeARB" "GLsizeiptrARB")
             ("BufferOffsetARB" "GLintptrARB")
             ("ProgramTarget" "GLenum")
             ("FramebufferTarget" "GLenum")
             ("FramebufferAttachment" "GLenum")
             ("RenderbufferTarget" "GLenum")
             ("VertexAttribEnum" "GLenum")
             ("ProgramParameterPName" "GLenum"))
        do (setf (gethash from *type-map*) to)))

(defparameter *current-fun* nil)
(defparameter *function-list* nil)

(defclass fun-spec ()
  ((name :initarg :name :accessor name)
   (return-type :initform "void" :accessor return-type)
   (category :initform "" :accessor category)
   (major-version :initform 1 :accessor major)
   (minor-version :initform 0 :accessor minor)
   (extension :initform nil :accessor extension)
   (parameters :initform nil :accessor parameters)))

(defclass fun-parm ()
  ((name :initarg :name :accessor name)
   (ctype :initarg :type :accessor ctype)
   (array :initarg :array-flag :accessor array-flag)
   (inout :initarg :inout :accessor in-out)
   (retained :initarg :retained :accessor retained)))

(defun mangle-for-c (name)
  (concatenate 'string "gl" name))

(defun mangle-for-lisp (name)
  (if *lispy-function-names*
      (mixedcaps->lcdash name)
      (concatenate 'string "%gl" name)))

;; ("GLenum" "handleARB" "UInt32" "VoidPointer" "Boolean" "String"
;; "ErrorCode" "Int32" "List" "void")
(defparameter *return-types* nil)
(defparameter *parm-types* nil)

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
    ("void"           . ":void")))

(defun multi-replace (string regexes replacements)
  (if (null regexes)
      string
      (multi-replace (regex-replace (first regexes) string (first replacements))
                     (rest regexes)
                     (rest replacements))))

(defun remap-base-types (type)
  (cond
    ((assoc type *base-types* :test #'string=)
     (cdr (assoc type *base-types* :test #'string=)))
    ((string= type "GL" :end1 2)
     (multi-replace (subseq type 2) '("EXT" "NV" "ARB") '("-ext" "-nv" "-arb")))
    (t type)))

(defun remap-base-and-pointer-types (type)
  (cond
    ((find #\* type :test #'char=)
     ;; quick hack to extract types from "foo*", probably breaks
     ;; on foo**...just replace last '*' with ''
     (let* ((base (regex-replace "[*]$" type ""))
            (remapped (remap-base-types base)))
       (format nil "(:pointer ~a)" remapped)))
    (t (remap-base-types type))))

(defun fix-arg (arg)
  (cond ((string= arg "t") "tee")
        (t arg)))

(defun remap-return (type)
  (let ((remapped (gethash type *type-map* nil)))
    (if remapped
        (remap-base-and-pointer-types remapped)
        (progn (format t "unable to remap return type ~a ~%" type)
               type))))

(defun remap-type (type)
  (let ((remapped (gethash type *type-map* nil)))
    (if remapped
        (remap-base-and-pointer-types remapped)
        (progn (format t "unable to remap type ~a ~%" type)
               type))))

(defun dump-param (stream parm)
  (format stream "~&  (~a ~a)"
          (fix-arg (name parm))
          (if (array-flag parm)
              (format nil "(:pointer ~a)" (remap-type (ctype parm)))
              (remap-type (ctype parm)))))

(defun dump-fun-wrapper (stream fun)
  ;; these might be better in docstrings or something, but defcfun
  ;; doesn't seem to have those, so at least dump some comments with
  ;; extra info...
  (format stream "~&~%;;; GL version: ~A.~A, ~A~%"
          (major fun) (minor fun) (category fun))
  ;; spec files don't have consistent extension flags, so use
  ;; the same heuristic as the perl parsers do:
  ;; version >= 1.2, or category starting with capital letter
  (format stream "(~A (\"~A\" ~A) ~A"
          (if (or (extension fun)
                  (or (>= (major fun) 2)
                      (>= (minor fun) 2))
                  (upper-case-p (char (category fun) 0)))
              *ext-definer*
              *core-definer*)
          (mangle-for-c (name fun))
          (mangle-for-lisp (name fun))
          (remap-return (return-type fun)))
  (loop for i in (parameters fun)
        do (dump-param stream i))
  (format stream ")~%"))

(defun new-fun (name)
  ;; (format t " starting function : ~a ~%" name)
  (setf *current-fun* (make-instance 'fun-spec :name name)))

(defun finish-fun ()
  (when *current-fun*
    ;;(format t " finishing function ~a ~%" *current-fun*)
    ;;    (dump-fun-wrapper t *current-fun*)
    (push *current-fun* *function-list*)
    (setf *current-fun* nil)))

(defun add-param (name type io val-array array-size retained)
  (declare (ignorable io array-size retained))
  (setf (parameters *current-fun*)
        (append (parameters *current-fun*)
                (list
                 (make-instance 'fun-parm :name name :type type
                                :array-flag (string= val-array "array")
                                :inout io :retained retained)))))

(defun set-return (return-type)
  (setf (return-type *current-fun*) return-type))

(defun set-category (cat)
  (setf (category *current-fun*) cat))

(defun set-version (ver)
  (setf (major *current-fun*) (parse-integer ver :junk-allowed t))
  (setf (minor *current-fun*) (parse-integer ver :junk-allowed t
                                             :start (1+ (position #\. ver)))))

(defun set-extension (&optional flags)
  (setf (extension *current-fun*) (or flags t)))

(defmacro make-matcher (regex &body body)
  `(lambda (line)
     (multiple-value-bind (match regs)
         (scan-to-strings ,regex line)
       (flet ((reg (n) (aref regs n)))
         (if match
             (progn ,@body t)
             nil)))))

(defmacro ignore-matcher (regex)
  `(lambda (line)
     (multiple-value-bind (match regs)
         (scan-to-strings ,regex line)
       (declare (ignorable regs))
       (if match
           (progn
             ;;(format t "ignoring line ~s (~s ~s)~%" line match regs)
             t)
           nil))))

(defmacro ignore-tag (tag)
  `(ignore-matcher ,(format nil "^~a:.*$" tag)))

(defmacro ignore-ftag (tag)
  `(ignore-matcher ,(format nil "^\\s+~a(?:\\s+.*)?$" tag)))

(defparameter *parsers*
  (list
   (ignore-tag "required-props")
   (ignore-tag "param")
   (ignore-tag "dlflags")
   (ignore-tag "glxflags")
   (ignore-tag "vectorequiv")
   (ignore-tag "category")
   (ignore-tag "version")
   (ignore-tag "glxsingle")
   (ignore-tag "glxropcode")
   (ignore-tag "glxvendorpriv")
   (ignore-tag "glsflags")
   (ignore-tag "glsopcode")
   (ignore-tag "glsalias")
   (ignore-tag "wglflags")
   (ignore-tag "extension")
   (ignore-tag "alias")
   (ignore-tag "offset")
   (ignore-tag "passthru")
   (ignore-tag "newcategory")
   (ignore-tag "glfflags")
   (ignore-tag "beginend")
   (ignore-tag "glxvectorequiv")

   (make-matcher "^(\\w+)\\(.*\\)$"
     (new-fun (reg 0)))
   (make-matcher "^\\s*$"
     (finish-fun))
   (make-matcher "^\\s+return\\\s+(\\w+)$"
     (set-return (reg 0)))
   ;; param name type [in/out] [value/array \[#/name/compsize(...)\] [retained]]
   (make-matcher
       "^\\s+param\\s+(\\w+)\\s+(\\w+)\\s+(in|out)\\s+(\\w+)(?:\\s+([^\\s]+))?(?:\\s+(retained))?$"
     (add-param (reg 0) (reg 1) (reg 2) (reg 3) (reg 4) (reg 5)))
   (make-matcher "^\\s+category\\s+([\\w-]+)$"
     (set-category (reg 0)))
   (make-matcher "^\\s+version\\s+([^\\s]+)$"
     (set-version (reg 0)))
   (make-matcher "^\\s+extension(?:\\s+(.*))?$$"
     (set-extension (reg 0)))
   (ignore-ftag "vectorequiv")
   (ignore-ftag "glsopcode")
   (ignore-ftag "glxropcode")
   (ignore-ftag "offset")
   (ignore-ftag "wglflags")
   (ignore-ftag "glsflags")
   (ignore-ftag "glxflags")
   (ignore-ftag "dlflags")
   (ignore-ftag "glxsingle")
   (ignore-ftag "glxvendorpriv")
   (ignore-ftag "glsalias")
   (ignore-ftag "alias")
   (ignore-ftag "glfflags")
   (ignore-ftag "glxvectorequiv")
   (ignore-ftag "beginend")

   (make-matcher ".*"
     (format t " unmatched line? ~s ~%" line))))

(defun parse-glspec-line (line)
  (loop for regex in *parsers*
     until (funcall regex line)))

(defun clean-line (line)
  "remove comments and trailing whitespace, nil->empty string"
  (if (null line)
      ""
      (cl-ppcre:regex-replace "\\s*(#.*)?$" line "")))

(defun parse-gl.spec (stream)
  (setf *current-fun* nil)
  (setf *function-list* nil)
  (loop for line = (read-line stream nil nil)
        for cleaned = (clean-line line)
        do (parse-glspec-line cleaned)
        while line)
  ;;  (setf *function-list* (sort *function-list* #'string< :key #'category)))
  (setf *function-list* (nreverse *function-list*)))

(defparameter *glext-version* nil)
(defparameter *glext-last-updated* "<unknown>")

;;; quick hack to grab version/modified data from enumext.spec
;;;
;;; really should do it while parsing the file, looks easier to do
;;; separately than patch into the enum parsing code though...
(defun get-glext-version (stream)
  (loop for line = (read-line stream nil nil)
        while line
        do (multiple-value-bind (match regs)
               (scan-to-strings "^passthru:\\s+.*last updated ([^\\s]+)\\s*"
                                line)
             (when match (setf *glext-last-updated* (aref regs 0))))
        (multiple-value-bind (match regs)
            (scan-to-strings
             "^passthru:\\s+#define GL_GLEXT_VERSION\\s+([^\\s]+)" line)
          (when match (setf *glext-version* (parse-integer (aref regs 0)))))))

(defun main ()
  (let* ((this-file (load-time-value *load-pathname*))
         (this-dir (make-pathname :directory (pathname-directory this-file)))
         (relative-gl (make-pathname :directory '(:relative :up "gl")))
         (gl-dir (merge-pathnames relative-gl this-dir))
         (relative-spec (make-pathname :directory '(:relative :up "spec")))
         (spec-dir (merge-pathnames relative-spec this-dir))
         (gl-tm (merge-pathnames "gl.tm" this-dir))
         (copyright-file (merge-pathnames "OSSCOPYRIGHT" this-dir))
         (gl-spec (merge-pathnames "gl.spec" spec-dir))
         ;(enum-spec (merge-pathnames "enum.spec" spec-dir))
         (enumext-spec (merge-pathnames "enumext.spec" spec-dir))
         (binding-package-file (merge-pathnames "bindings-package.lisp"
                                                gl-dir))
         (funcs-file (merge-pathnames "funcs.lisp" gl-dir)))

    (format t "~&;; loading .tm file ~A~%" (namestring gl-tm))
    (with-open-file (s gl-tm)
      (load-type-map s))
    (format t "~&;; parsing gl.spec file ~A~%" (namestring gl-spec))
    (with-open-file (s gl-spec) (parse-gl.spec s))
    (format t "~&;; getting enumext version from ~A~%" (namestring gl-tm))
    (with-open-file (s enumext-spec) (get-glext-version s))

    (when *define-package*
      (format t "~&;; Writing ~A.~%" (namestring binding-package-file))
      (with-open-file (out binding-package-file :direction :output
                           :if-exists :supersede)
        (format out ";;; generated file, do not edit~%")
        (format out ";;; glext version ~a ( ~a )~%~%" *glext-version*
                *glext-last-updated*)
        (format out "(defpackage #:~a~%" *in-package-name*)
        (when *package-nicknames*
          (format out "  (:nicknames ~a)~%" *package-nicknames*))
        (format out "  (:use #:common-lisp #:cffi)~%")
        (format out "  (:shadow #:char #:float #:byte #:boolean #:string)~%")
        (format out "  (:export~%")
        (format out "   #:enum~%")
        (format out "   #:*glext-version*~%")
        (format out "   #:*glext-last-updated*~%")
        (format out "   #:*gl-get-proc-address*~%")
        ;; types
        (format out "~%  ;; Types.~%  ")
        (loop for type in *gl-types*
              do (format out "~<~%  ~1,70:;#:~A ~>" type))
        ;; functions
        (format out "~%~%  ;; Functions.~%  ")
        (loop for i in *function-list*
              do (format out "~<~%  ~1,70:;#:~A ~>"
                         (string-downcase (mangle-for-lisp (name i)))))
        (format out "))~%~%")))

    (format t "~&;; Writing ~A.~%" (namestring funcs-file))

    (with-open-file (out funcs-file :direction :output :if-exists :supersede)
      (format out ";;; generated file, do not edit~%~%")
      (format out ";;; generated from files with following copyright:~%;;;~%")
      (with-open-file (copyright copyright-file)
        (loop for line = (read-line copyright nil nil)
              while line
              do (format out ";;; ~a~%" line)))
      (format out ";;;~%~%")
      (format out ";;; glext version ~a ( ~a )~%~%" *glext-version*
              *glext-last-updated*)

      (when *in-package-name*
        (format out "(in-package #:~a)~%~%" *in-package-name*))

      (format out "(defparameter *glext-version* ~s)~%" *glext-version*)
      (format out "(defparameter *glext-last-updated* ~s)~%"
              *glext-last-updated*)

      (when *dump-functions*
        (loop for i in *function-list*
              do (dump-fun-wrapper out i))))
    (force-output)
    #+sbcl (sb-ext:quit :unix-status 0)))
