#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a ball of mud--if you add more to it, you get a bigger ball of mud.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               floatops.lisp
;;;;
;;;;   Started:            Thu Jan 16 22:11:00 2025
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

(defpackage :floatops (:use :common-lisp :core :io :shell))

(in-package :floatops)

;; (handler-case (destructuring-bind (a b) (mapcar #'(lambda (s) (read-num s)) (get-args))
;;                 (if (or (null a) (null b))
;;                     (format *error-output* "Suck it!~%")
;;                     (let ((sum (+ a b))
;;                           (difference (- a b))
;;                           (product (* a b))
;;                           (quotient (/ a b))
;;                           (remainder (rem a b))
;;                           (power (expt a b)))
;;                       (format t "~F + ~F = ~F~%" a b sum)
;;                       (format t "~F - ~F = ~F~%" a b difference)
;;                       (format t "~F * ~F = ~F~%" a b product)
;;                       (format t "~F / ~F = ~F~%" a b quotient)
;;                       (format t "~F % ~F = ~F~%" a b remainder)
;;                       (format t "~F ** ~F = ~F~%" a b power))))
;;   (error () (format *error-output* "Your future is bleak!~%")))

(let ((a (read-num (get-argv 0)))
      (b (read-num (get-argv 1))))
  (if (or (null a) (null b))
      (format *error-output* "Suck it!~%")
      (let ((sum (+ a b))
            (difference (- a b))
            (product (* a b))
            (quotient (/ a b))
            (remainder (rem a b))
            (power (expt a b)))
        (format t "~F + ~F = ~F~%" a b sum)
        (format t "~F - ~F = ~F~%" a b difference)
        (format t "~F * ~F = ~F~%" a b product)
        (format t "~F / ~F = ~F~%" a b quotient)
        (format t "~F % ~F = ~F~%" a b remainder)
        (format t "~F ** ~F = ~E~%" a b power))))


