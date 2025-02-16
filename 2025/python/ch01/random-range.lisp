#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a ball of mud--if you add more to it, you get a bigger ball of mud.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               random-range.lisp
;;;;
;;;;   Started:            Mon Feb 10 23:44:57 2025
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
;;;;   Notes: Ex. 1.2.16
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :random-range (:use :common-lisp :core :shell :io))

(in-package :random-range)

(defun random-range (a b)
  (if (> a b)
      (random-range b a)
      (+ a (random (1+ (- b a)) (make-random-state t)))) )

(when (= (length (get-args)) 2)
  (let ((a (read-num (get-argv 0) :test #'integralp))
        (b (read-num (get-argv 1) :test #'integralp)))
    (if (or (null a) (null b))
        (format *error-output* "Corrupt~%")
        (let ((a* (truncate a))
              (b* (truncate b)))
          (format t "Random [~D,~D]: ~D~%" a* b* (random-range a* b*)))) ))

