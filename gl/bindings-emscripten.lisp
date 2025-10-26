(in-package #:cl-opengl-bindings)

(defun %defglfun-body (cname lname result-type body)
  (declare (ignorable lname))
  ;; split out actual generation of body so we can call it from a
  ;; compiler macro
  #-cl-opengl-no-check-error
  `(multiple-value-prog1
       (foreign-funcall (,cname :library opengl)
                        ,@(loop for i in body
                                collect (second i)
                                collect (first i))
                        ,result-type)
     ,@(unless (string= cname "glGetError")
         `((check-error ',lname))))
  #+cl-opengl-no-check-error
  `(foreign-funcall (,cname :library opengl)
                    ,@(loop for i in body
                            collect (second i)
                            collect (first i))
                    ,result-type))

;;; Helper macro to define a GL API function and declare it inline.
(defmacro defglfun ((cname lname &optional index) result-type &body args)
  (declare (ignorable index))
  (when (find cname *webgl-functions* :test 'string=)
    `(progn
       (declaim (inline ,lname))
       ;; optionally generate a compiler macro to translate enums,
       ;; bitfields, etc
       ,@(when (loop for (nil type) in args
                       thereis (member type +compiler-macro-types+))
           `((define-compiler-macro ,lname ,(mapcar 'first args)
               (%defglfun-body ',cname ',lname ',result-type
                               (list ,@(loop for (name type) in args
                                             collect `(list ,name ',type)))))))

       (defun ,lname ,(mapcar #'first args)
         ,(%defglfun-body cname lname result-type args)))))

(defmacro defglextfun ((foreign-name lisp-name &optional index) result-type
                       &rest body)
  `(defglfun (,foreign-name ,lisp-name ,@ (when index (list index)))
             ,result-type
     ,@body))
