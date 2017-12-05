; My Implementation of R5RS Streams from delay

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

; define-syntax for cons-stream from https://stackoverflow.com/questions/5610480/scheme-sicp-r5rs-why-is-delay-not-a-special-form
;(define-syntax s-cons
;  (syntax-rules ()
;    ((s-cons x y) (cons x (delay y)))))

;  however, having another delay on x is preferable, for functions like stream append, we may traverse the stream without evaluating first arguments
(define-syntax s-cons
  (syntax-rules ()
    ((s-cons x y) (cons (delay x) (delay y)))))

(define (stream? str)
  (and (pair? str)
       ; (promise? (cdr str)) ; Not implemented in R5RS
       ))

; Stream car and cdr
(define (s-car str)
  (if (stream? str)
      (force (car str))
      (error "s-car expects stream for argument" str)))
(define (s-cdr str)
  (if (stream? str)
      (force (cdr str))
      (error "s-cdr expects stream for argument" str)))

; Basic tests
(define (test-ones)
  (letrec ((ones (s-cons 1 ones)))
    (and (equal? (s-car ones) 1)
         (equal? (s-car (s-cdr ones)) 1))))

(define (test-divide-0)
  (let ((shouldnt-give-error (s-cons 2 (/ 1 0))))
    (equal? (s-car shouldnt-give-error) 2)))

(test test-ones test-divide-0)

; Empty stream
(define empty-stream '())
(define s-empty? null?)

(define (test-empty)
  (and 
   (let ((str (s-cons 1 empty-stream)))
     (s-empty? (s-cdr str)))))
(test test-empty)

; For defining streams
; Used like (list ...)
; (stream arg1 arg2 ...) is equivalent to (s-cons arg1 (s-cons arg2 (... ( empty-stream))...))
(define-syntax stream
  (syntax-rules ()
    ((stream) empty-stream)
    ((stream x) (s-cons x empty-stream))
    ((stream x y ...) (s-cons x (stream y ...)))))

(define (test-stream)
  (and
   (let ((str (stream)))
     (s-empty? str))
   (let ((str (stream 1 2)))
     (and (equal? (s-car str) 1)
          (equal? (s-car (s-cdr str)) 2)
          (s-empty? (s-cdr (s-cdr str))))
     )))
(test test-stream)
; For cases that x is already a delay, internal
(define-syntax s-cons-nolazy
  (syntax-rules ()
    ((s-cons-nolazy x y) (cons x (delay y)))))
; s-car no force (for appending without evaluating)
(define (s-car-lazy str)
  (if (stream? str)
      (car str)
      (error "s-car-lazy expects stream for argument" str)))

; Stream Append
; Doesn't terminate for infinite streams
(define (s-append str1 str2)
  (cond ((s-empty? str1) str2)
        ((s-empty? str2) str1)
        (else (s-cons-nolazy (s-car-lazy str1) (s-append (s-cdr str1) str2)))))

(define (test-append)
  (and
   (let* ((str1 (stream 1 2))
          (str2 (stream 3 4))
          (sapp (s-append str1 str2)))
     (define (helper curr-str curr-expected)
       (cond ((and (s-empty? curr-str) (null? curr-expected)) #t)
             ((s-empty? curr-str) (error "Stream ended early"))
             ((null? curr-expected) (error "Expected list ended early"))
             ((equal? (s-car curr-str) (car curr-expected)) (helper (s-cdr curr-str) (cdr curr-expected)))
             (else #f))
       )
     (helper sapp '(1 2 3 4)))
   ))
(test test-append)


