;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a language for doing what you've been told is impossible.
;;;;   -- Kent Pitman
;;;;
;;;;   Name:               1.2.lisp
;;;;
;;;;   Started:            Tue Apr  2 01:54:18 2013
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
(load "/Users/dsletten/lisp/packages/test.lisp")

(use-package :test)

;;;
;;;    1.2.14
;;;
(defun dividesp (m n)
  (and (typep m '(integer (0)))
       (typep n '(integer (0)))
       (or (zerop (mod m n))
           (zerop (mod n m)))) )

(deftest test-dividesp ()
  (check
   (dividesp 3 12)
   (dividesp 60 5)
   (not (dividesp -3 9))
   (not (dividesp 3.0 9.0))
   (not (dividesp 3 0))
   (not (dividesp 0 4))
   (not (dividesp 3 11))))

;;;
;;;    1.2.15
;;;
(defun trianglep (a b c)
  (and (every #'(lambda (n) (typep n '(integer (0)))) (list a b c))
       (> (+ a b) c)
       (> (+ a c) b)
       (> (+ b c) a)))

(deftest test-trianglep ()
  (check
   (trianglep 3 4 5)
   (trianglep 5 12 13)
   (trianglep 1 2 2)
   (not (trianglep 0 0 0))
   (not (trianglep -1 -2 -3))
   (not (trianglep 0.2 0.3 0.4))
   (not (trianglep 1 2 3))))

;;;
;;;    1.2.18
;;;
(defun distance (x y)
  (assert (and (typep x 'double-float)
               (typep y 'double-float))
          (x y)
          "~A and ~A must be double-precision floats" x y)
  (sqrt (+ (expt x 2) (expt y 2))))

(deftest test-distance ()
  (check
   (= (distance 5d0 12d0) 13d0)
   (= (distance 3d0 4d0) 5d0)))

;;;
;;;    1.2.19
;;;
(defun random-int (a b)
  (assert (and (typep a 'integer)
               (typep b 'integer))
          (a b)
          "~A and ~A must be integers." a b)
  (cond ((= a b) a)
        ((< b a) (random-int b a))
        (t (+ a (random (1+ (- b a)))) )))

;; (defun random-int (a b)
;;   (assert (and (typep a 'integer)
;;                (typep b 'integer))
;;           (a b)
;;           "~A and ~A must be integers." a b)
;;   (+ (min a b) (random (1+ (abs (- a b)))) ))

(deftest test-random-int ()
  (check
   (let ((a 5)
         (b 19))
     (every #'(lambda (n) (<= a n b)) (loop repeat 10000 collect (random-int a b))))
   (let ((a 15)
         (b 9))
     (every #'(lambda (n) (<= b n a)) (loop repeat 10000 collect (random-int a b)))) ))

;;;
;;;    1.2.20
;;;
(defun roll-die ()
  (random-int 1 6))

(defun roll-dice ()
  (+ (roll-die) (roll-die)))
