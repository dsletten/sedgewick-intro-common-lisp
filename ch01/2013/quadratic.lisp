;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp isn't a language, it's a building material.
;;;;   -- Alan Kay
;;;;
;;;;   Name:               quadratic.lisp
;;;;
;;;;   Started:            Fri Mar 22 01:27:35 2013
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

(defpackage :quadratic (:use :common-lisp :test))

(in-package :quadratic)

(defun quadratic (b c)
  (let* ((discriminant (- (* b b) (* 4 c)))
         (d (sqrt (coerce discriminant 'double-float))))
    (list (/ (+ (- b) d) 2d0) (/ (- (- b) d) 2d0))))

(defun quadratic (b c)
  (let* ((discriminant (- (* b b) (* 4 c)))
         (d (sqrt (coerce discriminant 'double-float))))
    (cond ((zerop discriminant) (list 'real-root (/ (- b) 2d0)))
          ((plusp discriminant) (list 'real-roots (/ (+ (- b) d) 2d0) (/ (- (- b) d) 2d0)))
          (t (list 'complex-roots (/ (+ (- b) d) 2d0) (/ (- (- b) d) 2d0)))) ))

;; (deftest test-quadratic ()
;;   (check

;;;
;;; See ~/lisp/books/Winston/lispbook/32mathem.lsp
;;;
(defun quadratic-winston (b c)
  (let ((discriminant (- (* b b) (* 4 c)))
        (real-term (/ (- b) 2d0)))
    (cond ((zerop discriminant) (list real-term real-term))
          ((plusp discriminant) (let ((d (sqrt (coerce discriminant 'double-float))))
                                  (list (+ real-term (/ d 2)) (- real-term (/ d 2)))) )
          (t (let ((d (sqrt (- (coerce discriminant 'double-float)))) )
               (list (complex real-term (/ d 2))
                     (complex real-term (- (/ d 2)))) )))))
