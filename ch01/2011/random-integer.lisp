#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               random-integer.lisp
;;;;
;;;;   Started:            Sun Aug 28 01:16:48 2011
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

(defpackage :random-integer (:use :common-lisp :command-line))

(in-package :random-integer)

(defun random-int (a b)
  (+ a (random (1+ (- b a)) (make-random-state t))))

(defun validp (a b)
  (and (numberp a)
       (numberp b)
       (zerop (nth-value 1 (truncate a)))
       (zerop (nth-value 1 (truncate b)))
       (< a b)))

(defscript random-integer (a b)
  (if (validp a b)
      (format t "~D~%" (random-int a b))
      (format t "Bad input: ~D is not an integer less than ~D~%" a b)))
        




