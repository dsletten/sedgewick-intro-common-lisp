;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   LISP has been jokingly described as "the most intelligent way to misuse a computer".
;;;;   -- Edsger W. Dijkstra
;;;;
;;;;   Name:               polar-coordinates-clos.lisp
;;;;
;;;;   Started:            Sat Feb 22 22:23:09 2025
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
(load "/home/slytobias/lisp/packages/test.lisp")

(defpackage :polar-coordinates-clos
  (:use :common-lisp :core :test)
  (:export :r :theta :cartesian->polar))

(in-package :polar-coordinates-clos)

(defclass polar-coordinates ()
  ((r :reader r :initarg :r)
   (θ :reader θ :initarg :θ)))

(defun cartesian->polar (x y)
  (flet ((hypotenuse (x y)
           (sqrt (+ (* x x) (* y y)))) )
    (make-instance 'polar-coordinates :r (hypotenuse x y) :θ (atan y x))))

(defmethod print-object ((pc polar-coordinates) stream)
  (print-unreadable-object (pc stream :type t)
    (format stream "r: ~F θ: ~F" (r pc) (θ pc))))

(deftest test-polar-coordinates ()
  (let ((pc (cartesian->polar 3d0 4d0)))
    (check
     (= 5.0 (r pc))
     (= 0.9272952180016122d0 (θ pc))))
  (let ((pc (cartesian->polar 3d0 3d0)))
    (check
     (= 4.242640687119285d0 (r pc))
     (= 0.7853981633974483d0 (θ pc))))
  (let ((pc (cartesian->polar 0d0 0d0)))
    (check
     (= 0d0 (r pc))
     (= 0d0 (θ pc))))
  (let ((pc (cartesian->polar -0d0 0d0)))
    (check
     (= 0d0 (r pc))
     (= pi (θ pc))))
  (let ((pc (cartesian->polar 0d0 -0d0)))
    (check
     (= 0d0 (r pc))
     (= -0d0 (θ pc))))
  (let ((pc (cartesian->polar -0d0 -0d0)))
    (check
     (= 0d0 (r pc))
     (= (- pi) (θ pc))))
  (let ((pc (cartesian->polar 0d0 8d0)))
    (check
     (= 8d0 (r pc))
     (= (/ pi 2) (θ pc))))
  (let ((pc (cartesian->polar 8d0 0d0)))
    (check
     (= 8d0 (r pc))
     (= 0d0 (θ pc))))
  (let ((pc (cartesian->polar -8d0 0d0)))
    (check
     (= 8d0 (r pc))
     (= pi (θ pc)))) )
