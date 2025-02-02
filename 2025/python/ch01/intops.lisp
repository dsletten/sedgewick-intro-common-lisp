#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   What I like about Lisp is that you can feel the bits between your toes.
;;;;   -- Drew McDermott
;;;;
;;;;   Name:               intops.lisp
;;;;
;;;;   Started:            Wed Jan 15 03:53:56 2025
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

(defpackage :intops (:use :common-lisp :core :io :shell))

(in-package :intops)

;; (handler-case (destructuring-bind (a b) (mapcar #'(lambda (s) (read-num s :test #'integerp)) (get-args))
;;                 (if (or (null a) (null b))
;;                     (format *error-output* "Suck it!~%")
;;                     (let ((sum (+ a b))
;;                           (difference (- a b))
;;                           (product (* a b))
;;                           (quotient (truncate a b))
;;                           (remainder (rem a b))
;;                           (power (expt a b)))
;;                       (format t "~D + ~D = ~D~%" a b sum)
;;                       (format t "~D - ~D = ~D~%" a b difference)
;;                       (format t "~D * ~D = ~D~%" a b product)
;;                       (format t "~D / ~D = ~D~%" a b quotient)
;;                       (format t "~D % ~D = ~D~%" a b remainder)
;;                       (format t "~D ** ~D = ~D~%" a b power))))
;;   (error () (format *error-output* "Your future is bleak!~%")))



(let ((a (read-num (get-argv 0) :test #'integerp))
      (b (read-num (get-argv 1) :test #'integerp)))
  (if (or (null a) (null b))
      (format *error-output* "Suck it!~%")
      (let ((sum (+ a b))
            (difference (- a b))
            (product (* a b))
            (quotient (truncate a b))
            (remainder (rem a b))
            (power (expt a b)))
        (format t "~D + ~D = ~D~%" a b sum)
        (format t "~D - ~D = ~D~%" a b difference)
        (format t "~D * ~D = ~D~%" a b product)
        (format t "~D / ~D = ~D~%" a b quotient)
        (format t "~D % ~D = ~D~%" a b remainder)
        (format t "~D ** ~D = ~D~%" a b power))))




