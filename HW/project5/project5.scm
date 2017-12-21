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
         (make-procedure (lambda-parameters exp) (lambda-body exp) env))
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
(define old-primitive-procedures (primitive-procedures))
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
    (list 'map map))))
; Test cases: 		   	      
your-answer-here 		   	      
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
 		   	      
(define (set-binding-value! binding val)
  (set-cdr! binding (cons val (cdr binding))))

(define (reset? exp) (tagged-list? exp 'reset!))
(define reset-variable cadr)

(define (reset-binding-value! binding)
  (if (<= (length binding) 2)
      (error "Cannot reset variable, already at first value" binding)
      (set-cdr! binding (cddr binding))))

(define (reset-variable-value! var env)
  (if (eq? env the-empty-environment)
      (error "Unbound variable -- LOOKUP" var)
      (let* ((frame (first-frame env))
	     (binding (find-in-frame var frame)))
	(if binding 		   	      
	    (reset-binding-value! binding)
	    (reset-variable-value! var (enclosing-environment env))))))

(define (eval-reset exp env)
  (reset-variable-value! (reset-variable exp)
                         env))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;;;
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;;;:
; Test cases: 		   	      
your-answer-here 		   	      
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

(define (eval-loop exp env)
  (run-loop (loop-until exp)
            (loop-return exp)
            ; Make it a begin exp, so that it can easily be evaluated
            (make-begin (loop-exps exp))
            env))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;::;
	 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;::;:::
; Test cases: 		   	      
your-answer-here 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;:::;;;

  		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;::;:::;:::;;:
;;; Computer Exercise 4: Transforming "and" and "or"
;;; 		   	      
;;; Please fill in the following code to transform "and" and "or"
;;; expressions into "if" expressions:
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;;:
(define first-and-expr car) 		   	      
(define rest-and-exprs cdr)

; The returned symbol looks like the initial one, but it is not equivalent
; e.g (eq? (to-new-symbol 'a) (to-new-symbol 'a)) is #f
; so we can get hygienic and/or (since this is uninterned, it is not writible by hand, and different from the previous uninterned ones)
(define (to-new-symbol symbol)
  (string->uninterned-symbol (symbol->string symbol)))
(define (new-val-symbol)
  (to-new-symbol '**val**))

(define (and->if expr) 		   	      
  (let ((clauses (and-exprs expr)))
    (cond ((null? clauses) #t)
          ((null? (rest-and-exprs clauses)) (first-and-expr clauses)) ; Returns last exp
          (else
           (let ((val-symbol (new-val-symbol)))
             (make-let
              (list
               (list val-symbol (first-and-expr clauses)))
              (list
               (make-if val-symbol ; If true
                        (make-and (rest-and-exprs clauses)) ; Return another and clause with remaining
                        val-symbol ; Otherwise return it
                        ))))))
    )) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;:;

 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;;::
(define first-or-expr car) 		   	      
(define rest-or-exprs cdr) 		   	      

(define (or->if expr) 		   	      
  (let ((clauses (or-exprs expr)))
    (cond ((null? clauses) #f)
          (else
           (let ((val-symbol (new-val-symbol)))
             (make-let
              (list (list val-symbol (first-or-expr clauses)))
              (list
               (make-if val-symbol ; If true
                        val-symbol ; Return it
                        (make-or (rest-or-exprs clauses)) ; Return another or clause with remaining
                        ))))))
    )) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:;:
your-answer-here 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;::;		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;::;:::
;;; Modify m-eval to handle "and" and "or" as special forms and give
;;; some test examples: 		   	      
your-answer-here 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;:::;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;;;:::;;:
;;; Computer Exercise 5: Transforming "loop2"
;;; 		   	      
;;; Define the converter that will transform a loop2 expression into an
;;; "if" expression: 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;;:
(define (loop2? expr) (tagged-list? expr 'loop2))

(define (loop->if expr) 		   	     
  (make-begin
   (append
    (loop-exps expr)
    (list
     (make-if
      (loop-until expr)
      (loop-return expr)
      expr)
     )))	   	      
  ) 		   	       		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;:;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;::;;::
;;; Modify m-eval to handle loop2 as described in the exercise and give
;;; some test examples below: 		   	      
your-answer-here 		   	      
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
your-answer-here 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;:::;;;
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;;::;:::;;:;:::;;:
; Test cases:
(refresh-global-environment)
your-answer-here 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;::;:;;;::;;;;;::;;;;
 		   	      
;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;::;::;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;::;:::
;# GOOD LUCK!                                                     #
;;;;;;;::;::::::;;;::::;;;;:::;:::;;::;;;:;::;;::;::;:;;;:::;;:;::;::;;:::;;;
