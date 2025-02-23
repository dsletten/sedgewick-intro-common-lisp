#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   What I like about Lisp is that you can feel the bits between your toes.
;;;;   -- Drew McDermott
;;;;
;;;;   Name:               wind-chill.lisp
;;;;
;;;;   Started:            Mon Feb 17 22:39:13 2025
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
;;;;   Notes: Ex. 1.2.22
;;;;   https://www.weather.gov/ffc/wci
;;;;   https://www.weather.gov/ffc/metcalc
;;;;   https://www.weather.gov/epz/wxcalc_windchill
;;;;   http://en.wikipedia.org/wiki/Wind_chill
;;;;
(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :wind-chill
  (:use :common-lisp :core :shell :io)
  (:shadow :t))

(in-package :wind-chill)

(defun wind-chill (t v)
  (+ 35.74d0 (* 0.6215d0 t) (* (- (* 0.4275d0 t) 35.75d0) (expt v 0.16d0))))

(when (= (length (get-args)) 2)
  (let ((t (read-num (get-argv 0) :test #'(lambda (t) (<= -50 t 50))))
        (v (read-num (get-argv 1) :test #'(lambda (v) (<= 3 v 120)))) )
    (if (some #'null (list t v))
        (format *error-output* "Corrupt~%")
        (format cl:t "Wind chill: ~,2F~%" (wind-chill t v)))) )

;; (loop for t in '(40 37 12 0 -7)
;;       nconc (loop for v in '(5 20 45 75)
;;                   collect (list t v (wind-chill t v))))

;; (40 5 36.47240485832117d0) 
;; (40 20 30.4807859131122d0) 
;; (40 45 26.30799816069483d0) 
;; (40 75 23.387517939630655d0) 
;; (37 5 32.94872840957032d0) 
;; (37 20 26.545085266118427d0) 
;; (37 45 22.08534843635654d0) 
;; (37 75 18.964036264433666d0) 
;; (12 5 3.584758003313347d0) 
;; (12 20 -6.252420125496236d0) 
;; (12 45 -13.103399266462446d0) 
;; (12 75 -17.898311028874517d0) 
;; (0 5 -10.509947791689996d0) 
;; (0 20 -21.99522271347127d0) 
;; (0 45 -29.993998163815554d0) 
;; (0 75 -35.592237729662436d0) 
;; (-7 5 -18.73185950544195d0) 
;; (-7 20 -31.17852422312338d0) 
;; (-7 45 -39.84684752060487d0) 
;; (-7 75 -45.91369497178873d0) 
