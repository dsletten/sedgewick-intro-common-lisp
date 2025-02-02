#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a ball of mud--if you add more to it, you get a bigger ball of mud.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               quadratic-sedgewick.lisp
;;;;
;;;;   Started:            Mon Jan 20 00:19:52 2025
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
;;;;
;;;;   Outputs:
;;;;
;;;;   Example:
;;;;
;;;;   Notes:
;;;;
;;;;
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :quadratic-sedgewick (:use :common-lisp :io :shell))

(in-package :quadratic-sedgewick)

(defun quadratic (b c)
  (let* ((discriminant (- (* b b) (* 4 c)))
         (d (sqrt discriminant)))
    (values (/ (+ (- b) d) 2)
            (/ (- (- b) d) 2))))

(let ((b (read-num (get-argv 0)))
      (c (read-num (get-argv 1))))
  (if (or (null b) (null c))
      (format *error-output* "Suck it!~%")
      (multiple-value-bind (r1 r2) (quadratic b c)
        (format t "Root 1: ~F~%" r1)
        (format t "Root 2: ~F~%" r2))))

