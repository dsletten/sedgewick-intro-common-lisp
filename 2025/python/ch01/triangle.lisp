#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   In Lisp there is always more than one way to solve a problem.
;;;;   -- David Touretzky
;;;;
;;;;   Name:               triangle.lisp
;;;;
;;;;   Started:            Mon Feb  3 00:53:56 2025
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
;;;;   Notes: Ex. 1.2.12
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :triangle (:use :common-lisp :core :io :shell))

(in-package :triangle)

;;;
;;;    https://en.wikipedia.org/wiki/Triangle_inequality
;;;
;;;    Explicitly: a + b > c  &  b + c > a  &  a + c > b
;;;    Equivalently: |a - b| < c < a + b
;;;    or
;;;    max(a, b, c) < a + b + c - max(a, b, c) => 2 max(a, b, c) < a + b + c
;;;    or
;;;    Area of triangle > 0.
;;;    
(defun trianglep-sedgewick (a b c)
  (not (or (>= a (+ b c))
           (>= b (+ a c))
           (>= c (+ a b)))) )

(defun trianglep (a b c)
  (and (< a (+ b c))
       (< b (+ a c))
       (< c (+ a b))))

(defun trianglep-abs (a b c)
  (< (abs (- a b)) c (+ a b)))

(defun trianglep-max (a b c)
  (< (* 2 (max a b c)) (+ a b c)))

(defun goldberg-heron (a b c)
  "Calculate area of triangle with sides of length A, B, C. This implementation assumes A ≥ B ≥ C."
  (labels ((heron (a b c)
             (/ (sqrt (* (+ a (+ b c))
                         (- c (- a b))
                         (+ c (- a b))
                         (+ a (- b c))))
                4)))
    (apply #'heron (sort (list a b c) #'>))))

(defun trianglep-area (a b c)
  (let ((area (goldberg-heron a b c)))
    (and (realp area)
         (plusp area))))

(when (= (length (get-args)) 3)
  (let ((a (read-num (get-argv 0) :test (every-pred #'integralp #'plusp)))
        (b (read-num (get-argv 1) :test (every-pred #'integralp #'plusp)))
        (c (read-num (get-argv 2) :test (every-pred #'integralp #'plusp))))
    (if (some #'null (list a b c))
        (format *error-output* "Corrupt~%")
        (progn
          (format t "~:[False~;True~]~%" (trianglep-sedgewick a b c))
          (format t "~:[False~;True~]~%" (trianglep a b c))
          (format t "~:[False~;True~]~%" (trianglep-abs a b c))
          (format t "~:[False~;True~]~%" (trianglep-max a b c))
          (format t "~:[False~;True~]~%" (trianglep-area a b c)))) ))

;; Pass
;; 1 1 1
;; 3 4 5
;; 13 12 5
;; 2 3 4
;; 6 9 5
;; 51 55 42
;; 82 24 89
;; 604 827 476
;; 397 49 378
;; 621 38 603
;; Fail
;; 1 3 5
;; 89 33 17
;; 174 7 361
;; 173 939 392
;; 844 186 655
;; 896 453 76

