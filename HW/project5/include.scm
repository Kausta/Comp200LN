(#%require racket/unsafe/ops) 		   	      
(#%require racket/base) 		   	      
 		   	      
(define (set-car! p x) 		   	      
  (if (pair? p) 		   	      
      (unsafe-set-mcar! p x) 		   	      
      (raise-type-error 'set-car! "pair" p)))
 		   	      
(define (set-cdr! p x) 		   	      
  (if (pair? p) 		   	      
      (unsafe-set-mcdr! p x) 		   	      
      (raise-type-error 'set-cdr! "pair" p)))
 		   	      
(define (append! a b) 		   	      
  (if (null? (cdr a)) 		   	      
      (set-cdr! a b) 		   	      
      (append! (cdr a) b))) 		   	      
 		   	      
(define (write-line x) 		   	      
  (write x) 		   	      
  (newline) 		   	      
  ) 		   	      
 		   	      
(define first car) 		   	      
(define second cadr) 		   	      
(define third caddr) 		   	      
(define fourth cadddr) 		   	      
