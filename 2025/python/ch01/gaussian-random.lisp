#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is the medium of choice for people who enjoy free style and flexibility.
;;;;   -- Gerald Jay Sussman
;;;;
;;;;   Name:               gaussian-random.lisp
;;;;
;;;;   Started:            Sun Feb 23 15:04:13 2025
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
;;;;   Notes: Ex. 1.2.24
;;;;
;;;;
(defpackage :gaussian-random (:use :common-lisp))

(in-package :gaussian-random)

;;;
;;;    https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
;;;    
(defun box-muller (u v)
  (assert (> u 0) () "Box-Muller does not abide zero values for u.")
  (let ((r (sqrt (* -2d0 (log u))))
        (θ (* 2d0 pi v)))
    (values (* r (cos θ)) (* r (sin θ)))) )

(let* ((rs (make-random-state t))
       (u (random 1d0 rs))
       (v (random 1d0 rs)))
  (multiple-value-bind (z₀ z₁) (box-muller u v)
    (format t "Uniform (~F,~F) -> Gaussian (~F,~F)~%" u v z₀ z₁)))
