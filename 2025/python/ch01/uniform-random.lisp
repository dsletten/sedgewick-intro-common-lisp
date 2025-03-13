#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a language for doing what you've been told is impossible.
;;;;   -- Kent Pitman
;;;;
;;;;   Name:               uniform-random.lisp
;;;;
;;;;   Started:            Tue Mar  4 22:53:23 2025
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
;;;;   Notes: Ex. 1.2.27
;;;;   Identical output to sample Python code:
;;;;   https://introcs.cs.princeton.edu/python/12types/stats1.py.html
;;;;
;;;;
(defpackage :uniform-random (:use :common-lisp))

(in-package :uniform-random)

(defconstant n 5)
(defconstant label-width 7)

(let* ((rs (make-random-state t))
       (xs (loop repeat n collect (random 1d0 rs))))
  (format t "~{~,16F~%~}" xs)
  (format t "~VA = ~,16F~%" label-width "Average" (/ (reduce #'+ xs) n))
  (format t "~VA = ~,16F~%" label-width "Min" (reduce #'min xs))
  (format t "~VA = ~,16F~%" label-width "Max" (reduce #'max xs)))
