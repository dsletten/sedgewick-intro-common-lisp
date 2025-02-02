#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp isn't a language, it's a building material.
;;;;   -- Alan Kay
;;;;
;;;;   Name:               quadratic-clos.lisp
;;;;
;;;;   Started:            Wed Jan 22 17:51:27 2025
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
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")
(load "/home/slytobias/lisp/books/Sedgewick/IntroToProgramming/2025/ch01/parabola.lisp")

(defpackage :quadratic-clos (:use :common-lisp :io :shell))

(in-package :quadratic-clos)

(when (= (length (get-args)) 3)
  (let ((a (read-num (get-argv 0)))
        (b (read-num (get-argv 1)))
        (c (read-num (get-argv 2))))
    (if (or (null a) (null b) (null c))
        (format *error-output* "Suck it!~%")
        (let ((p (make-instance 'parabola:parabola :a a :b b :c c)))
          (format t "~A~%" p)
          (format t "Root 1: ~F~%" (parabola:first-root p))
          (format t "Root 2: ~F~%" (parabola:second-root p)))) ))


