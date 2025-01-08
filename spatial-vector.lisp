;#!/usr/local/bin/sbcl --script

;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Programming should be fun. Programs should be beautiful.
;;;;   -- Paul Graham
;;;;
;;;;   Name:               spatial-vector.lisp
;;;;
;;;;   Started:            Wed Dec 29 00:34:26 2010
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
;;;;   Notes: See pg. 430
;;;;
;;;;

(defpackage sedgewick (:use common-lisp))

(in-package sedgewick)

(defclass spatial-vector ()
  ((coordinates :reader coordinates :initarg :coordinates))
  (:documentation "A vector."))

(defgeneric plus (u v))
(defgeneric minus (u v))
(defgeneric times (c v))
(defgeneric dot (u v))
(defgeneric magnitude (v))
(defgeneric direction (v))
(defgeneric cartesian (v i))

;;;
;;;    Constructor should copy :coordinates arg
;;;

(defmethod print-object ((v spatial-vector) stream)
  (format stream "#<SPATIAL-VECTOR ~S>" (coordinates v)))

;;;
;;;    Error checking! (Different lengths?)
;;;    
(defmethod plus ((u spatial-vector) (v spatial-vector))
  (make-instance 'spatial-vector :coordinates (map 'vector #'+ (coordinates u) (coordinates v))))

(defmethod minus ((u spatial-vector) (v spatial-vector))
  (make-instance 'spatial-vector :coordinates (map 'vector #'- (coordinates u) (coordinates v))))

(defmethod times ((c real) (v spatial-vector))
  (make-instance 'spatial-vector :coordinates (map 'vector #'(lambda (elt) (* c elt)) (coordinates v))))

(defmethod dot ((u spatial-vector) (v spatial-vector))
  (reduce #'+ (map 'vector #'* (coordinates u) (coordinates v))))

(defmethod magnitude ((v spatial-vector))
  (sqrt (reduce #'+ (map 'vector #'(lambda (x) (* x x)) (coordinates v)))) )

(defmethod direction ((v spatial-vector))
  (let ((magnitude (magnitude v)))
    (make-instance 'spatial-vector :coordinates (map 'vector #'(lambda (elt) (/ elt magnitude)) (coordinates v)))) )
