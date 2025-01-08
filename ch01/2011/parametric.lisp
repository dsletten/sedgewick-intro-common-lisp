#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               parametric.lisp
;;;;
;;;;   Started:            Sun Aug 28 01:30:22 2011
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

(defpackage :parametric (:use :common-lisp :command-line) (:shadow :t))

(in-package :parametric)

;;;
;;;    CL:T !!!
;;;    
(let* ((*read-default-float-format* 'double-float)) ; If input is float.
  (defscript parametric (t)
    (format cl:t "~F~%" (+ (sin (* 2 t)) (sin (* 3 t)))) ))


