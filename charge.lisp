;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               charge.lisp
;;;;
;;;;   Started:            Fri Dec 31 21:26:15 2010
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
;;;;   Notes: See pg. 375
;;;;
;;;;

(defpackage sedgewick (:use common-lisp))

(in-package sedgewick)

(defconstant k 8.99d09 "Coulomb constant")

(defclass charge ()
  ((x :reader x :initarg :x :initform 0 :type real)
   (y :reader y :initarg :y :initform 0 :type real)
   (q :reader q :initarg :q :initform 0 :type real))
  (:documentation "A charged particle."))

(defmethod print-object ((c charge) stream)
  (format stream "#<CHARGE ~A (~A, ~A)>" (q c) (x c) (y c)))

(defgeneric potential-at (c x y))
  
(defmethod potential-at ((c charge) x y)
  (let ((dx (- x (x c)))
        (dy (- y (y c))))
    (* k (q c) (/ (sqrt (+ (* dx dx) (* dy dy)))) )))


