;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp...not just beautiful, but strangely beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               ch1.2.lisp
;;;;
;;;;   Started:            Sat Aug 27 00:56:56 2011
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

(defpackage :ch1.2 (:use :common-lisp))

(in-package :ch1.2)

;;;
;;;    1.2.18
;;;
(defun displacement (x y)
  (sqrt (+ (* x x) (* y y))))

(defun displacement (x y)
  (abs (complex x y)))

(defclass point ()
  ((x :reader x :initarg :x)
   (y :reader y :initarg :y)))

(defun distance (p1 p2)
  (sqrt (+ (square (- (x p1) (x p2)))
           (square (- (y p1) (y p2)))) ))

(defun square (x)
  (* x x))

(defvar *origin* (make-instance 'point :x 0 :y 0))

(defun distance-from-origin (p)
  (distance p *origin*))

;;;
;;;    1.2.20
;;;
(defun dice ()
  (+ (random-die) (random-die)))

(defun random-die ()
  (1+ (random 6 (make-random-state t))))