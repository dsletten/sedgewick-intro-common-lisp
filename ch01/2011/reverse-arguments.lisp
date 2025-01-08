#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               reverse-arguments.lisp
;;;;
;;;;   Started:            Sun May 15 02:10:25 2011
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

(load "/Users/dsletten/lisp/packages/lang")
(load "/Users/dsletten/lisp/packages/shell")
(use-package '("LANG" "SHELL"))

(write-line (apply #'commify-list (reverse (rest (get-args)))) )

