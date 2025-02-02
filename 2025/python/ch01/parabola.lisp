;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   Pascal is for building pyramids—imposing, breathtaking, static structures built by armies pushing heavy blocks into place. Lisp is for building organisms...
;;;;   -- Alan Perlis
;;;;
;;;;   Name:               parabola.lisp
;;;;
;;;;   Started:            Wed Jan 22 17:44:56 2025
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
(load "/home/slytobias/lisp/packages/core.lisp")
(load "/home/slytobias/lisp/packages/test.lisp")

(defpackage :parabola
  (:use :common-lisp :core :test)
  (:export :parabola :a :b :c :first-root :second-root))

(in-package :parabola)

(defclass parabola ()
  ((a :reader a :initarg :a :initform 0)
   (b :reader b :initarg :b :initform 0)
   (c :reader c :initarg :c :initform 0)
   (root1 :reader first-root :initform nil)
   (root2 :reader second-root :initform nil)))

(defmethod initialize-instance :after ((p parabola) &rest initargs)
  (declare (ignore initargs))
  (calculate-roots p))

;;;    Goldberg -- What Every Computer Scientist Should Know... pg. 162
(defun calculate-roots (parabola)
  (flet ((normalize-root (root)
           (if (zerop root)
               (abs root)
               root)))
    (with-slots (a b c root1 root2) parabola
      (assert (every #'numberp (list a b c)) (a b c) "A, B, and C must all be numbers.")
      (symbol-macrolet ((discriminant (- (* b b) (* 4 a c)))) ; 4d0??
        (if (>= b 0)
            (setf root1 (normalize-root (/ (* 2 c) (- (- b) (sqrt discriminant))))
                  root2 (normalize-root (/ (- (- b) (sqrt discriminant)) (* 2 a))))
            (setf root1 (normalize-root (/ (+ (- b) (sqrt discriminant)) (* 2 a)))
                  root2 (normalize-root (/ (* 2 c) (+ (- b) (sqrt discriminant)))) )))) ))

(defmethod print-object ((p parabola) stream)
  (flet ((quadratic-term (a &optional (var 'x))
           (let ((var-name (string-downcase (symbol-name var))))
             (cond ((zerop a) "")
                   ((= a 1) (format nil "~A²" var-name))
                   (t (format nil "~F~A²" a var-name)))) )
         (linear-term (b &optional (var 'x)) ; Not quite right when a = 0: +2.0x+3.0
           (let ((var-name (string-downcase (symbol-name var))))
             (cond ((zerop b) "")
                   ((= b 1) (format nil "+~A" var-name))
                   ((= b -1) (format nil "-~A" var-name))
                   (t (format nil "~@F~A" b var-name)))) )
         (constant-term (c)
           (cond ((zerop c) "")
                 (t (format nil "~@F" c)))) )
    (print-unreadable-object (p stream)
      (format stream "~A~A~A [~F ~F]"
              (quadratic-term (a p)) (linear-term (b p)) (constant-term (c p))
              (first-root p) (second-root p)))) )

(deftest test-parabola ()
  (check
   (let ((p (make-instance 'parabola :a 1 :b 1 :c 1)))
     (and (complexp (first-root p))
          (complexp (second-root p))))
   (let ((p (make-instance 'parabola :a 1 :b -16 :c 63)))
     (and (= 9 (first-root p))
          (= 7 (second-root p))))
   (let ((p (make-instance 'parabola :a 2 :b -6 :c -20)))
     (and (= 5 (first-root p))
          (= -2 (second-root p))))
   (let ((p (make-instance 'parabola :a 1 :b 0 :c -64)))
     (and (= 8 (first-root p))
          (= -8 (second-root p))))
   (let ((p (make-instance 'parabola :a 1 :b 2)))
     (eql 0.0 (first-root p)))) ) ; Root is normalized: not -0.0
