#lang racket
; This doesn't work since stream-cons is special
;(define s-cons stream-cons)
(define s-car stream-first)
(define s-cdr stream-rest)
;
(define x (stream-cons 99 (/ 1 0)))
(s-car x)
; Doesn't give error until this line
;(s-car (s-cdr x))

(define ones (stream-cons 1 ones))

; Exercise 2's
; My ints
(define (make-counter)
  (let ((curr 0))
    (lambda (x)
      (set! curr (+ curr 1))
      curr)))
(define ints1 (stream-map (make-counter) ones))
(s-car ints1)
(s-car (s-cdr ints1))
(s-car (s-cdr (s-cdr ints1)))

; 
(define (ints-helper n)
  (stream-cons n (ints-helper (+ n 1))))
(define ints2 (ints-helper 1))
(s-car ints2)
(s-car (s-cdr ints2))
(s-car (s-cdr (s-cdr ints2)))

;
; (define ints3 (stream-cons 1 (stream-map + ones ints3)))
(define ints3 (stream-cons 1 (stream-map (lambda (x) (+ x 1)) ints3)))
(s-car ints3)
(s-car (s-cdr ints3))
(s-car (s-cdr (s-cdr ints3)))


; Sieve
(define (divisible? a b)
  (= (remainder a b) 0))
(define (sieve str)
  (stream-cons (s-car str) (sieve (stream-filter (lambda (x) (not (divisible? x (s-car str)))) (s-cdr str)))))
(define curr_sieve (sieve (s-cdr ints2)))
; First 7 primes
(map (lambda (at) (stream-ref curr_sieve at)) `(0 1 2 3 4 5 6))

