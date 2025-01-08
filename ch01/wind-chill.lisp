#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               wind-chill.lisp
;;;;
;;;;   Started:            Sat Oct  1 22:33:12 2011
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

(defpackage :wind-chill (:use :common-lisp :command-line) (:shadow :t))

(in-package :wind-chill)

(defun validp (t v)
  (and (numberp t) (numberp v)
       (<= -50 t 50) (<= 3 v 120)))

(defun compute-wind-chill (t v)
  (+ 35.74d0
     (* 0.6215d0 t)
     (* (- (* 0.4275d0 t) 35.75d0)
        (expt v 0.16d0))))

(let ((*read-default-float-format* 'double-float))
  (defscript wind-chill (t v)
    (if (validp t v)
        (format cl:t "~F~%" (compute-wind-chill t v))
        (format cl:t "The effective temperature (wind chill) formula is only valid for temperatures between -50 F and 50 F and wind speeds between 3 mph and 120 mph.~%"))))

