#!/usr/bin/racket
; Lang: R5RSi

(define (display-all . args)
  (for-each 
    (lambda (arg)
      (display arg) (newline))
    args))

; Error if not defined
(define (error reason . args)
      (display "Error: ")
      (display reason)
      (for-each (lambda (arg) 
                  (display " ")
          (write arg))
        args)
      (newline)
      (scheme-report-environment -1))  ;; we hope that this will signal an error

; Test function
(define (test . functions)
  (for-each
   (lambda (fn)
     (cond ((fn) (display "Test case succeeded for: "))
           (else (display "Test case failed for: ")))
     (write fn)
     (newline))
   functions))


; vCombined

(define (eval exp)
  (cond 
    ((number? exp) exp)
    ;((sum? exp) (eval-sum exp)) ; Should be internal
    ((symbol? exp) (lookup exp))
    ((define? exp) (eval-define exp))
    ;((greater? exp) (eval-greater exp)) ; Should be internal
    ((if? exp) (eval-if exp))
    ((application? exp) (apply (eval (car exp))
                               (map eval (cdr exp))))
    (else (error "Cannot parse exp" exp))))

; Things like +, > can be internal function
;   can be after application

(define (sum? exp)
  (and (pair? exp) (equal? (car exp) '+)))
(define (define? exp)
  (and (pair? exp) (equal? (car exp) 'define)))
(define (if? exp)
  (and (pair? exp) (equal? (car exp) 'if)))
;(define (eval-sum exp)
;  (+ (eval (cadr exp))
;     (eval (caddr exp))))

(define (test-sum)
  (and 
    (equal? (eval '(+ 3 4)) 7)
    (equal? (eval '(+ 2 (+ 13 4))) 19)))

; For make tablei
(define table-tag `table)
(define (make-table) (list table-tag))
(define (table-get table name) (assoc name (cdr table)))
(define binding-value cadr)
(define (table-put! tbl name val)
  (set-cdr! tbl (cons (list name val) (cdr tbl))))
; Normally with make table abstraction
(define env (make-table))
(define (lookup name)
  (let ((binding (table-get env name)))
    (if (null? binding)
      (error "No such variable" name)
      (binding-value binding))))
(define (eval-define exp)
  (let ((name (cadr exp))
        (valexp (caddr exp)))
    (table-put! env name (eval valexp))))

(define (test-def-look)
  (equal? 11 (begin (eval '(define x (+ 4 5)))
                    (eval '(+ x 2)))))

; Conditionals
;(define (greater? exp)
;  (and (pair? exp) (equal? (car exp) '>)))
;(define (eval-greater exp)
;  (> (eval (cadr exp)) 
;     (eval (caddr exp))))

(define (eval-if exp)
  (let ((pred (cadr exp))
        (consequent (caddr exp))
        (alternative (cadddr exp)))
    (let ((test (eval pred)))
      (cond ((eq? test #t) (eval consequent))
            ((eq? test #f) (eval alternative))
            (else (error "Not a valid if case" exp))))))

(define (test-greater)
  (and (eval '(> 10 4)) (not (eval '(> 4 5))) (eval '(> x 3))))
(define (test-if)
  (equal? 11 (begin (eval '(define y 9))
                    (eval '(if (> y 6) (+ y 2) 15)))))

(define (make-primitive scheme-proc)
  (list 'primitive scheme-proc))
(define (primitive? a)
  (and (pair? a) (eq? 'primitive (car a))))
(define get-scheme-proc cadr)
(define (application? exp)
  (and (pair? exp)))

(table-put! env '+ (make-primitive +))
(table-put! env '> (make-primitive >))

(define scheme-apply apply)
(define (apply operator operands)
  (cond ((primitive? operator) 
         (scheme-apply (get-scheme-proc operator) (operator)))
        (else (error "Cannot apply" operator))))

(test test-sum test-def-look test-greater test-if)
