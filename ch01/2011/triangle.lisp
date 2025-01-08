#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               triangle.lisp
;;;;
;;;;   Started:            Sat Aug 27 00:57:28 2011
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

(defpackage :triangle (:use :common-lisp :command-line))

(in-package :triangle)

(defun trianglep (a b c)
  (and (< a (+ b c))
       (< b (+ a c))
       (< c (+ a b))))

(defscript triangle (a b c)
  (if (trianglep a b c)
      (format t "true~%")
      (format t "false~%")))
        




