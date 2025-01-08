#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a programmable programming language.
;;;;   -- John Foderaro
;;;;
;;;;   Name:               gravity.lisp
;;;;
;;;;   Started:            Sun Sep 11 02:58:50 2011
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

(defpackage :gravity (:use :common-lisp :command-line) (:shadow :t))

(in-package :gravity)

(defvar *g* 9.78033d0)

(defun displacement (x0 v0 t)
  (+ x0 (* v0 t) (* (- *g*) t t 1/2)))

(let* ((*read-default-float-format* 'double-float))
  (defscript gravity (x0 v0 t)
    (format cl:t "Displacement: ~F~%" (displacement x0 v0 t))))