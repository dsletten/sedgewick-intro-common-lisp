#!/usr/bin/sbcl --script
;;;;   Hey, Emacs, this is a -*- Mode: Lisp; Syntax: Common-Lisp -*- file!
;;;;
;;;;   APL is like a perfect diamond: if you add anything to it, it becomes flawed. In contrast, Lisp is like a ball of mud--if you add more to it, you get a bigger ball of mud.
;;;;   -- Joel Moses (attributed)
;;;;
;;;;   Name:               mercator-projection.lisp
;;;;
;;;;   Started:            Thu Mar  6 16:06:48 2025
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
;;;;   Notes: Ex. 1.2.28
;;;;   https://en.wikipedia.org/wiki/Mercator_projection
;;;;   Book's formula assumes that R = 1
;;;;   φ latitude
;;;;   λ longitude
;;;;   According to Wikipedia: "The angles λ and φ are expressed in radians."
;;;;   (Presumably so is λ₀?)
;;;;
;;;;   https://epsg.io/transform#s_srs=4326&t_srs=3857&x=-77.6724165&y=39.1289048
;;;;                                                  ^^^           ^^^
;;;;                                                  Long.         Lat.
;;;;
;;;;   The conversion from degrees to radians is (mildly) sensitive to the order of
;;;;   operations:
;;;;   (* θ (/ pi 180d0)) ≡ (* pi θ (/ 180d0))
;;;;   vs.
;;;;   (/ (* θ pi) 180d0)
;;;;
;;;;   Examples:
;;;;   (degrees->radians  3) => 0.05235987755982989d0
;;;;   (degrees->radians* 3) => 0.05235987755982988d0
;;;;   (degrees->radians  39.12890482835249d0) => 0.6829282219542576d0
;;;;   (degrees->radians* 39.12890482835249d0) => 0.6829282219542575d0
;;;;
;;;;   mercator-projection.lisp 0.0 39.12890482835249 -77.67241646981815
;;;;   Latitude: 39.12890482835249° Longitude: -77.67241646981815° -> (-8646453.850103231 m, 4740152.939168426 m)
;;;;                                                                                                         ^
;;;;   The Prolog and Io versions of this program naturally favored the second expression
;;;;   degrees_to_radians(D, R) :- R is D * pi / 180.0.
;;;;   degreesToRadians := method(θ, θ * Number constants pi / 180)
;;;;
;;;;   mercator-projection.io 0 39.12890482835249 -77.67241646981815
;;;;   Latitude: 39.1289048283524892° Longitude: -77.6724164698181454° -> (-8646453.8501032311469316 m, 4740152.9391684243455529 m)
;;;;                                                                                                                    ^
;;;;   mercator_projection.pl 0 39.12890482835249 -77.67241646981815
;;;;   Latitude: 39.12890482835249° Longitude: -77.67241646981815° -> (-8646453.850103231 m, 4740152.939168424 m)
;;;;                                                                                                         ^
;;;;   Lua has a built-in conversion that produces the same result as the first expression
;;;;   mercator-projection.lua 0 39.12890482835249 -77.67241646981815
;;;;   Latitude: 39.128905° Longitude: -77.672416° -> (-8646453.8501032311469316 m, 4740152.9391684262081981 m)
;;;;                                                                                                ^
;;;;   Unfortunately, Dylan and Oz do not provide enough precision to observe the issue:
;;;;   _build/bin/mercator-projection 0 39.1289048 -77.6724164
;;;;   Latitude: 39.128905d0° Longitude: -77.672416d0° -> (-8646453.8d0 m, 4740152.9d0 m)
;;;;   ozengine MercatorProjection.oza 0 39.12890482835249 -77.67241646981815
;;;;   Latitude: 39.129° Longitude: -77.672° -> (-8.6464e06 m, 4.7401e06 m)
;;;;
;;;;   Clojure and Java rely on Math.toRadians():
;;;;   private static final double DEGREES_TO_RADIANS = 0.017453292519943295;
;;;;   public static double toRadians(double angdeg) {
;;;;       return angdeg * DEGREES_TO_RADIANS;
;;;;   }

(load "/home/slytobias/lisp/packages/core")
(load "/home/slytobias/lisp/packages/io")
(load "/home/slytobias/lisp/packages/shell")

(defpackage :mercator-projection (:use :common-lisp :core :io :shell))

(in-package :mercator-projection)

(defconstant r 6378137d0) ; Earth equatorial mean radius (m) https://en.wikipedia.org/wiki/World_Geodetic_System

(defun degrees->radians (θ)
  (* θ (/ pi 180d0)))

(defun mercator-projection-degrees (&rest args)
  (apply #'mercator-projection (mapcar #'degrees->radians args)))

(defun mercator-projection (λ₀ λ φ)
  "The angles λ and φ are expressed in radians."
  (values (* r (- λ λ₀))
          (* r (* 0.5d0 (log (/ (+ 1 (sin φ)) (- 1 (sin φ)))) ))))

(when (= (length (get-args)) 3)
  (if-let (λ₀ (read-num (get-argv 0) :test #'(lambda (λ₀) (<= -180 λ₀ 180))))
    (if-let (φ (read-num (get-argv 1) :test #'(lambda (φ) (< -90 φ 90))))
      (if-let (λ (read-num (get-argv 2) :test #'(lambda (λ) (<= -180 λ 180))))
        (multiple-value-bind (x y) (mercator-projection-degrees λ₀ λ φ)
          (format t "Latitude: ~F° Longitude: ~F° -> (~F m, ~F m)~%" φ λ x y))
        (format *error-output* "Invalid longitude (λ): ~A~%" (get-argv 2)))
      (format *error-output* "Invalid latitude (φ): ~A~%" (get-argv 1)))
    (format *error-output* "Invalid center (λ₀): ~A~%" (get-argv 0))))


;31.24396, 121.5065    上海
;(13526041.708072895 m, 3664472.6874608034 m)

;39.12890482835249, -77.67241646981815 家
;-8646453.850103231 4740152.939168426


