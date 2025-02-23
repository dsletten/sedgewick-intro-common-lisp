#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a bean bag--you can sit on a bean bag and squash it, but it will always rise again.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               compound-interest.lisp
;;;;
;;;;   Started:            Sun Feb 16 20:41:35 2025
;;;;   Modifications:
;;;;
;;;;   Purpose:
;;;;
;;;;
;;;;
;;;;   Calling Sequence:
;;;;
;;;;
;;;;   Inputs:
;;;;   Rate r must be scaled by 100.
;;;;
;;;;   Outputs:
;;;;
;;;;   Example:
;;;;   
;;;;   compound-interest.lisp 100 12 1
;;;;   Amount: 112.75
;;;;   compound-interest.lisp 3000 7 5
;;;;   Amount: 4257.20
;;;;   compound-interest.lisp 5000 9 15
;;;;   Amount: 19287.13
;;;;
;;;;   Notes: Ex. 1.2.21
;;;;   
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :compound-interest
  (:use :common-lisp :core :shell :io)
  (:shadow :t))

(in-package :compound-interest)

(defun compound (p r t)
  (* p (exp (* r t))))

(let ((args (get-args)))
  (when (= (length args) 3)
    (let ((inputs (mapcar #'(lambda (s) (read-num s :test #'plusp)) args)))
      (if (some #'null inputs)
          (format *error-output* "Corrupt~%")
          (destructuring-bind (p r t) inputs
            (handler-case (format cl:t "Amount: ~,2F~%" (compound p (/ r 100) t))
              (arithmetic-error ()
                (format *error-output* "Technical difficulties...~%")))) ))))


