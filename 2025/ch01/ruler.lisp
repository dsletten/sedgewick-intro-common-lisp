#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   In Lisp there is always more than one way to solve a problem.
;;;;   -- David Touretzky
;;;;
;;;;   Name:               ruler.lisp
;;;;
;;;;   Started:            Thu Jan  9 02:33:44 2025
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
(load "/home/slytobias/lisp/packages/shell")

(defpackage :ruler (:use :common-lisp :shell))

(in-package :ruler)

;; (defun ruler (n)
;;   (when (> n 1)
;;     (ruler (1- n)))
;;   (write-line (make-string n :initial-element #\—))
;;   (when (> n 1)
;;     (ruler (1- n))))

(defun ruler (n)
  (flet ((draw ()
           (write-line (make-string n :initial-element #\—))))
    (cond ((= n 1) (draw))
          (t (ruler (1- n))
             (draw)
             (ruler (1- n)))) ))

;; (defun ruler (n)
;;   (when (> n 0)
;;     (ruler (1- n))
;;     (write-line (make-string n :initial-element #\—))
;;     (ruler (1- n))))

(ruler (parse-integer (first (get-args))))

