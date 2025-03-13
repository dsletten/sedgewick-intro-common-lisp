#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a programmable programming language.
;;;;   -- John Foderaro
;;;;
;;;;   Name:               day-of-week.lisp
;;;;
;;;;   Started:            Thu Feb 27 14:40:02 2025
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
;;;;   Notes: Ex. 1.2.26
;;;;
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")
(load "/home/slytobias/lisp/packages/time")

(defpackage :day-of-week (:use :common-lisp :core :io :shell :time))

(in-package :day-of-week)

(defun day-of-week (d m y)
  (let* ((y₀ (- y (floor (- 14 m) 12)))
         (x (+ y₀ (floor y₀ 4) (- (floor y₀ 100)) (floor y₀ 400)))
         (m₀ (+ m (* 12 (floor (- 14 m) 12)) -2)))
    (mod (+ d x (floor (* 31 m₀) 12)) 7)))

;;;
;;;    Weird processing args out of order?
;;;    
;; (when (= (length (get-args)) 3)
;;   (let* ((m (read-num (get-argv 0) :test (every-pred #'integerp #'(lambda (m) (<= 1 m 12)))) )
;;          (y (read-num (get-argv 2) :test (every-pred #'integerp (partial #'<= 1582))))
;;          (d (read-num (get-argv 1) :test (every-pred #'integerp (partial* #'valid-day-p m y)))) )  <-- Can't evaluate if M,Y are NIL!
;;     (if (some #'null (list m d y))
;;         (format *error-output* "Corrupt~%")
;;         (let ((dow (day-of-week d m y)))
;;           (format t "~D (~A)~%" dow (get-day-of-week-name (mod (+ dow 6) 7)))) )))

(when (= (length (get-args)) 3)
  (if-let (m (read-num (get-argv 0) :test (every-pred #'integerp #'(lambda (m) (<= 1 m 12)))) )
    (if-let (y (read-num (get-argv 2) :test (every-pred #'integerp (partial #'<= 1582))))
      (if-let (d (read-num (get-argv 1) :test (every-pred #'integerp (partial* #'valid-day-p m y))))
        (let ((dow (day-of-week d m y)))
          (format t "~D (~A)~%" dow (get-day-of-week-name (mod (+ dow 6) 7))))
        (format *error-output* "Invalid day of month: ~A~%" (get-argv 1)))
      (format *error-output* "Invalid year: ~A~%" (get-argv 2)))
    (format *error-output* "Invalid month: ~A~%" (get-argv 0))))


