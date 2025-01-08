#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a programmable programming language.
;;;;   -- John Foderaro
;;;;
;;;;   Name:               trigonometry.lisp
;;;;
;;;;   Started:            Fri Mar 29 00:07:24 2013
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
(load "/Users/dsletten/lisp/packages/test.lisp")

(defpackage :trigonometry (:use :common-lisp :test))

(in-package :trigonometry)

(defun square (x)
  (* x x))

(defun sum-squares (x y)
  (+ (square x) (square y)))

(loop for theta from 0 to pi by 0.01d0
      do (format t "~F: ~F~%" theta (sum-squares (cos theta) (sin theta))))