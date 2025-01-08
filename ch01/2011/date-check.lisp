#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Lisp is a language for doing what you've been told is impossible.
;;;;   -- Kent Pitman
;;;;
;;;;   Name:               date-check.lisp
;;;;
;;;;   Started:            Sun Sep 11 15:52:00 2011
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
(load "/Users/dsletten/lisp/packages/command-line")
(load "/Users/dsletten/lisp/packages/time")

(defpackage :date-check (:use :common-lisp :command-line :time))

(in-package :date-check)

(defun valid-month-p (m)
  (and (numberp m)
       (zerop (nth-value 1 (truncate m)))
       (<= 1 m 12)))

(defun valid-day-p (m d)
  (and (numberp d)
       (zerop (nth-value 1 (truncate d)))
       (<= 1 d (month-length m))))

(defun check-date (m d)
  (case m
    (3 (>= d 20))
    ((4 5) t)
    (6 (<= d 20))
    (otherwise nil)))

(defscript date-check (m d)
  (if (and (valid-month-p m)
           (valid-day-p m d))
      (format t "~:[false~;true~]~%" (check-date m d))
      (format t "The values ~A and ~A do not represent a valid month and day for the year ~D~%" m d (get-year))))

