#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               divides.lisp
;;;;
;;;;   Started:            Thu Aug 25 00:02:35 2011
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

(defpackage :divides (:use :common-lisp :command-line))

(in-package :divides)

(defun dividesp (p q)
  (zerop (mod p q)))

(defscript divides (p q)
  (if (or (dividesp p q)
          (dividesp q p))
      (format t "true~%")
      (format t "false~%")))