#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               trig-identity.lisp
;;;;
;;;;   Started:            Mon Aug 22 23:41:59 2011
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
(load "/Users/dsletten/lisp/packages/command-line")

(defpackage :trig-identity (:use :common-lisp :command-line))

(in-package :trig-identity)

(defun sum-squares (x y)
  (+ (* x x) (* y y)))

(defun trig-identity (theta)
  (sum-squares (cos theta) (sin theta)))

(let* ((*read-default-float-format* 'double-float)) ; If input is float.
  (defscript trig-identity (theta)
    (if (numberp theta)
        (format t "~A~%" (trig-identity (coerce theta 'double-float))) ; If input is rational. (Integer or ratio.)
        (format t "~A is not a valid number.~%" theta))))

    

