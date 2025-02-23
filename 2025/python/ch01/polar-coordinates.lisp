#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   In Lisp there is always more than one way to solve a problem.
;;;;   -- David Touretzky
;;;;
;;;;   Name:               polar-coordinates.lisp
;;;;
;;;;   Started:            Thu Feb 20 21:56:40 2025
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
;;;;   Notes: Ex. 1.2.23
;;;;   CLOS version ~/lisp/books/Sedgewick/IntroToProgramming/ch01/polar-coordinates.lisp
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :polar-coordinates (:use :common-lisp :core :shell :io))

(in-package :polar-coordinates)

(defun hypotenuse (x y)
  (sqrt (+ (* x x) (* y y))))

(defun cartesian->polar (x y)
;  (values (abs (complex x y)) (atan y x)))
  (values (hypotenuse x y) (atan y x)))

(when (= (length (get-args)) 2)
  (let ((x (read-num (get-argv 0)))
        (y (read-num (get-argv 1))))
    (if (some #'null (list x y))
        (format *error-output* "Corrupt~%")
        (multiple-value-bind (r θ) (cartesian->polar x y)
          (format cl:t "(~F,~F) -> r: ~F θ: ~F~%" x y r θ)))) )
