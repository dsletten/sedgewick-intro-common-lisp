#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a bean bag--you can sit on a bean bag and squash it, but it will always rise again.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               order-check.lisp
;;;;
;;;;   Started:            Wed Feb 26 18:57:36 2025
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
;;;;   Notes: Ex. 1.2.25
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :order-check (:use :common-lisp :core :io :shell))

(in-package :order-check)

(defun ascendingp (x y z)
  (< x y z))

(when (= (length (get-args)) 3)
  (let ((x (read-num (get-argv 0)))
        (y (read-num (get-argv 1)))
        (z (read-num (get-argv 2))))
    (if (some #'null (list x y z))
        (format *error-output* "Corrupt~%")
        (format t "~:[False~;True~]~%" (or (ascendingp x y z) (ascendingp z y x)))) ))

