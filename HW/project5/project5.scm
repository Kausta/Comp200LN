;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;;;:
;;;   The Evaluator 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;;:;
;;; 		   	      
;;; ckorkmaz16@ku.edu.tr     Sat Dec 16 09:25:16 2017
;;; 		   	      
;;; Before you start: 		   	      
;;; * Please read the project handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;; 		   	      
;;; * Use R5RS language 		   	      
;;; 		   	      
;;; * To allow redefinition, in the "Choose Language" panel, click on "Show Details"
;;;   and uncheck "Disallow redefinition of initial bindings".
;;; 		   	      
;;; * Also check the "case sensitive" choice
;;; 		   	      
;;; * The following code should be studied and loaded for this
;;;   project.  Please do not modify these files, put all your work in
;;;   this file. 		   	      
;;; 		   	      
;;; - eval.scm: code that defines the syntax, environments and control
;;;             of the basic evaluator
;;; 		   	      
;;; * Please read "Project Submission Instructions" carefully
;;;   and make sure you understand everything before you start
;;;   working on your project in order to avoid problems.
;;; 		   	      
;;; * Plan your work with pencil and paper before starting to code.
;;; 		   	      
;;; While you are working: 		   	      
;;; * If you modify a code that is already defined (e.g. m-eval), please copy the whole procedure
;;; into the corresponding part (which is defined with your-answer-here).
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;; 		   	      
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;; 		   	      
;;; 		   	      
;;; When you are done: 		   	      
;;; * Perform a final save and copy the file to the following location
;;;   F:\COURSES\UGRADS\COMP\COMP200\HOMEWORK\username\project5\project5.scm
;;;   where the username is your login name.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;; * You can version your code with underscore (e.g. project5_3.scm)
;;; 		   	      
;;; *** IF (load "project5.scm") GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED *
;;; 		   	      
;;; 		   	      
 		   	      
;;; The following is defined so that this file loads without errors:
(define your-answer-here #f) 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;;::
;;; M-eval: As you work on the following exercises you will need to
;;; modify m-eval multiple times.  Below is a copy from eval.scm for
;;; you to modify as needed.  First we load the original definition:
 		   	      
(load "eval.scm") 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;:;;
;;; Then we override it with our own definition:
 		   	      
(define (m-eval exp env) 		   	      
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((reset? exp) (eval-reset exp env)) ; reset!
        ((if? exp) (eval-if exp env))
        ((lambda? exp) 		   	      
         (make-procedure (lambda-parameters exp) (lambda-body exp) env (lambda-memo? exp)))
        ((begin? exp) (eval-sequence (begin-actions exp) env))
        ((loop? exp) (eval-loop exp env)) ; loop
        ((cond? exp) (m-eval (cond->if exp) env))
	((let? exp) (m-eval (let->application exp) env))
        ((and? exp) (m-eval (and->if exp) env)) ; and
        ((or? exp) (m-eval (or->if exp) env)) ; or
        ((loop2? exp) (m-eval (loop->if exp) env)) ; loop2
        ((application? exp) 		   	      
         (m-apply (m-eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else (error "Unknown expression type -- EVAL" exp))))
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;:;:
;;; Computer Exercise 1: Adding new primitive procedures
;;; 		   	      
;;; Please find and copy the code from eval.scm where new procedures
;;; can be added below.  Then modify it to extend the evaluator as
;;; described in the exercise. 		   	      
 		   	      
; New code:
; Save primitives defined in eval.scm
(define old-primitive-procedures (primitive-procedures))
; Add the other primitives to the old ones
(define (primitive-procedures)
  (append
   old-primitive-procedures
   (list
    (list '* *)
    (list '/ /)
    (list 'cadr cadr)
    (list 'cddr cddr)
    (list 'newline newline)
    (list 'length length)
    (list 'list list)
    (list '>= >=)
    (list '<= <=)
    (list 'append append)
    (list 'length length)
    (list 'write-line write-line))))
; Test cases: 		   	      

;;; M-Eval input:
; (* 4 3)
;;; M-Eval value:
; 12

;;; M-Eval input:
;(/ 6 4)
;;; M-Eval value:
;3/2

;;; M-Eval input:
;(write-line (length (list 1 2 3 4)))
;4
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(append (list 1 2) (list 3 4))
;;; M-Eval value:
;(1 2 3 4)

;;; M-Eval input:
;(cadr (list 1 2 3 4))
;;; M-Eval value:
;2

;;; M-Eval input:
;(cddr (list 1 2 3 4))
;;; M-Eval value:
;(3 4)

;;; M-Eval input:
;(newline)

;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(>= 2 3)
;;; M-Eval value:
;#f

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;::;
 		   	      
		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;::;:::
;;; Computer Exercise 2: The reset! special form
;;; 		   	      
;;; Please find and copy the relevant code from eval.scm below.  Then
;;; make the necessary modifications and additions to handle the
;;; reset! form.  Do not forget to modify the definition of m-eval
;;; above to handle the new form.
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;:::;;;
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;::;;:::;;:
; New code: 		   	      

; Updates set and now adds the new value to the binding just after the variable instead of replacing the other
(define (set-binding-value! binding val)
  (set-cdr! binding (cons val (cdr binding))))

; Abstraction/accessors for reset 
(define (reset? exp) (tagged-list? exp 'reset!))
(define reset-variable cadr)

; Resets binding value if there is a previous value
; Called from reset-variable-value! which founds the binding
(define (reset-binding-value! binding)
  (if (<= (length binding) 2)
      (error "ERROR: No value to reset!")
      (set-cdr! binding (cddr binding))))

; Finds the binding for the variable to pass through to reset-binding-value!
(define (reset-variable-value! var env)
  (if (eq? env the-empty-environment)
      (error "Unbound variable -- LOOKUP" var)
      (let* ((frame (first-frame env))
	     (binding (find-in-frame var frame)))
	(if binding 		   	      
	    (reset-binding-value! binding)
	    (reset-variable-value! var (enclosing-environment env))))))

; Evaluates a reset expression in the given env
(define (eval-reset exp env)
  (reset-variable-value! (reset-variable exp)
                         env))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;;;
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;;:
; Test cases: 		   	      
;;; M-Eval input:
;(define x 2)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;x
;;; M-Eval value:
;2

;;; M-Eval input:
;(set! x 3)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(set! x 4)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;x
;;; M-Eval value:
;4


;;; M-Eval input:
;(reset! x)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;x
;;; M-Eval value:
;3

;;; M-Eval input:
;(reset! x)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;x
;;; M-Eval value:
;2

;;; M-Eval input:
;(reset! x)
; ERROR: No value to reset!

;----

;;; M-Eval input:
;(define l (list 1 2 3))
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;l
;;; M-Eval value:
;(1 2 3)

;;; M-Eval input:
;(set! l (append l (list 4)))
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;l
;;; M-Eval value:
;(1 2 3 4)

;;; M-Eval input:
;(reset! l)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;l
;;; M-Eval value:
;(1 2 3)

;----

;;; M-Eval input:
;(define a 'aa)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(define a 'ab)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;a
;;; M-Eval value:
;ab

;;; M-Eval input:
;(reset! a)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;a
;;; M-Eval value:
;aa
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;:;
 		   	      
	   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;::
;;; Computer Exercise 3: The loop special form
;;; 		   	      
;;; To create the loop special form, you need to:
;;; 1. Create a data abstraction for handling loops
;;; 2. Write the procedures that handle the evaluation of loops
;;; 3. Modify m-eval to handle this new special form
;;; Following the instructions given in the exercise.
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;:;;
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;:;:
; New code:

; Loop abstraction/accessors
(define (loop? exp) (tagged-list? exp 'loop))
(define loop-until cadr) ; Second is until expression
(define loop-return caddr) ; Third is return expression
(define loop-exps cdddr) ; The rest are the expressions to be evaluated at all loops

; Run loop expects a single inner-exp, so multiple is given with make-begin in eval-loop
(define (run-loop until-exp return-exp inner-exp env)
  (define (next)
    (m-eval inner-exp env)
    (if (m-eval until-exp env)
        (m-eval return-exp env)
        (next)))
  (next))

; Evaluates the given loop
(define (eval-loop exp env)
  (run-loop (loop-until exp)
            (loop-return exp)
            ; Make it a begin exp, so that it can easily be evaluated
            (make-begin (loop-exps exp))
            env))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;::;
	 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;:::
; Test cases: 		   	      
;;; M-Eval input:
;(let ((x '()))
;  (loop (> (length x) 3) x
;  (set! x (cons '* x))
;  (display x)))
;(*)(* *)(* * *)(* * * *)
;;; M-Eval value:
;(* * * *)

;;; M-Eval input:
;(define i 0)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(loop (>= i 4)
;      (begin (newline) (* i 2))
;      (display i) (display " ")
;      (set! i (+ i 1)))
;0 1 2 3

;;; M-Eval value:
;8

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;:::;;;

  		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;:::;;:
;;; Computer Exercise 4: Transforming "and" and "or"
;;; 		   	      
;;; Please fill in the following code to transform "and" and "or"
;;; expressions into "if" expressions:
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;;:
; Accessors
(define first-and-expr car) 		   	      
(define rest-and-exprs cdr)

; Using the uninterned symbol api (available in the r5rs in drracket environment) to handle possible collusion with values in macro and in content
;  so this is used to create hygienic and/or macros
; The returned symbol looks like the initial one, but it is not equivalent
; e.g (eq? (to-new-symbol 'a) (to-new-symbol 'a)) is #f
; so we can get hygienic and/or (since this is uninterned, it is not writible by hand, and different from the previous uninterned ones)
(define (to-new-symbol symbol)
  (string->uninterned-symbol (symbol->string symbol)))
(define (new-val-symbol)
  (to-new-symbol '**val**))

; Converts a given and expression to a single layer if expression and another and expression with one less case
(define (and->if expr) 		   	      
  (let ((clauses (and-exprs expr)))
    (cond ((null? clauses) #t) ; No clauses, so return true
          ((null? (rest-and-exprs clauses)) (first-and-expr clauses)) ; Returns last exp if there is only one exp
          (else ; Convert to if
           (let ((val-symbol (new-val-symbol))) ; Get a fresh uninterned val symbol
             (make-let 
              (list
               (list val-symbol (first-and-expr clauses))) ; Save the evaluation in the value
              (list
               (make-if val-symbol ; If true
                        (make-and (rest-and-exprs clauses)) ; Return another and clause with remaining
                        val-symbol ; Otherwise return it
                        ))))))
    )) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;:;

 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;::
; Accessors
(define first-or-expr car) 		   	      
(define rest-or-exprs cdr) 		   	      

; Converts a given or expression to a single layer if expression and another or expression with one less case
(define (or->if expr) 		   	      
  (let ((clauses (or-exprs expr)))
    (cond ((null? clauses) #f) ; No clauses, so return false
          (else
           (let ((val-symbol (new-val-symbol))) ; Get a fresh uninterned val symbol
             (make-let
              (list (list val-symbol (first-or-expr clauses))); Save the evaluation in the value
              (list
               (make-if val-symbol ; If true
                        val-symbol ; Return it
                        (make-or (rest-or-exprs clauses)) ; Return another or clause with remaining
                        ))))))
    )) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:;:
; m-eval is modified above, so don't know know what to put here ? 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;::;		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:::
;;; Modify m-eval to handle "and" and "or" as special forms and give
;;; some test examples:

;;; M-Eval input:
;(and (begin (display "a ") (> 6 5))
;     (begin (display "b ") (< 6 5))
;     (begin (display "c ") (+ 6 5)))
;a b 
;;; M-Eval value:
;#f

;;; M-Eval input:
;(and (begin (display "1 ") #t)
;     (begin (display "2 ") 4)
;     (begin (display "3") (list 1 2 3 4)))
;1 2 3
;;; M-Eval value:
;(1 2 3 4)

;;; M-Eval input:
;(or (begin (display "once ") #f)
;    (begin (display "and ") #f)
;    (begin (display "only ") 'done)
;    (begin (display "adbmal") #t))
;once and only 
;;; M-Eval value:
;done

;;; M-Eval input:
;(or (>= 3 4) (<= 4 1))
;;; M-Eval value:
;#f


;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;:::;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;:::;;:
;;; Computer Exercise 5: Transforming "loop2"
;;; 		   	      
;;; Define the converter that will transform a loop2 expression into an
;;; "if" expression: 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;;:
(define (loop2? expr) (tagged-list? expr 'loop2))

; Converts a given loop2 expression to a single layer if expression and another loop expression
(define (loop->if expr) 		   	     
  (make-begin
   (append
    (loop-exps expr) ; Add the body
    (list
     (make-if
      (loop-until expr) ; If until expression
      (loop-return expr); then return the return expression
      expr) ; Otherwise another loop2 expressions
     )))	   	      
  ) 		   	       		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;:;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;::
;;; Modify m-eval to handle loop2 as described in the exercise and give
;;; some test examples below:

;;; M-Eval input:
;(let ((x '()))
;  (loop (> (length x) 3) x
;  (set! x (cons '* x))
;  (display x)))
;(*)(* *)(* * *)(* * * *)
;;; M-Eval value:
;(* * * *)

;;; M-Eval input:
;(define i 0)
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(loop (>= i 4)
;      (begin (newline) (* i 2))
;      (display i) (display " ")
;      (set! i (+ i 1)))
;0 1 2 3
;;; M-Eval value:
;8

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;:;;
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;:;:
;;; Computer Exercise 6: Adding memoization to the evaluator
;;; 		   	      
;;; Please find and copy all relevant parts of eval.scm below.  Then
;;; make the necessary modifications and additions to add memoization
;;; to the evaluator as described in the exercise.
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;::;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;:::
; New code:

; Since these tags are quoted once in input, they're quoted twice here
(define lambda-memo-tag ''memo)
(define lambda-no-memo-tag ''no-memo)
; Gets the memo arg for the lambda expression
(define (lambda-memo-arg lambda-exp) (cadr lambda-exp))
; Returns a boolean value that indicates whether the given lambda expression is a memoized one
(define (lambda-memo? lambda-exp)
  ; When we compare ''memo and ''memo (which are 'memo in the input), only equal? returns true, eq? and eqv? return false
  (equal? (lambda-memo-arg lambda-exp) lambda-memo-tag))

; Accessors for lambda with memoization
(define (lambda-parameters lambda-exp) (caddr lambda-exp))
(define (lambda-body lambda-exp) (cdddr lambda-exp))
; Updated make lambda
(define (make-lambda memo? params body) (append (list 'lambda memo? params) body))

; Gets the definiton variable of a define exp
(define (definition-variable exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      (caadr exp)))
; Gets the memo argument of a define exp that is syntetic sugar to lambda
(define (definition-memo-arg exp)
  (if (symbol? (cadr exp))
      (error "A variable cannot have memo tag!" exp)
      (cadadr exp)))
; Gets the arguments of a define exp that is syntetic sugar to lambda
(define (definiton-arguments exp)
  (if (symbol? (cadr exp))
      (error "A variable cannot have memo tag!" exp)
      (cddadr exp)))
; Gets the value of an exp or converts it to a lambda expressions
(define (definition-value exp)
  (if (symbol? (cadr exp)) 		   	      
      (caddr exp) 		   	      
      (make-lambda (definition-memo-arg exp) (definiton-arguments exp) (cddr exp))))  ; memo, formal params, body

; Converts a let expression to a non memoized lambda expressions
(define (let->application expr)
  (let ((names (let-bound-variables expr))
        (values (let-values expr))
        (body (let-body expr)))
    (make-application (make-lambda lambda-no-memo-tag names body)
		      values)))

; Memoization binding abstraction, that is a list of arguments and the result
(define (memo-binding args result)
  (list args result))
; Accessors
(define memo-args car)
(define memo-result cadr)

; Memo List is the data type used for memoization, it is an assoc list of memo-bindings with the tag 'memo-list

; Memo list type tag
(define memo-list-tag 'memo-list)
; Memo list constructor
(define (memo-list all-args all-results)
  (list memo-list-tag (map memo-binding all-args all-results)))
; Type check
(define (memo-list? m-list)
  (tagged-list? m-list memo-list-tag))
; Accessors
(define memo-list-body cadr)
; Adds a args/result binding to the memoization values
(define (add-memoized-value! m-list args result)
  (if (not (memo-list? m-list))
      (error "Cannot add memo-binding to non memo-list variable" m-list)
      (set-car! (cdr m-list)
                (append (list (make-binding args result)) (memo-list-body m-list)))
      ))
; Finds a memo result from the memoization list, returns #f if not found (like assoc)
(define (find-memo-result m-list args)
  (if (not (memo-list? m-list))
      (error "Cannot find memo-binding in non memo-list variable" m-list)
      (assoc args (memo-list-body m-list)) ; Assoc uses equal? to compare, so we are fine with lists as arguments
      ))

; Updated make procedure that has memo-list or 'none as the fifth element
(define (make-procedure parameters body env is-memo?)
  (let ((m-list (if is-memo?
                    (memo-list '() '())
                    'none)))
    (list 'procedure parameters body env m-list)))

(define (fifth p) (fourth (cdr p)))
; Returns the memoization for the function if it is memoized, 'none otherwise
(define (procedure-mlist proc) (fifth proc)) 
; Gets whether the proc is memoized
(define (procedure-memo? proc) (not (equal? (procedure-mlist proc) 'none))) 

; Updated m-apply that supports memoization
(define (m-apply procedure arguments)
  ; Apply normally if there is no memoization
  (define (apply-no-memo) 
    (eval-sequence 		   	      
          (procedure-body procedure)
          (extend-environment (procedure-parameters procedure)
                              arguments
                              (procedure-environment procedure))))
  ; Apply a memoized procedure
  (define (apply-memo)
    ; Search for the previous memoization result
    (let* ((mlist (procedure-mlist procedure))
           (memoized-result (find-memo-result mlist arguments)))
      (cond (memoized-result (memo-result memoized-result)) ; If there is a previously calculated result, return it
            (else ; Otherwise calculate the value by evaluating the function
             (let ((result (apply-no-memo))) ; Apply as if there were no memoization
               (add-memoized-value! mlist arguments result) ; Add the value to the memoization list
               result ; And return the value
               )))
      ))
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments)) ; Primitive procedures are normally applied
        ((compound-procedure? procedure)
         (cond ((procedure-memo? procedure) (apply-memo)); Memoized Procedure
               (else (apply-no-memo)) ; Non Memoized Procedure
               ))
        (else (error "Unknown procedure type -- APPLY" procedure))))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;:::;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;:::;;:
; Test cases:

; Memo Version

;;; M-Eval input:
;(define fib
;  (lambda 'memo (n)
;    (cond ((= n 1) 1)
;          ((= n 2) 1)
;          (else (+ (fib (- n 1)) (fib (- n 2)))))))
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(fib 3141)
;;; M-Eval value:
;120418447297093507007978384327895568674051461911870283400994251838961087856892246282539147157100549268399663183053984275921361425956330076634337558694463400215095305929049641149478268636237901623018537452469459884778423403302718365883336987762328962999730913269598386332649446960844676612628533523335812369187294711764895145215556464017303315025184462785659962789434426492130770661947444910208738190955877254152125872305777205198248004793473173133903052571492847244819665014259848886325361105035152011345352667194784254540530137731386482589150027685846184388831273665379025898434392849709485541445739180648649937548278888176579059667000127803554557682572866

; No Memo Version

;;; M-Eval input:
;(define fib
;  (lambda 'no-memo (n)
;    (cond ((= n 1) 1)
;          ((= n 2) 1)
;          (else (+ (fib (- n 1)) (fib (- n 2)))))))
;;; M-Eval value:
;#<void>
;;; M-Eval input:
;(fib 3141)
;;; M-Eval value:
;...
; Took too long to compute where as the upper one was instant

; Memo Version

;;; M-Eval input:
;(define fib-v
;  (lambda 'memo (n)
;    (display "Fib: ")
;    (write-line n)
;    (cond ((= n 1) 1)
;          ((= n 2) 1)
;          (else (+ (fib-v (- n 1)) (fib-v (- n 2)))))))

;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(fib-v 10)
;Fib: 10
;Fib: 9
;Fib: 8
;Fib: 7
;Fib: 6
;Fib: 5
;Fib: 4
;Fib: 3
;Fib: 2
;Fib: 1
;;; M-Eval value:
;55

; No Memo Version

;;; M-Eval input:
;(define fib-v
;  (lambda 'no-memo (n)
;    (display "Fib: ")
;    (write-line n)
;    (cond ((= n 1) 1)
;          ((= n 2) 1)
;          (else (+ (fib-v (- n 1)) (fib-v (- n 2)))))))
;;; M-Eval value:
;#<void>

;;; M-Eval input:
;(fib-v 10)
;Fib: 10
;Fib: 9
;Fib: 8
;Fib: 7
;Fib: 6
;Fib: 5
;Fib: 4
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 2
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 4
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 2
;Fib: 5
;Fib: 4
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 2
;Fib: 3
;Fib: 2
;...
;...
;...
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 4
;Fib: 3
;Fib: 2
;Fib: 1
;Fib: 2

;;; M-Eval value:
;55

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:;;;::;;;;;::;;;;

; Throught this project, I collaborated with 2 others, Cuneyt Emre Yavuz and Ali Sardag. We only discussed about some of the questions.

;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;::;::;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;::;:::
;# GOOD LUCK!                                                     #
;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;:::;;;
