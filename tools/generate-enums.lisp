;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;
;;; generate-enums.lisp --- Generate OpenGL enums from a .spec file.
;;;
;;; Copyright (c) 2006, Oliver Markovic <entrox@entrox.org>
;;; Copyright (c) 2006, Luis Oliveira <loliveira@common-lisp.net>
;;; Copyright (c) 2006, James Bielman <jamesjb@jamesjb.com>
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

;;; Bind VAR to VALUE and evaluate BODY is VALUE is non-nil.
(defmacro when-bind ((var value) &body body)
  `(let ((,var ,value))
     (when ,var
       ,@body)))

;;; Recursively apply WHEN-BIND to each binding in BINDINGS,
;;; evaluating BODY only if all bindings are non-nil.
(defmacro when-bind* (bindings &body body)
  (if (null (cdr bindings))
      `(when-bind ,(car bindings)
         ,@body)
      `(when-bind ,(car bindings)
         (when-bind* ,(cdr bindings)
           ,@body))))

;;; Return true if a character is a whitespace character.
(defun whitespacep (char)
  (member char '(#\Space #\Tab #\Newline #\Return)))

(defun string-ends-with (string1 string2)
  (when (>= (length string1) (length string2))
    (string-equal string1 string2
                  :start1 (- (length string1) (length string2)))))

;;; Smash comments from a line of input (assumed without newlines).
;;; Returns a fresh copy of LINE with comments removed, or LINE
;;; unchanged if no comments were present.
(defun smash-comments (line)
  (let ((pos (position #\# line)))
    (if pos
        (subseq line 0 pos)
        line)))

;;; Remove trailing whitespace from a line of input.
(defun smash-trailing-whitespace (line)
  (string-right-trim '(#\Space #\Tab #\Newline) line))

;;; Parse a top-level declaration into a name and type.  The input
;;; line should be of the form "<name> <type>:".  The name and type
;;; are returned as two values.  This is more permissive than it
;;; should be, but okay for our purposes here.
(defun parse-name-and-type (line)
  (when-bind* ((space (position #\Space line))
               (colon (position #\: line)))
    (unless (< colon space)
      (values (subseq line 0 space) (subseq line (1+ space) colon)))))

;;; Parse an inner enum declaration into a name and value.  The input
;;; line should begin with a tab, followed by a name, whitespace, an
;;; equals sign, and the numeric value of the constant.
(defun parse-enum (line)
  (when (char= (char line 0) #\Tab)
    (when-bind* ((space (position-if #'whitespacep line :start 1))
                 (eq (position #\= line :start space))
                 (val (position-if-not #'whitespacep line :start (1+ eq))))
      (values (subseq line 1 space) (subseq line val)))))

;;; Convert the name of an enum into a CL keyword symbol.
(defun convert-enum-name (name)
  (intern (string-upcase (substitute #\- #\_ name)) :keyword))

;;; Convert the value into a number, if possible.
(defun convert-value (value)
  (let ((base 10)
        (start 0))
    (when (and (> (length value) 2) (equalp (subseq value 0 2) "0x"))
      (setf base 16 start 2))
    (parse-integer value :start start :radix base :junk-allowed t)))

;;; An instance of PARSER contains the state of the spec file parser.
(defclass parser ()
  ((mode :initform :toplevel :accessor parser-mode)
   (block-type :initform nil :accessor parser-block-type)
   (enums :initform (make-hash-table) :accessor parser-enums)))

(defun maybe-generate-shorthand-name (symbol)
  (let* ((name (symbol-name symbol))
         (len (length name)))
    (or (and (string-ends-with name "-BITS")
             (intern (subseq name 0 (- len 5)) '#:keyword))
        (and (string-ends-with name "-BIT")
             (intern (subseq name 0 (- len 4)) '#:keyword)))))

;;; Process the next line of input for the spec parser.
(defun parse-line (parser line)
  (let ((line (smash-trailing-whitespace (smash-comments line)))
        (block-type (parser-block-type parser))
        (enums (parser-enums parser)))
    (when (plusp (length line))
      ;; If we're in :ENUM mode and the first character is not a tab,
      ;; kick the parser back into toplevel mode.
      (when (and (eql (parser-mode parser) :enum) (char/= (char line 0) #\Tab))
        (setf (parser-mode parser) :toplevel))
      (ecase (parser-mode parser)
        (:toplevel
         (multiple-value-bind (name type) (parse-name-and-type line)
           (when name
             (setf (parser-mode parser) :enum)
             (setf (parser-block-type parser) type))))
        (:enum
         (when (equalp block-type "enum")
           (multiple-value-bind (name value) (parse-enum line)
             (when name
               (let ((sym (convert-enum-name name))
                     (value (convert-value value)))
                 (when value
                   ;; We additionally generate versions without the
                   ;; -BIT and -BITS suffixes.
                   (let ((short-symbol (maybe-generate-shorthand-name sym)))
                     (when short-symbol
                       (setf (gethash short-symbol enums) value)))
                   (setf (gethash sym enums) value)))))))))))

;;; Parse a file and build a data structure containing its enums.
(defun parse-file (pathname &optional (parser (make-instance 'parser)))
  (with-open-file (s pathname)
    (loop for line = (read-line s nil s)
          until (eql line s)
          do (parse-line parser line)))
  parser)

;;; Return a list of the keys of a hash table.
(defun hash-table-keys (hash)
  (loop for name being the hash-keys in hash collect name))

;;; Write an expression to define a CFFI enum for the enums in PARSER
;;; to STREAM.
;;;
;;; We print them downcased for the convenience of "modern" lisps, and
;;; that requires ~A instead of ~S, otherwise we'd get things like
;;; :|3d|.
(defun write-enums (enum-name parser stream)
  (format stream "(defcenum (~A :unsigned-int)" enum-name)
  (let* ((enums (parser-enums parser))
         (keys (sort (hash-table-keys enums) #'string-lessp))
         (*print-case* :downcase))
    (dolist (key keys)
      (format stream "~%  (:~A #x~X)" key (gethash key enums))))
  (format stream ")~%"))

;;; Generate the CL-OPENGL source file containing the enums from the
;;; two spec files in the distribution.
(defun main ()
  (let* ((parser (make-instance 'parser))
         (this-file (load-time-value *load-pathname*))
         (this-dir (make-pathname :directory (pathname-directory this-file)))
         (relative-gl (make-pathname :directory '(:relative :up "gl")))
         (gl-dir (merge-pathnames relative-gl this-dir))
         (relative-spec (make-pathname :directory '(:relative :up "spec")))
         (spec-dir (merge-pathnames relative-spec this-dir))
         (gl-spec (merge-pathnames "enum.spec" spec-dir))
         (ext-spec (merge-pathnames "enumext.spec" spec-dir))
         (constants-file (merge-pathnames "constants.lisp" gl-dir)))
    (format t "~&;; Parsing ~A~%" (namestring gl-spec))
    (parse-file gl-spec parser)
    (format t "~&;; Parsing ~A.~%" (namestring ext-spec))
    (parse-file ext-spec parser)
    (format t "~&;; Writing ~A.~%" (namestring constants-file))
    (with-open-file (s constants-file :direction :output :if-exists :supersede)
      (format s "~&;;; this file is automatically generated, do not edit~%")
      (format s "(in-package #:cl-opengl-bindings)~%~%")
      (write-enums "enum" parser s))
    (force-output)
    #+sbcl (sb-ext:quit :unix-status 0)))
