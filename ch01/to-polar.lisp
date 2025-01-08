#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               to-polar.lisp
;;;;
;;;;   Started:            Mon Nov 26 01:21:42 2012
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
(load "polar-coordinates")

(defpackage :to-polar (:use :common-lisp :command-line :polar-coordinates))

(in-package :to-polar)

(defscript to-polar (x y)
  (if (and (numberp x) (numberp y))
      (format t "~A~%" (make-polar-coordinates x y))
      (format t "Invalid input.~%")))
