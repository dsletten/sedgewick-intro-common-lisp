#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               use-three.lisp
;;;;
;;;;   Started:            Thu Jan  2 22:26:14 2025
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
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/strings")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :use-three (:use :common-lisp :core :shell :strings))

(in-package :use-three)

(let ((args (get-args)))
  (if (zerop (length args))
      (format t "Nothing to see here.~%")
      (format t "Hi ~A.~%" (apply #'english-and-list (reverse args)))) )


