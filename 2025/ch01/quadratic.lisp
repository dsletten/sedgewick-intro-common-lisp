#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Of all the languages I know, I like Lisp the best, simply because it's the most beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               quadratic.lisp
;;;;
;;;;   Started:            Mon Jan 20 00:19:54 2025
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

(defpackage :quadratic (:use :common-lisp :io :shell))

(in-package :quadratic)

(defun quadratic (a b c)
  (let* ((discriminant (- (* b b) (* 4 a c)))
         (d (sqrt discriminant)))
    (values (/ (+ (- b) d) 2 a)
            (/ (- (- b) d) 2 a))))

;;;    Goldberg -- What Every Computer Scientist Should Know... pg. 162
(defun goldberg-complex-quadratic (a b c)
  (assert (every #'numberp (list a b c)) (a b c) "A, B, and C must all be numbers.")
  (symbol-macrolet ((discriminant (- (* b b) (* 4 a c))))
    (if (>= b 0)
        (values (/ (* 2 c) (- (- b) (sqrt discriminant)))
                (/ (- (- b) (sqrt discriminant)) (* 2 a)))
        (values (/ (+ (- b) (sqrt discriminant)) (* 2 a))
                (/ (* 2 c) (+ (- b) (sqrt discriminant)))) )))

(when (= (length (get-args)) 3)
  (let ((a (read-num (get-argv 0)))
        (b (read-num (get-argv 1)))
        (c (read-num (get-argv 2))))
    (if (or (null a) (null b) (null c))
        (format *error-output* "Suck it!~%")
        (multiple-value-bind (r1 r2) (goldberg-complex-quadratic a b c)
          (format t "Root 1: ~F~%" r1)
          (format t "Root 2: ~F~%" r2)))) )


;; (x - 7)(x - 9) = x² - 16x + 63
;; (2x + 4)(x - 5) = 2x² - 6x - 20
;;;    Sedgewick Java pg. 40
;;;    x = √k => x² = k => x² - k = 0 => x² + 0x - k = 0
;;;    
;; (goldberg-quadratic 1 0 -4d0) => 2.0; -2.0
;; (goldberg-quadratic 1 0 -3d0) => 1.7320508075688774; -1.7320508075688772
;; (goldberg-quadratic 1 0 -2d0) => 1.414213562373095; -1.4142135623730951
