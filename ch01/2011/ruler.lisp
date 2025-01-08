;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               ruler.lisp
;;;;
;;;;   Started:            Sun Aug 14 00:19:07 2011
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
;;;;   Notes: Compare _Fundamentals of OOP and Data Structures in Java_ pg. 151 inOrderPrint()
;;;;
;;;;

(defpackage :ruler (:use :common-lisp))

(in-package :ruler)

(defun ruler (n)
  (if (= n 1)
      "1"
      (let ((s (ruler (1- n))))
        (format nil "~A ~D ~A" s n s))))

(defun in-order-print (index)
  (when (> index 0)
    (in-order-print (truncate index 2))
    (format t "Index = ~D~%" index)
    (in-order-print (truncate index 2))))

(defun in-order (index)
  (labels ((collect-in-order (index result)
             (if (> index 0)
                 (collect-in-order (truncate index 2) (cons index (collect-in-order (truncate index 2) result)))
                 result)))
    (collect-in-order index '())))
