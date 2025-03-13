#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   What I like about Lisp is that you can feel the bits between your toes.
;;;;   -- Drew McDermott
;;;;
;;;;   Name:               color-conversion.lisp
;;;;
;;;;   Started:            Mon Mar 10 22:54:10 2025
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
;;;;   Notes: Ex. 1.2.29
;;;;   https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :color-conversion (:use :common-lisp :core :io shell))

(in-package :color-conversion)

;; (defun convert (r g b)
;;   (if (= 0 r g b)
;;       (values 0d0 0d0 0d0 1d0)
;;       (let ((w (apply #'max (mapcar (partial* #'/ 255d0) (list r g b)))) )
;;         (values (/ (- w (/ r 255d0)) w)
;;                 (/ (- w (/ g 255d0)) w)
;;                 (/ (- w (/ b 255d0)) w)
;;                 (- 1 w)))) )

(defun convert (r g b)
  (if (= 0 r g b)
      (values 0d0 0d0 0d0 1d0)
      (destructuring-bind (r* g* b*) (mapcar (partial* #'/ 255d0) (list r g b))
        (let ((w (max r* g* b*)))
          (values (/ (- w r*) w)
                  (/ (- w g*) w)
                  (/ (- w b*) w)
                  (- 1 w)))) ))

(when (= (length (get-args)) 3)
  (if-let (r (read-num (get-argv 0) :test (every-pred #'integerp #'(lambda (x) (<= 0 x 255)))) )
    (if-let (g (read-num (get-argv 1) :test (every-pred #'integerp #'(lambda (x) (<= 0 x 255)))) )
      (if-let (b (read-num (get-argv 2) :test (every-pred #'integerp #'(lambda (x) (<= 0 x 255)))) )
        (multiple-value-bind (c m y k) (convert r g b)
          (format t "CMYK equivalent. Cyan: ~F Magenta: ~F Yellow: ~F Black: ~F~%" c m y k))
        (format *error-output* "Invalid blue level: ~A~%" (get-argv 2)))
      (format *error-output* "Invalid green level: ~A~%" (get-argv 1)))
    (format *error-output* "Invalid red level: ~A~%" (get-argv 0))))
