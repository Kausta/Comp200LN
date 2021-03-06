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
 		   	      
; Description for factorial: Calculates the factorial of a given integer iteratively
; where 0! is 1 and n! = n * (n-1)!
 		   	      
(define factorial 		   	      
  (lambda (n) 		   	      
    (define (fact-iter n cur)
      (cond ((< n 0)
             (display "Error") (newline)
             0)
            ((= n 0) cur)
            (else (fact-iter (- n 1) (* cur n))))) 		   	      
    (fact-iter n 1)
    ) 		   	      
  ) 		   	      
; Test cases for factorial: (after the definition of each procedure,
; please cut and paste some test cases you have run, making sure the
; lines are commented out with semi-colons)
 		   	      
;(factorial 5)  ; -> 120		   	      
;(factorial 5)  ; -> 120		   	      
;(factorial 10)  ; -> 3628800		   	      

;(factorial 0) ; 1
;(factorial 1) ; 1
;(factorial 2) ; 2
;(factorial 3) ; 6

;(factorial -2) ; Error, 0
 		   	      
;;; Description for binomial: Calculates the binomial coefficient for given integers n and b > 0
; where binomial coefficient is n! / ((n-b)! * n!), returns 0 if n < b as binomial coefficient represents
; a way to choose variables, and is 0 if more choices are required than given size

(define binomial 		   	      
  (lambda (n b)
    (cond ((or  (< n 0) (< b 0)) ; n < 0, b < 0 are errors
           (display "Error") (newline)
           0)
          ((< n b) 0) ; 0 choices for b > n
          (else (/ (factorial n)
                   (* (factorial (- n b))
                      (factorial b)))))
    )
  )
 		   	      
; Test cases for binomial: 		   	      
 		   	      
;(binomial 5 1)  ; -> 5 		   	      
;(binomial 5 2)  ; -> 10		   	      
;(binomial 10 5)  ; -> 252

;(binomial 1 0) ; 1
;(binomial 1 1) ; 1

;(binomial 2 1) ; 2
;(binomial 3 1) ; 3
;(binomial 4 2) ; 6

;(binomial 7 7) ; 1

;(binomial 2 3) ; 0 (n < b)
;(binomial 3 -2) ; Error, 0  (b < 0)
;(binomial -1 -2) ; Error, 0 (n < 0)
  
;;; Description for binomial-2:	Calculate the binomial coefficient for given integers n and b > 0
; iteratively, without using factorials directly, using its properties, and returns 0 if n < b like binomial
 		   	      
(define binomial-2 		   	      
  (lambda (n b) 		   	      
    (define (bin-2-iter n b cur)
      (cond ((or (< n 0) (< b 0)) ; n < 0, b < 0 are all errors
             (display "Error") (newline)
             0)
            ((< n b) 0) ; 0 choices for b > n
            ((= b 0) cur)
            (else (bin-2-iter (- n 1) (- b 1) (* cur (/ n b))))))	   	      
    (bin-2-iter n b 1))
  ) 		   	      
 		   	      
; Test cases for binomial-2: 		   	      
 		   	      
;(binomial-2 5 1)  ; -> 5 		   	      
;(binomial-2 5 2)  ; -> 10		   	      
;(binomial-2 10 5)  ; -> 252

;(binomial-2 1 0) ; 1
;(binomial-2 1 1) ; 1

;(binomial-2 2 1) ; 2
;(binomial-2 3 1) ; 3
;(binomial-2 4 2) ; 6

;(binomial-2 7 7) ; 1

;(binomial-2 2 3) ; 0 (n < b)
;(binomial-2 3 -2) ; Error, 0  (b < 0)
;(binomial-2 -1 -2) ; Error, 0 (n < 0)
 		   	      
 		   	      
;;; Description for exactly-b-smarties:  Given a bag with n smarties and probability of any smarty being orange p,
; returns the probability that the bag contains *exactly* b smarties
 		   
(define exactly-b-smarties 		   	      
  (lambda (n b p)
    (cond ((or (< p 0) (> p 1)) ; Give error if p is negative or bigger than 1, the error cases about n and b are already checked in binomial-2 called below
           (display "Error") (newline)
           0)
          (else (* (binomial-2 n b)
                   (expt p b)
                   (expt (- 1 p) (- n b)))))  	      
    )
  ) 		   	      
 		   	      
; Test cases for exactly-b-smarties:
 		   	      
;(exactly-b-smarties 1 1 0.5)   ; -> 0.5
;(exactly-b-smarties 2 1 0.5)   ; -> 0.5
;(exactly-b-smarties 2 2 0.5)   ; -> 0.25
;(exactly-b-smarties 2 1 0.3)   ; -> 0.42 ( 2 * 0.3 * 0.7 )
;(exactly-b-smarties 10 2 0.3)  ; -> 0.23347... (45 * ((0.3) ^ 2) * ((0.7) ^ 8))

;(exactly-b-smarties 3 5 0.5)    ; -> 0
;(exactly-b-smarties 2 1 -0.3)   ; -> Error, 0 (p < 0)
;(exactly-b-smarties 2 1 1.7)    ; -> Error, 0 (p > 0)
;(exactly-b-smarties -2 -4 0.5)  ; -> Error, 0 (n < 0)
;(exactly-b-smarties 3 -4 0.5)   ; -> Error, 0 (n < 0)

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:;;
;;; Problem 2: More Probability Theory
 		   	      
;;; Description for atleast-b-smarties: Given a bag with n smarties and probability of any smarty being orange p,
; returns the probability that the bag contains *at least* b smarties
;;; Recursive 		   	      
 		   	      
 		   	      
(define atleast-b-smarties 		   	      
  (lambda (n b p)
    (if (> b n)
        0
        (+ (exactly-b-smarties n b p) (atleast-b-smarties n (+ b 1) p)))
    )
  ) 		   	      
 		   	      
; Test cases for atleast-b-smarties:
 		   	      
;(atleast-b-smarties 9 5 0.5)        ; -> 0.5
;(atleast-b-smarties 19 10 0.5)      ; -> 0.5
;(atleast-b-smarties 10 5 0.6)       ; -> 0.8337
;(atleast-b-smarties 15 5 0.3)       ; -> 0.4845
;(atleast-b-smarties 5 6 0.3)        ; -> 0
 		   	      		   	      
 		   	      
;;; Description for atleast-b-smarties-2: Given a bag with n smarties and probability of any smarty being orange p,
; returns the probability that the bag contains *at least* b smarties iteratively
;;; Iterative 		   	      
(define atleast-b-smarties-2 		   	      
  (lambda (n b p) 		   	      
    (atleast-b-smarties-2-iter n b p 0)
    )
  ) 		   	      
 		   	      
(define (atleast-b-smarties-2-iter n b p total)
  (if (> b n)
      total
      (atleast-b-smarties-2-iter n (+ b 1) p (+ total (exactly-b-smarties n b p))))
  ) 		   	      

; Test cases for atleast-b-smarties-2:
 		   	      
;(atleast-b-smarties-2 9 5 0.5)        ; -> 0.5
;(atleast-b-smarties-2 19 10 0.5)      ; -> 0.5
;(atleast-b-smarties-2 10 5 0.6)       ; -> 0.8337
;(atleast-b-smarties-2 15 5 0.3)       ; -> 0.4845
;(atleast-b-smarties-2 3 5 0.3)        ; -> 0		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:;:
;;; Problem 3: Choosing a Bag 		   	      
 		   	      
;;; Description for good-bag: Returns whether or not the bag is worth buying
; where a bag is worth buying if and only if it has at least 50% probability to contain
; at least 8 smarties.
 		   	      
(define good-bag 		   	      
  (lambda (n p)
    (if (< n 8)
        #f
        (>= (atleast-b-smarties-2 n 8 p) 0.5))
    )
  ) 		   	      
 		   	      
; Test cases for good-bag: 		   	      
 		   	      
;(good-bag 7 1)       ; -> #f 		   	      
;(good-bag 8 1)       ; -> #t 		   	      
;(good-bag 8 0.5)     ; -> #f		   	      
;(good-bag 8 0.99)    ; -> #t		   	      
;(good-bag 16 0.5)    ; -> #t		   	      
;(good-bag 16 0.7)    ; -> #t		   	      
;(good-bag 16 0.4)    ; -> #f		   	      
;(good-bag 16 0)      ; -> #f	   
;(good-bag 1000 0.1)  ; -> #t	   		   	      

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;::;
;;; Problem 4: Choosing a Value for p
 		   	      
;;; Description of minimum-p: Given number of smarties n in a bag, and an increment for precision of probabiltiy, returns the minimum probability
; under which the bag will be acceptable to buy, that is, it is a good bag (given the previous good bag definition)	      		   	      
(define minimum-p 		   	      
  (lambda (n inc)
    (if (= inc 0) 0
        (minimum-p-iter n inc 0))
    )
  ) 		   	      
 		   	      
(define (minimum-p-iter n inc cur)
  (if (good-bag n cur)
      cur
      (minimum-p-iter n inc (+ cur inc)))
  ) 		   	      
; Test cases for minimum-p: 		   	      

;(minimum-p 8 1)    ; -> 1
;(minimum-p 12 0.1)    ; -> 0.7	   	      
;(minimum-p 12 0.01)    ; -> 0.63		   	      
;(minimum-p 12 0.001)    ; -> 0.622	   	      
;(minimum-p 12 0.0001)    ; -> 0.621	   	      
;(minimum-p 12 0.00001)    ; -> 0.621	   	      
;(minimum-p 12 0)    ; -> 0

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;::;:::
;;; Problem 5: Choosing p More Efficiently
 		   	      
;;; Description of minimum-p-new: Prints out the number of times that good-bag
; is called by the recursive search procedure of minimum-p, has the same implementation,
; but also prints out how many times it cals good bag. It works in linear time

(define minimum-p-new 		   	      
  (lambda (n inc)
    (if (= inc 0)
        0
        (minimum-p-new-iter n inc 0 0))
    )
  ) 		   	      
(define (minimum-p-new-iter n inc cur times)
  (cond ((good-bag n cur)
         (display (string-append "Good bag is called " (number->string times) " times"))
         (newline)
         cur)
        (else (minimum-p-new-iter n inc (+ cur inc) (+ times 1))))
  ) 		   	      

; My test cases
; (minimum-p-new 12 0.01) ; 63 times, 0.6300...003

; Test cases for minimum-p-new:
;(minimum-p-new 15 0)          ; 0		   	      
;(minimum-p-new 15 0.1)        ; -> 5 times, 0.5	   	      
;(minimum-p-new 15 0.01)       ; -> 50 times
;(minimum-p-new 15 0.001)      ; -> 500 times
;(minimum-p-new 15 0.0001)     ; -> 5000 times
;(minimum-p-new 15 0.00001)    ; -> 50000 times
 		   	      
 		   	      
;;; Description of minimum-p-binary: Finds out the minimum probability for which a bag will be acceptable to buy
; in O(logn) time instead of linear time given above, and also prints out how many times it calls good bag
 		   	      
(define minimum-p-binary 		   	      
  (lambda (n inc)
    (if (= inc 0)
        0
        (minimum-p-binary-helper n inc 0 1 0))
    )
  ) 		   	      

 		   	      
(define minimum-p-binary-helper
  (lambda (n inc a b count)
    (cond ((< (- b a) inc)
           (display (string-append "Good bag is called " (number->string count) " times"))
           (newline)
           b)
          ((good-bag n (/ (+ a b) 2)) (minimum-p-binary-helper n inc a (/ (+ a b) 2) (+ count 1)))
          (else (minimum-p-binary-helper n inc (/ (+ a b) 2) b (+ count 1))))
    )
  ) 		   	      
 		   	      
 		   	      
; Test cases for minimum-p-binary:
;(minimum-p-binary 12 0)          ; 0		   	      
;(minimum-p-binary 12 0.1)        ; -> 4 times, 5/8 = 0.625
;(minimum-p-binary 12 0.01)       ; -> 7 times, 5/8 = 0.625
;(minimum-p-binary 12 0.001)      ; -> 10 times, 637/1024  = 0.62207
;(minimum-p-binary 12 0.0001)     ; -> 14 times, 10183/16384 = 0.621520
;(minimum-p-binary 12 0.00001)    ; -> 17 times, 40729/65535 = 0.621475
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;:::;;;
;;; Problem 6: Monte-Carlo Simulations
 		   	      
;;; Description of coin-toss: This function simulates a coin toss and with p probability, it returns true,
; and with 1-p probability it returns false
(#%require (only racket/base random))

(define coin-toss 		   	      
  (lambda (p)
    (< (random) p)
    )
  ) 		   	      
 		   	      
; Test cases for coin-toss: 		   	      
;(coin-toss 1)     ; -> 	#t   	      
;(coin-toss 0)     ; -> 	#f	   	      

;(coin-toss 0.5)   ; #t, #f, #t, #t, #f
 		   	      
;;; Description of random-bag: Generates a bag of n smarties with each having the probability p of being orange,
; and returns the number of orange smarties in the generated bag
 		   	      
(define random-bag 		   	      
  (lambda (n p)
    (cond ((= n 0) 0)
          ((coin-toss p) (+ 1 (random-bag (- n 1) p)))
          (else (random-bag (- n 1) p)))
    )
  ) 		   	      
 		   	      
; Test cases for random-bag: 		   	      
;(random-bag 10 1.0)      ; -> 10 		   	      
;(random-bag 20 1.0)      ; -> 20		   	      
;(random-bag 100 0.5)     ; -> 50 on average		   	      
;(random-bag 100 0.0)     ; -> 0	      
;(random-bag 10 0.0)      ; -> 0		   	      
;(random-bag 100 0.0001)  ; -> 0 on average
 		   	      
;;; Description of get-m-bags: Generates m bags of n smarties with each having p probability of being orange, and returns true
; if any of them is a good bag (more than or equals to 8 orange), note that this function short terminates,
; if it finds an appropriate, it doesn't generate the rest for no reason
 		   	      
(define get-m-bags 		   	      
  (lambda (m n p)
    (cond ((= m 0) #f)
          ((>= (random-bag n p) 8) #t)
          (else (get-m-bags (- m 1) n p)))
    )
  ) 		   	      
 		   	      
; Test cases for get-m-bags: 		   	      
;(get-m-bags 1 10 1)      ; -> #t, Always 10 bags ( which is >=8 ), so guarenteed to be true 		   	      
;(get-m-bags 2 20 1)      ; -> #t, same reasoning 		   	      
;(get-m-bags 0 10 1)      ; -> #f, 0 bags, so never >= 8 as there are no bags      
;(get-m-bags 100 10 0.0001)   ; -> #f, with very high probability, 
                             ;      as (random-bag 10 0.0001) is usually 0, rarely 1,
                             ;      very rarely something higher with less probability for every higher value
;(get-m-bags 100 4 0.25)      ; -> #f, Even though there are 100 bags, each bag can have at most 4 beans, so never has 8 or more orange ones
 		   	      
;;; Description of estimate-good-probability: Given m bags in a batch, with n smarties in a bag, and p probability that
; each smarty is orange, this function returns the probability that there is a good bag in the batch
 		   	      
(define estimate-good-probability
  (lambda (m n p t)
    (/ (estimate-good-probability-helper m n p t 0) t)
    )
  ) 		   	      

; Returns number of times the tests were succesful, divide with t to find actual probability
(define estimate-good-probability-helper
  (lambda (m n p t g)
    (cond ((= t 0) g)
          ((get-m-bags m n p) (estimate-good-probability-helper m n p (- t 1) (+ g 1)))
          (else (estimate-good-probability-helper m n p (- t 1) g)))
    )
  ) 		   	      
  		   	      
 		   	      

; Test cases for estimate-good-probability:        Run 1, Run 2, Run 3
;(estimate-good-probability 24 12 0.5 1000)    ; -> 0.993, 0.993, 0.994
;(estimate-good-probability 24 16 0.5 1000)    ; -> 1    , 1    , 1
;(estimate-good-probability 24 16 0.3 1000)    ; -> 0.826, 0.851, 0.841
;(estimate-good-probability 24 16 0.2 1000)    ; -> 0.166, 0.159, 0.151
		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;::;:::;:::;;:
;;; Problem 7: Monte-Carlo Again
 		   	      
;;; Description of estimate-good-probability-2: Given m bags in a batch, with n smarties in a bag, p probability that
; each smarty is orange, and q probability that each smarty is blue,
; this function returns the probability that there is a good bag with the new definition in the batch
 		   	      
 		   	      
(define estimate-good-probability-2
  (lambda (m n p q t)
     (/ (estimate-good-probability-2-helper m n p q t 0) t)
    )
  )

; Returns number of times the tests were succesful, divide with t to find actual probability 		   	      
(define estimate-good-probability-2-helper
  (lambda (m n p q t g) 		   	      
    (cond ((= t 0) g)
          ((get-m-bags-new m n p q) (estimate-good-probability-2-helper m n p q (- t 1) (+ g 1)))
          (else (estimate-good-probability-2-helper m n p q (- t 1) g)))	   	      
    )
  )
 		   	      
;New defination of the "good-bag"
;o is the number of orange smarties in the current bag
(define good-bag-new 		   	      
  (lambda (n p q o)
    (and (> o (/ n 2)) (< (random-bag (- n o) (/ q (- 1 p))) (/ n 5)))
    )
  ) 		   	      
;this new get-m-bags-new first chooses the orange smarties with the given probability of p than
;pass it to the good-bag-new function to the jobs.
(define get-m-bags-new 		   	      
  (lambda (m n p q)
    (cond ((= m 0) #f)
          ((good-bag-new n p q (random-bag n p)) #t)
          (else (get-m-bags-new (- m 1) n p q)))
    )
  )

; Test cases for estimate-good-probability:              Run 1, Run 2, Run 3
;(estimate-good-probability-2 24 12 0.5 0.3 1000)    ; -> 0.994, 0.993, 0.995 
;(estimate-good-probability-2 24 16 0.5 0.1 1000)    ; -> 1    , 1    , 1 
;(estimate-good-probability-2 24 16 0.3 0.1 1000)    ; -> 0.494, 0.430, 0.462
;(estimate-good-probability-2 24 16 0.2 0.8 1000)    ; -> 0    , 0    , 0

;(estimate-good-probability-2 4 20 0.6 0.2 10000)    ; -> 0.854, 0.850, 0.8507
;(estimate-good-probability-2 24 16 0.2 0.8 1000)    ; -> 0    , 0    , 0
;(estimate-good-probability-2 12 16 0.4 0.2 1000)    ; -> 0.815, 0.800, 0.811
;(estimate-good-probability-2 24 32 0.5 0.2 1000)    ; -> 1    , 0.999, 1
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;:;;:::;;;;::;;;;
; END OF PROJECT 		   	      
 		   	      
