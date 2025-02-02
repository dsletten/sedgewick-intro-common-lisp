#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Of all the languages I know, I like Lisp the best, simply because it's the most beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               divides.lisp
;;;;
;;;;   Started:            Sun Feb  2 00:59:48 2025
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
;;;;   Notes: Ex. 1.2.11
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :divides (:use :common-lisp :core :io :shell))

(in-package :divides)

(when (= (length (get-args)) 2)
  (let ((m (read-num (get-argv 0) :test (every-pred #'integerp #'plusp)))
        (n (read-num (get-argv 1) :test (every-pred #'integerp #'plusp))))
    (if (or (null m) (null n))
        (format *error-output* "Corrupt~%")
        (format t "~:[False~;True~]~%" (or (zerop (mod m n)) (zerop (mod n m)))) )))

