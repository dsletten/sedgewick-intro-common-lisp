#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               loan-payments.lisp
;;;;
;;;;   Started:            Sat Oct  1 21:49:29 2011
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
;;;;   Notes: Rate (r) should be expressed as percentage.
;;;;
;;;;
(load "/Users/dsletten/lisp/packages/command-line")

(defpackage :loan-payments (:use :common-lisp :command-line) (:shadow :t))

(in-package :loan-payments)

(defun validp (p r t)
  (and (numberp p)
       (>= p 0)
       (numberp r)
       (>= r 0)
       (numberp t)
       (>= t 0)))

(defun compute-total-payment (p r t)
  (* p (exp (* r t))))

(defun compute-monthly-payment (p r t)
  (/ (compute-total-payment p r t) t 12d0))

(defscript loan-payments (p r t)
  (if (validp p r t)
      (format cl:t "~$~%" (compute-monthly-payment p r t))
      (format cl:t "Please enter valid numbers for the principal, rate, and time period.~%")))