#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a programmable programming language.
;;;;   -- John Foderaro
;;;;
;;;;   Name:               polar-coordinates2.lisp
;;;;
;;;;   Started:            Sat Feb 22 22:30:06 2025
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
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")
(load "/home/slytobias/lisp/books/Sedgewick/IntroToProgramming/2025/python/ch01/polar-coordinates-clos.lisp")

(defpackage :polar-coordinates (:use :common-lisp :core :shell :io :polar-coordinates-clos))

(in-package :polar-coordinates)

(when (= (length (get-args)) 2)
  (let ((x (read-num (get-argv 0)))
        (y (read-num (get-argv 1))))
    (if (some #'null (list x y))
        (format *error-output* "Corrupt~%")
        (let ((polar (cartesian->polar x y)))
          (format cl:t "(~F,~F) -> ~A~%" x y polar)))) )
