;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp isn't a language, it's a building material.
;;;;   -- Alan Kay
;;;;
;;;;   Name:               polar-coordinates.lisp
;;;;
;;;;   Started:            Mon Nov 26 00:31:02 2012
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
;(load "/Users/dsletten/lisp/packages/test.lisp")

(defpackage :polar-coordinates
  (:use :common-lisp)
  (:export :r :theta :make-polar-coordinates))

(in-package :polar-coordinates)

(defclass polar-coordinates ()
  ((r :reader r :initarg :r)
   (theta :reader theta :initarg :theta)))

(defun make-polar-coordinates (x y)
  (let ((x (coerce x 'double-float))
        (y (coerce y 'double-float)))
    (make-instance 'polar-coordinates :r (distance x y) :theta (atan y x))))
;  (make-instance 'polar-coordinates :r (abs (complex x y)) :theta (atan y x)))

(defmethod print-object ((p polar-coordinates) stream)
  (print-unreadable-object (p stream :type t)
    (format stream "r: ~E theta: ~E" (r p) (theta p))))

(defun distance (x y)
  (sqrt (+ (* x x) (* y y))))
