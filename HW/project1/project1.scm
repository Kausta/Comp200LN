;;; ckorkmaz16@ku.edu.tr    Tue Oct  3 15:14:01 2017
;;; 		   	      
;;; Comp200 Project 1 		   	      
;;; 		   	      
;;; Due Oct ?, 2017 		   	      
;;; 		   	      
;;; Before you start: 		   	      
;;; 		   	      
;;; * Please read the detailed instructions for this project from the
;;; file project1.pdf available in the Assignments section of the
;;; course website. 		   	      
;;; 		   	      
;;; * Please read "Project Submission Instructions" carefully and make
;;; sure you understand everything before you start working on your
;;; project in order to avoid problems.
;;; 		   	      
;;; While you are working: 		   	      
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but
;;; 		   	      
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;; 		   	      
;;; When you are done: 		   	      
;;; * Perform a final save and check-in.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Make sure your file loads without errors.
 		   	      
; Ignore the following line. It is necessary
; so the file loads without errors initially:
(define your-answer-here #f) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;;::
;;; Problem 1: Some Simple Probability Theory
 		   	      
; Description for factorial: (before the definition of each procedure,
; please write a description about what the procedure does and what
; its input and output should be, making sure the lines are commented
; out with semi-colons) 		   	      
 		   	      
(define factorial 		   	      
  (lambda (n) 		   	      
    (define (fact-iter n cur)
      (if (= n 0)
          cur
          (fact-iter (- n 1) (* cur n)))) 		   	      
    (fact-iter n 1)
    ) 		   	      
  ) 		   	      
; Test cases for factorial: (after the definition of each procedure,
; please cut and paste some test cases you have run, making sure the
; lines are commented out with semi-colons)
 		   	      
(factorial 5)  ; -> 120		   	      
(factorial 5)  ; -> 120		   	      
(factorial 10)  ; -> 3628800		   	      
 		   	      
 		   	      
;;; Description for binomial: 		   	      

(define binomial 		   	      
  (lambda (n b) 		   	      
    (/ (factorial n)
       (* (factorial (- n b))
          (factorial b)))
    )
  )
 		   	      
; Test cases for binomial: 		   	      
 		   	      
(binomial 5 1)  ; -> 5 		   	      
(binomial 5 2)  ; -> 10		   	      
(binomial 10 5)  ; -> 252		   	      
 		   	      
 		   	      
;;; Description for binomial-2:
 		   	      
 		   	      
(define binomial-2 		   	      
  (lambda (n b) 		   	      
    (define (bin-2-iter n b cur)
      (if (= b 0)
          cur
          (bin-2-iter (- n 1) (- b 1) (* cur (/ n b)))))	   	      
    (bin-2-iter n b 1))
  ) 		   	      
 		   	      
; Test cases for binomial-2: 		   	      
 		   	      
(binomial-2 5 1)  ; -> 5 		   	      
(binomial-2 5 2)  ; -> 10		   	      
(binomial-2 10 5)  ; -> 252		   	      
 		   	      
 		   	      
;;; Description for exactly-b-smarties:
 		   	      
 		   	      
(define exactly-b-smarties 		   	      
  (lambda (n b p) 		   	      
    (* (binomial-2 n b)
       (expt p b)
       (expt (- 1 p) (- n b))) 		   	      
    )
  ) 		   	      
 		   	      
; Test cases for exactly-b-smarties:
 		   	      
(exactly-b-smarties 1 1 0.5)   ; -> 0.5
(exactly-b-smarties 2 1 0.5)   ; -> 0.5
(exactly-b-smarties 2 2 0.5)   ; -> 0.25
(exactly-b-smarties 2 1 0.3)   ; -> 0.42
(exactly-b-smarties 10 2 0.3)  ; -> 0.23347
; TODO: Code checks, for example b > n 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:;;
;;; Problem 2: More Probability Theory
 		   	      
;;; Description for atleast-b-smarties:
;;; Recursive 		   	      
 		   	      
 		   	      
(define atleast-b-smarties 		   	      
  (lambda (n b p)
    (if (> b n)
        0
        (+ (exactly-b-smarties n b p) (atleast-b-smarties n (+ b 1) p)))
    )
  ) 		   	      
 		   	      
; Test cases for atleast-b-smarties:
 		   	      
(atleast-b-smarties 9 5 0.5)        ; -> 0.5
(atleast-b-smarties 19 10 0.5)      ; -> 0.5
(atleast-b-smarties 10 5 0.6)       ; -> 0.8337
(atleast-b-smarties 15 5 0.3)       ; -> 0.4845
 		   	      
 		   	      
;;; Description for atleast-b-smarties-2:
;;; Iterative 		   	      
(define atleast-b-smarties-2 		   	      
  (lambda (n b p) 		   	      
    (define (iter n b p total)
      (if (> b n)
          total
          (iter n (+ b 1) p (+ total (exactly-b-smarties n b p)))))
    (iter n b p 0)
    )
  ) 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
; Test cases for atleast-b-smarties-2:
 		   	      
(atleast-b-smarties-2 9 5 0.5)        ; -> 0.5
(atleast-b-smarties-2 19 10 0.5)      ; -> 0.5
(atleast-b-smarties-2 10 5 0.6)       ; -> 0.8337
(atleast-b-smarties-2 15 5 0.3)       ; -> 0.4845
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:;:
;;; Problem 3: Choosing a Bag 		   	      
 		   	      
;;; Description for good-bag: 		   	      
 		   	      
(define good-bag 		   	      
  (lambda (n p)
    (if (< n 8)
        #f
        (>= (atleast-b-smarties-2 n 8 p) 0.5))
    )
  ) 		   	      
 		   	      
; Test cases for good-bag: 		   	      
 		   	      
(good-bag 7 1)       ; -> #f 		   	      
(good-bag 8 1)      ; -> #t 		   	      
(good-bag 8 0.5)    ; -> #f		   	      
(good-bag 8 0.99)   ; -> #t		   	      
(good-bag 16 0.5)    ; -> #t		   	      
(good-bag 16 0.7)    ; -> #t		   	      
(good-bag 16 0.4)    ; -> #f		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;::;
;;; Problem 4: Choosing a Value for p
 		   	      
;;; Description of minimum-p 		   	      
; Recursive ?? 		   	      
(define minimum-p 		   	      
  (lambda (n inc)
    (define (iter n inc cur)
      (if (good-bag n cur)
          cur
          (iter n inc (+ cur inc))))
    (iter n inc 0)
    )
  ) 		   	      
 		   	      
your-answer-here 		   	      
; Test cases for minimum-p: 		   	      
(minimum-p 12 0.1)    ; -> 0.7	   	      
(minimum-p 12 0.01)    ; -> 0.63		   	      
(minimum-p 12 0.001)    ; -> 0.622	   	      
(minimum-p 12 0.0001)    ; -> 0.621	   	      
(minimum-p 12 0.00001)    ; -> 0.621	   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:::
;;; Problem 5: Choosing p More Efficiently
 		   	      
;;; Description of minimum-p-new
 		   	      
(define minimum-p-new 		   	      
  (lambda (n inc)
    (define (iter n inc cur times)
      (if (good-bag n cur)
          (let ()
            (display (string-append "Good bag is called " (number->string times) " times"))
            (newline)
            cur)
          (iter n inc (+ cur inc) (+ times 1))))
    (iter n inc 0 0)
    )
  ) 		   	      
your-answer-here 		   	      
 		   	      
; Test cases for minimum-p-new:
 		   	      
(minimum-p-new 15 0.1)    ; -> 5 times, 0.5	   	      
(minimum-p-new 15 0.01)    ; -> 50 times
(minimum-p-new 15 0.001)    ; -> 500 times
(minimum-p-new 15 0.0001)    ; -> 5000 times
(minimum-p-new 15 0.00001)    ; -> 50000 times
 		   	      
 		   	      
;;; Description of minimum-p-binary:
 		   	      
(define minimum-p-binary 		   	      
  (lambda (n inc) 		   	      
     (minimum-p-binary-helper n inc 0 1 0))
  ) 		   	      
 		   	      
 		   	      
(define minimum-p-binary-helper
  (lambda (n inc a b count)
    your-answer-here
    )
  ) 		   	      
 		   	      
 		   	      
; Test cases for minimum-p-binary:
 		   	      
(minimum-p-binary 12 0.1)    ; ->
(minimum-p-binary 12 0.01)    ; ->
(minimum-p-binary 12 0.001)    ; ->
(minimum-p-binary 12 0.0001)    ; ->
(minimum-p-binary 12 0.00001)    ; ->
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;:::;;;
;;; Problem 6: Monte-Carlo Simulations
 		   	      
;;; Description of coin-toss: 		   	      
 		   	      
(define coin-toss 		   	      
  (lambda (p) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
; Test cases for coin-toss: 		   	      
(coin-toss 1)     ; -> 		   	      
(coin-toss 0)     ; -> 		   	      
 		   	      
 		   	      
;;; Description of random-bag: 		   	      
 		   	      
(define random-bag 		   	      
  (lambda (n p) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
; Test cases for random-bag: 		   	      
(random-bag 10 1.0)     ; -> 		   	      
(random-bag 20 1.0)     ; -> 		   	      
(random-bag 100 0.5)     ; -> 		   	      
(random-bag 100 0.0)     ; -> 		   	      
(random-bag 10 0.0)     ; -> 		   	      
(random-bag 100 0.0001)     ; ->
 		   	      
;;; Description of get-m-bags: 		   	      
 		   	      
(define get-m-bags 		   	      
  (lambda (m n p) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
; Test cases for get-m-bags: 		   	      
(get-m-bags 1 10 1)      ; -> 		   	      
(get-m-bags 2 20 1)      ; -> 		   	      
(get-m-bags 0 10 1)      ; -> 		   	      
(get-m-bags 100 10 0.0001)      ; ->
(get-m-bags 100 4 0.25)      ; ->
 		   	      
;;; Description of estimate-good-probability:
 		   	      
(define estimate-good-probability
  (lambda (m n p t) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
; Test cases for estimate-good-probability:
 		   	      
(estimate-good-probability 24 12 0.5 1000)    ; ->
(estimate-good-probability 24 16 0.5 1000)    ; ->
(estimate-good-probability 24 16 0.3 1000)    ; ->
(estimate-good-probability 24 16 0.2 1000)    ; ->
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;:::;;:
;;; Problem 7: Monte-Carlo Again
 		   	      
;;; Description of estimate-good-probability-2:
 		   	      
 		   	      
(define estimate-good-probability-2
  (lambda (m n p q t) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
;New defination of the "good-bag"
;o is the number of orange smarties in the current bag
(define good-bag-new 		   	      
  (lambda (n p q o) 		   	      
your-answer-here 		   	      
)) 		   	      
;this new get-m-bags-new first chooses the orange smarties with the given probability of p than
;pass it to the good-bag-new function to the jobs.
(define get-m-bags-new 		   	      
  (lambda (m n p q) 		   	      
your-answer-here 		   	      
)) 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;:::;;;;::;;;;
; END OF PROJECT 		   	      
 		   	      
