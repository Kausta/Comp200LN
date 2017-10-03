;;; ckorkmaz16@ku.edu.tr    Mon Sep 25 17:30:20 2017
;;; 		   	      
;;; Comp200 Project 0 		   	      
;;; 		   	      
;;; Note: The questions for this project are available at the course website.
;;;   Type all your work and notes in the appropriate sections of this file.
;;;   Please do not delete any of the existing lines.
;;;   Please do not make any modifications after midnight on the due date.
;;;   Semicolon is the Scheme comment character.
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:::;::;;;:
;;; 2.1 Preparing your project material for submission
#lang racket 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:::;::;;:;
;;; 2.2 Expressions to Evaluate
;;;
;;; The following test cases explore the evaluation of simple expressions
;;;

-37
; Value: -37

(* 8 9)
; Value: 72

(> 10 9.7)
; Value: #t (True)

(- (if (> 3 4)
       7
       10)
   (/ 16 10))
; -> (- 10 1.6)
; Value: 8.4

(* (- 25 10)
   (+ 6 3))
; -> (* 15 9)
; Value: 135

+
; Procedure +

(define double (lambda (x) (* 2 x)))
; Unspecified

double
; Procedure double

(define c 4)
; Unspecified

c
; Value: 4

(double c)
; Value: 8

c
; Value: 4

(double (double (+ c 5)))
; -> (double (double 9))
; Value: 36

(define times-2 double)
; Unspecified

(times-2 c)
; 8

(define d c)
; Unspecified

(= c d)
; #t

(cond ((>= c 2) d)
      ((= c (- d 5)) (+ c d))
      (else (abs (- c d)))) 		   	      
; `c` is 4, so the first condition is, therefore the result is `d`
; Value: 4

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:::;::;;::
;;; 2.3 Pretty Printing
(define abs
  (lambda (a)
    (if (> a 0)
        a
        (- a))))
; Tab is used when we change the code and want to re-indent it without adding any line breaks
; So unlike enter, which puts a line break and indents properly on the next line,
; tab re-indents the area we selected without adding any line breaks

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:::;::;:;;
;;; 2.4 Tracing
(require racket/trace)

(define (fun x)
  (if (zero? x)
    1
    (* x (fun (- x 1)))))

(trace fun)

(fun 4)

;; Expected Output:
; >(fun 4)
; > (fun 3)
; > >(fun 2)
; > > (fun 1)
; > > >(fun 0)
; < < <1
; < < 1
; < <2
; < 6
; <24
; 24
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:::;::;:;:
;;; 2.5 Documentation and Administrative Questions

; 1- DrRacket's debugger works like any other debugger in different IDEs, such that it allows one to evaluate expressions one-by-one
;       and also evaluate sub-expressions one-by-one by pausing, stepping, stepping out and stepping over
;    Tracing: When a traced procedure is called, the called function is printed.
;             Then, as traced procedures invoke each other (including the first called function itself, as it's also traced,
;                 it will trace again when it invokes itself), nested invocations are printed in a nested way
;             Each invocation will be nested one more time than the previous, up to 10 invocations, and after that a number will be printed
;                 to state the nesting.
;             Then the values are shown in the reverse order, starting from the last invocation to the first one (FILO), printing one
;                 less nesting prefix per value
; 2- if, define, lambda, cond
; 3- Racket reference says nothing about character cases in expressions, and when we try,
;      we see that racket is case-sensitive when it comes to identifiers in the expressions.
;      However GNU/MIT-Scheme reference says that:
;          Scheme doesn't distinguish uppercase and lowercase forms of a letter except within character and string constants;
;          in other words, Scheme is case-insensitive. For example, `Foo' is the same identifier as `FOO',
;          and `#x1AB' is the same number as `#X1ab'. But `#\a' and `#\A' are different characters.
;      Which implies that Scheme is case-insensitive when it comes to identifiers, but case-sensitive for string constants and characters
; 4- Nothing in the document itself, but the mail in this question is not correct (no such mail comp200-common@ku.edu.tr)
;
;