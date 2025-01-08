;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               ch1.2.lisp
;;;;
;;;;   Started:            Tue Aug  3 22:48:03 2010
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
(load "/Users/dsletten/lisp/packages/test")

(defpackage ch1.2 (:use common-lisp test))

(in-package ch1.2)

;;;
;;;    1.2.15
;;;    The description in the book is wrong.
;;;    
(defun trianglep (a b c)
  (and (> (+ a b) c)
       (> (+ a c) b)
       (> (+ b c) a)))

;; (defun trianglep (a b c)
;;   (or (> (+ a b) c)
;;       (> (+ a c) b)
;;       (> (+ b c) a)))

(deftest test-trianglep ()
  (check
   (trianglep 5 12 13)
   (trianglep 3 4 5)
   (not (trianglep 3 4 7))))

;;;
;;;    1.2.19
;;;
(defun random-range (a b)
  (+ (min a b) (random (1+ (abs (- a b)))) ))

;;;
;;;    1.2.20
;;;
(defun dice ()
  (+ (random-range 1 6) (random-range 1 6)))

;;;
;;;    1.2.22
;;;
(defconstant g 9.78033)
(defun displacement (x0 v0 time)
  (+ x0 (* v0 time) (/ (* g time time) 2)))

;;;
;;;    1.2.23
;;;
;;;    Can't fully validate date D since we don't have the year.
;;;
(defun date-check (m d)
  (assert (<= 1 m 12))
  (assert (<= 1 d 31))
  (or (and (= m 3) (>= d 20))
      (< 3 m 6)
      (and (= m 6) (<= d 20))))

      