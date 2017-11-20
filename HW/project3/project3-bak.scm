;;; ckorkmaz16@ku.edu.tr    Thu Nov  2 11:02:27 2017
;;; 		   	      
;;; Comp200 Project 3 		   	      
;;; 		   	      
;;; Due November ?, 2017 		   	      
;;; 		   	      
;;; 		   	      
;;; Before you start: 		   	      
;;; 		   	      
;;; * Please read the detailed instructions for this project from the
;;; file project3.pdf available in the course website.
;;; 		   	      
;;; 		   	      
;;; While you are working: 		   	      
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;; 		   	      
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;; 		   	      
;;; !!! Do that before submitting the project:
;;;  When you are done with the project3.scm, please click on the "file" button at
;;;  the upper left side, go to the "Save Other" section and click on the
;;; "Save Definitions As Text..." item. It is important for you to do that before the submission.
;;;  Don't worry, this won't change anything in your code; but is required for grading.
;;; 		   	      
;;; 		   	      
;;; When you are done: 		   	      
;;; 		   	      
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;; 		   	      
;;; *** IF LOADING GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;; 		   	      
;;; Before the definition of each procedure, please write a description
;;; about what the procedure does and what its input and output should
;;; be, making sure the lines are commented out with semi-colons.
;;; 		   	      
;;; Code for this project: "databases.scm". You should read this file
;;; since you will use the procedures defined in it.
;;; 		   	      
;;;   Completing assignment by using Racket/DrRacket
;;;   By default DrRacket does not allow you to redefine primitives and
;;;   also load external files via load procedure. To fix these problems,
;;;   in the "Choose Language" panel, select R5RS language in "Other
;;;   Languages" section, click on "Show Details" and uncheck "Disallow
;;;   redefinition of initial bindings".
 		   	      
;;; The following lines are necessary, please do not delete:
 		   	      
(define your-answer-here -1) 		   	      
(load "databases.scm") 		   	      

;;; Let's start 0_0 		   	      
;;; problem 1 ;;; 		   	      
 		   	      
;; your code should have the following general form

(define example-table
  (make-empty-table
   (list (make-column 'name 'symbol)
         (make-column 'major 'number)))
  ) 		   	      
(table-insert! '(ben 6) example-table)
(table-insert! '(jen 3) example-table)
(table-insert! '(amy 12) example-table)
(table-insert! '(kim 13) example-table)
(table-insert! '(alex 6) example-table)

;; test cases 		   	      
; (table-display example-table)
 		   	      
;;; problem 2 ;;; 		   	      
(define (table-insert-all! lst table)
  (cond ((not (table? table)) (error "Not a table" table))
        ((not (pair? lst)) (error "Not a list or empty" lst)) ; (pair? nil) is false, so it includes null? lst
        (else
         (for-each (lambda (row-to-insert)
                     (table-insert! row-to-insert table))
                   lst)))
  ) 		   	      
;; test cases 		   	      
 		   	      
; (define books (make-empty-table
; 	       (list (make-column 'title 'symbol)
; 		     (make-column 'author 'symbol)
; 		     (make-column 'rating 'number))))
; 		   	      
; 		   	      
; (table-insert-all! '((sicp abelson-sussman 8)
; 		     (return-of-the-king jrr-tolkien 9)
; 		     (treatment-of-subordinates darth-vader 4)
; 		     (project-grading tom 2)
; 		     (all-things-stata frank-gehry 5)
; 		     (biting-the-hand-that-feeds-me my-cat 1))
; 		   books) 		   	      
; (table-display books)

;;; problem 3 ;;; 		   	      
;; Hint: Writing (filter predicate lst) might be helpful

; ? Filter already defined in databases.scm
(define (filter pred lst) 		   	      
  (cond ((null? lst) '())
        ((not (pair? lst)) (error "Not a list" lst)) ; since pair? '() is #f, we need to first look to null? lst, and then pair? lst
        ((pred (car lst)) 		   	      
         (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))
 		   	       		   	      
(define (table-select selector table)
  (cond ((not (table? table)) (error "Not a table" table))
        (else
         (let ((selected-rows (filter
                               selector
                               (get-table-data table))))
           (make-table (get-table-columns table) selected-rows))
         )
        )
  )

;; test cases 		   	      
 		   	      
; (display "Testing Problem 3\n")
; (table-display 		   	      
;  (table-select 		   	      
;   (lambda (row) 		   	      
;     (> (get 'rating row) 4))
;   books)) 	   	      
 		   	      
;;; problem 4 ;;; 		   	      
 		   	      
;; Hint: Be careful about the comparator operator of the corresponding
;; row.  Writing a (get-column-type row column-name) might be helpful.

; I defined get-column-type to find operator here
;  but a make-row-comparator is already defined, so i used that instead

; No findf in R5RS
; Returns first occurance of pred being true in lst
(define (findf pred lst)
  (cond ((null? lst) #f)
        ((pred (car lst))
         (car lst))
        (else (findf pred (cdr lst))))
  )

(define (get-column-type row col-name)
  (cond ((not (row? row)) (error "Not a row" row))
        (else
         (let* ((columns (row-columns row))
                (found-col
                 (findf (lambda (x) (eq? (column-name x) col-name))
                        columns)))
           (cond ((not found-col) (error "Column not found" col-name))
                 (else (column-type found-col)))))
        )
  )

; Tests for get-column-type
;(get-column-type (table-nth-row 1 books) 'rating)
;(get-column-type (table-nth-row 1 books) 'author)
;(get-column-type (table-nth-row 1 books) 'not-a-column)

(define (table-order-by column table)
  (cond ((not (table? table)) (error "Not a table" table))
        (else
         (let* ((operator (make-row-comparator column table))
                (sorted-rows (sort operator (get-table-data table))))
           (make-table (get-table-columns table) sorted-rows)))
        )
  ) 		   	      
;; test cases 		   	      
; (display "Testing Problem 4\n")
; (table-display 		   	      
;  (table-order-by 'rating books)
; ) 		   	      
; 		   	      
; (table-display 		   	      
;  (table-order-by 'title books)
; ) 		   	      
 		   	      
;;; problem 5 ;;; 		   	      
 		   	      
(define (table-delete! pred table)
  (define (dont-delete row) (not (pred row)))
  (let* ((filtered-table (table-select dont-delete table))
         (filtered-data (get-table-data filtered-table)))
    (change-table-data! table filtered-data))
  ) 		   	      
 		   	      
;; test cases 		   	      
; (display "Testing Problem 5\n")
; (table-delete! 		   	      
;  (lambda (row) 		   	      
;   (eq? (get 'author row) 'my-cat))
; books) 		   	      
 		   	      
;; (table-display books) 		   	      
 		   	      
;;; problem 6 ;;;

; I could also have used row-type-check, but i have already written this
;  and this is more efficient since it only checks the value to be inserted
;  instead of checking all of it again, when it is not actually required
(define (check-value-fits-col col value)
  (let* ((col-type (column-type col))
         (checker (type-checker col-type)))
    (if (checker value)
        #t
        (error "Value doesn't fit type" value col-type)))
  )

; test cases for check-value-fits-col
;(check-value-fits-col (make-column 'test 'symbol) 1)
;(check-value-fits-col (make-column 'test 'number) 1)

(define (table-update! pred column proc table)
  (let ((columns (get-table-columns table)))
    (define (update-if-true row)
      (cond ((pred row)
             (let ((value (proc row)))
               (cond ((not (equal? #t (check-value-fits-col (findf (lambda (col) (eq? (column-name col) column)) columns) value))) row) ; Itself if type check fails and doesnt return #t
                     (else (row-col-replace row column value)))))
            (else row)))
    (let ((updated-data (table-map update-if-true table)))
      (change-table-data! table updated-data)) )
  ) 		   	      
;; test cases 		   	      
 		   	      
;(display "Testing Problem 6\n")
;(table-update! (lambda (row) (or (eq? (get 'name row) 'amy) (eq? (get 'name row) 'alex)))
;               'major 		   	      
;               (lambda (row) '9)
;               example-table)
;(table-display example-table)

; for error
;(table-update! (lambda (row) (or (eq? (get 'name row) 'amy) (eq? (get 'name row) 'alex)))
;               'major 		   	      
;               (lambda (row) 'a)
;               example-table)
;(table-display example-table)
;;; problem 7 ;;; 		   	      

(define *type-table* 		   	      
  (append
   *type-table*
   (list
    (list 'string string? string<?)))
  ) 		   	      
(define example-table2
  (make-empty-table
   (list (make-column 'name 'string)
         (make-column 'major 'number)))
  )		   	      

;; test cases 		   	      
;(display "Testing Problem 7\n")
;(table-insert! '("jen" 3) example-table2)
;(table-insert! '("ben" 6) example-table2)
;(table-insert! '("alex" 6) example-table2)
;(table-insert! '("amy" 12) example-table2)
;(table-insert! '("kim" 13) example-table2)
 		   	      
 		   	      
;(table-display example-table2)
;(display "\nordered example-table2\n")
;(table-display 		   	      
; (table-order-by 'name example-table2)
;) 		   	      
 		   	      
;;; problem 8 ;;; 		   	      
 		   	      
;; Hint: Writing these two procedures might be helpful (contains? lst
;; x) returns true if x in the lst and (get-pos lst x) returns the
;; position of x if it is in the list.
;; Ex: (get-pos '(1 2 3 4) 2) => 2
;;     (get-pos '(1 2 3 4) 5) => 0

(define (contains? lst x)
  (let ((res (findf (lambda (y) (equal? x y)) lst))) ; Res is either x or #f
    (if (not res) ; this is required as this since res might not be #t, it can also be #f or an element
        #f
        #t)))

(define (get-pos lst x)
  (define (iter curr-lst at)
    (cond ((null? lst) 0) ; pair? is below null? because it also gives false for null list
          ((not (pair? lst)) (error "Not a list" curr-lst))
          ((equal? (car curr-lst) x) at)
          (else (iter (cdr curr-lst) (+ at 1)))))
  (iter lst 1))

(define (make-enum-checker lst)
  (lambda (sym)
    (contains? lst sym))
  ) 		   	      
(define (make-enum-comparator lst)
  (lambda (x y)
    (let ((first (get-pos lst x))
          (second (get-pos lst y)))
      (cond ((or (= first 0) (= second 0)) (error "One of the arguments not found in enumeration" x y)) ; Either one is not found, TODO: what should this return
            (else (< first second))))) 
  ) 		   	      
(define *days* '(sunday monday tuesday Wednesday thursday friday saturday))
(define day-checker (make-enum-checker *days*))
(define day-comparator (make-enum-comparator *days*))
 		   	      
;; test cases 		   	      
;(display "Testing Problem 8\n")
;(day-checker 'monday)   ;=> #t
;(day-checker 7)         ;=> #f
;(day-comparator 'monday 'tuesday)   ;=> #t (monday is "less than" tuesday)
;(day-comparator 'friday 'sunday)    ;=> #f (sunday is before friday)
		   	      
 		   	      
(define *type-table* 		   	      
 (append
   *type-table*
   (list
    (list 'day day-checker day-comparator)))	   	      
) 		   	      
 		   	      
;(define example-table3 		   	      
;  (make-empty-table 		   	      
;   (list (make-column 'name 'string)
;         (make-column 'date 'day)
;         (make-column 'major 'number)))
;   ) 		   	      

; Test cases
;(table-insert! '("jen" monday 3) example-table3)
;(table-insert! '("ben" sunday 6) example-table3)
;(table-insert! '("alex" friday 6) example-table3)
;(table-insert! '("amy" tuesday 1) example-table3)
;(table-insert! '("kim" saturday 2) example-table3)
; 		   	      
;(table-display example-table3)
;(display "\nordered example-table3\n")
;(table-display 		   	      
; (table-order-by 'date example-table3)
;) 		   	      
 		   	      
;;; Problem 9 		   	      
;; Hint: Similar with Problem 8
(define *gender* '(male female))
(define gender-checker 		   	      
  (make-enum-checker *gender*) 		   	      
  ) 		   	      
(define gender-comparator 		   	      
  (make-enum-comparator *gender*)
  ) 		   	      
(define *race* '(white black red))
 		   	      
(define race-checker 		   	      
  (make-enum-checker *race*) 		   	      
  ) 		   	      
(define race-comparator 		   	      
  (make-enum-comparator *race*) 		   	      
  ) 		   	      

(define *type-table* 		   	      
  (append
   *type-table*
   (list
    (list 'gender gender-checker gender-comparator)
    (list 'race race-checker race-comparator)))	   	      
  )
 		   	      
;;; Problem 10 		   	      
 		   	      
(define person-table 		   	      
  (make-empty-table 		   	      
   (list (make-column 'name 'string)
         (make-column 'race 'race)
         (make-column 'gender 'gender)
         (make-column 'birthyear 'number))) 		   	      
) 		   	      
;;; tests 		   	      
;(display "Testing Problem 10\n")
;(table-insert! '("jen" white female 1983) person-table)
;(table-insert! '("axe" black male 1982) person-table)
;(table-display person-table)
 		   	      
 		   	      
;;; Problem 11 		   	      
 		   	      
(define (make-person name race gender birthyear)
  (table-insert! (list name race gender birthyear) person-table)
  name) 		   	      
 		   	      
;; test cases 		   	      
 		   	      
;(display "Testing Problem 11\n")
; 		   	      
;(define p1 (make-person "Alex" 'white 'male 1983))
;(define p2 (make-person "Clark" 'black 'male 1982))
;(table-display person-table)
 		   	      
;;; Note that you might delete the test people you created by typing
;(table-delete! (lambda (x) #t) person-table)
;;; And you can verify the removal operation by typing
;(display "\nDeleted Person Table\n")
;(table-display person-table)
;;; 		   	      
;;; Note that, you might need to create test people again in later questions
 		   	      
 		   	      
;;; Problem 12 		   	      
 		   	      
(define (person-name person) person)
 		   	      
(define (lookup-person-row person)
  (let* ((data (get-table-data person-table))
         (result (findf (lambda (row) (equal? (get 'name row) person)) data)))
    (cond ((not result) (error "Person not found in person table" person))
          (else result))
    )
  )

(define (person-race person) 		   	      
  (get 'race (lookup-person-row person)))
 		   	      
(define (person-gender person) 		   	      
  (get 'gender (lookup-person-row person)))
 		   	      
(define (person-birthyear person)
  (get 'birthyear (lookup-person-row person)))
 		   	      
(define (person-age person) 		   	      
; returns an approximation to the person's age in years
  (let ((*current-year* 2017)) 		   	      
    (- *current-year* (person-birthyear person))))
 		   	      
;; test cases 		   	      
;;; Note that, you can create test people to check the selectors.
; Recreating the test people
;(define p1 (make-person "Alex" 'white 'male 1983))
;(define p2 (make-person "Clark" 'black 'male 1982))
;(table-display person-table)

;(display "Testing Problem 12\n")
;(lookup-person-row p1) 		   	      
;(person-race p1) 		   	      
;(person-gender p1) 		   	      
;(person-birthyear p1) 		   	      
;(person-age p1) 		   	      
;(lookup-person-row "Sneijder")
 		   	      
;;; Problem 13 		   	      
 		   	      
(define (update-person-row! person colname newvalue)
  (let* ((person-row (lookup-person-row person))
         (updated-row (row-col-replace person-row colname newvalue)))
    (set-cdr! person-row (cdr updated-row)))		   	      
  ) 		   	      
 		   	      
(define (set-person-name! person newname)
  (update-person-row! person 'name newname))
 		   	      
(define (set-person-race! person newrace)
  (update-person-row! person 'race newrace))
 		   	      
(define (set-person-gender! person newgender)
  (update-person-row! person 'gender newgender))
 		   	      
(define (set-person-birthyear! person newbirthyear)
  (update-person-row! person 'birthyear newbirthyear))
 		   	      
;; QUESTION What happens? Why? Comments?
; Update row updates the row, but not the person identifier/object/string given, so when we rename the name field in the table
;   we can no longer access it with our person, since it is different than the updated name in the talbe
; For example the name has changed, alyssa is "allyssa-p-hacker", but the name in the table is "alyssa-p-hacker-bitdiddle"
;   so we can't use it to change another field
 		   	      
;;; test cases 		   	      

;(display "Testing Problem 13\n")
;(define alyssa (make-person "alyssa-p-hacker" 'black 'female 1978))
;(set-person-name! alyssa "alyssa-p-hacker-bitdiddle")  ; got married!
;(table-display person-table)
;(person-name alyssa) 		   	      
;(person-race alyssa) 		   	      
 		   	      
;;; Note: after running the test cases above, please comment out them again.
 		   	      
;;; Problem 14 		   	      
 		   	     
; Every field (including the year) is a number
; So we map column names to cols of column name, 'number
(define life-table
  ((lambda (cols)
    (make-empty-table 
      (map (lambda (colname) (make-column colname 'number)) cols))
    ) `(year 
        all-all all-male all-female 
        white-all white-male white-female 
        black-all black-male black-female) )
  )
(table-insert-all! life-expect-data life-table)
 		   	      
;(display "Testing Problem 14\n")
;(display "Selecting 1950\n")
;(table-display
;  (table-select
;    (lambda (row)
;      (= (get 'year row) 1950))
;    life-table))
 		   	      
;;; Problem 15

(define (convert-lifetable lst)
;; Converts the data to the (year race gender expected) format
  ; Extracts data of given race, gender, and 0 based index target expected field
  (define (extract race gender expected-at)
    (map 
      (lambda (row)
        (list (list-ref row 0) race gender (list-ref row expected-at)))
      lst)
    )
  ; I wasn't sure whether to have all's, but since they're fields of gender and race
  ;  and gender and race fields don't have all, so it was more sensical to skip alls
  (let ((white-male (extract 'white 'male 5))
        (white-female (extract 'white 'female 6))
        (black-male (extract 'black 'male 8))
        (black-female (extract 'black 'female 9)))
   (append white-male white-female black-male black-female))
)
; The above function can also be done in one loop instead of multiple complete loops, getting the seperate data in one loop
     		   	      
;; test cases	   	      
(define life-expect-data-new (convert-lifetable life-expect-data))
 		   	      
(define life-table-new 		   	      
   (make-empty-table 		   	      
   (list (make-column 'year 'number)
         (make-column 'race 'race)
         (make-column 'gender 'gender)
         (make-column 'expected 'number)
   ))) 		   	      
(table-insert-all! life-expect-data-new life-table-new)
(display "Selecting 1950 from new data\n")
(table-display 		   	      
(table-select 		   	      
 (lambda (row) 		   	      
  (= (get 'year row) 1950)) 		   	      
  life-table-new)) 		   	      
 		   	      
 		   	      
;;; Problem 16 		   	      
(display "\nTesting Problem 16\n")
(define problem16-table
  (table-select 
    (lambda (row)
      (let ((year (get 'year row))
            (race (get 'race row))
            (gender (get 'gender row))) 
        (and (>= year 1950) (<= year 1959) (equal? race 'white) (equal? gender 'female))))
    life-table-new)
  )

;;; QUESTION Was life expectancy for white women steadily increasing
;;; in this decade? 		   	      
; Yes, in this time range, life expectancy for white women was increasing *steadily*

(table-display 		   	      
  (table-order-by 'expected problem16-table)
) 		   	      
 		   	      
;; Paste the output of Problem 16 for black female
;; between 1950 and 1959 		   	      
;; Output:  		   	      
;year	race	gender	expected	
;1950	black	female	62.9	
;1951	black	female	63.4	
;1952	black	female	63.8	
;1953	black	female	64.5	
;1957	black	female	65.5	
;1958	black	female	65.8	
;1954	black	female	65.9	
;1956	black	female	66.1	
;1955	black	female	66.1	
;1959	black	female	66.5	 		   	      

;(define problem16-black-female-table
;  (table-select 
;    (lambda (row)
;      (let ((year (get 'year row))
;            (race (get 'race row))
;            (gender (get 'gender row))) 
;        (and (>= year 1950) (<= year 1959) (equal? race 'black) (equal? gender 'female))))
;    life-table-new)
;  )
 		   	      
;(table-display 		   	      
;  (table-order-by 'expected problem16-black-female-table)
;) 		   	      
 
;;; Problem 17 		   	      
 		   	      
(define p3 (make-person "GeorgeBest" 'white 'female 1987))
(define p4 (make-person "Lizarazu" 'white 'male 1940))
 		   	      
(define (expected-years person)
  (let ((p-year (person-birthyear person))
        (p-race (person-race person))
        (p-gender (person-gender person))
        (p-age (person-age person)))
    (let ((person-data
           (table-select 
            (lambda (row)
              (let ((year (get 'year row))
                    (race (get 'race row))
                    (gender (get 'gender row))) 
                (and (= year p-year) (equal? race p-race) (equal? gender p-gender))))
            life-table-new)))
      (if (empty-table? person-data)
          (error "Data not found for given person" person)
          (- (get 'expected (table-nth-row 0 person-data)) p-age))
      )
    )
  ) 		   	      
;; test cases 		   	      
(display "Testing problem 17") 		   	      
(expected-years p3) 		   	      
(expected-years p4)

; Actually the above works for cohort life tables, but the description wants it like this
;  so the fact that it is period life table doesn't make sense
; The example given and the information doesn't hold
