(define (last-pair lst)
  (cond ((null? lst) (error "List has no pairs"))
        ((null? (cdr lst)) lst)
        (else (last-pair (cdr lst)))))

(define circular-tag 'circular)

(define circular-list
  (lambda elems
    (let ((crc-list (cons circular-tag elems)))
      (set-cdr! (last-pair crc-list) (cdr crc-list))
      crc-list)))

(circular-list 1 2 3)
(circular-list)

(define crc (circular-list 1))
crc

(define (is-crc? crc-list)
  (and (not (null? crc-list)) (eq? (car crc-list) circular-tag)))

(is-crc? crc)
(is-crc? `(1 2))

(define (is-empty-crc? crc-list)
  (and (is-crc? crc) (null? (cdr crc-list))))

(define crc-data cdr) ; Todo: maybe check for errors also here like everywhere else ?

(define (is-last-pair-crc? crc-list pair)
  (eq? (cdr pair) crc-list))

(define (last-pair-crc! crc-list)
  (define (helper crc-list curr-list)
    (cond ((is-last-pair-crc? crc-list curr-list) curr-list)
          (else (helper crc-list (cdr curr-list)))))
  (cond ((not (is-crc? crc-list)) (error "Not a circular list"))
        (else (helper (crc-data crc-list) (crc-data crc-list)))))

(last-pair-crc! crc)
(last-pair-crc! (circular-list 2 3))

(define (circular-insert! crc-list val)
  (cond ((not (is-crc? crc-list)) (error "Not a circular list"))
        ((is-empty-crc? crc-list) (set-cdr! crc-list (cdr (circular-list val)))) ; 0 Elements
        (else
         (let ((to-insert (list val)))
           (set-cdr! to-insert (crc-data crc-list))
           (set-cdr! (last-pair-crc! crc-list) to-insert)))))

crc
(circular-insert! crc 2)
crc
(circular-insert! crc 3)
crc

(define crc (circular-list))
(circular-insert! crc 1)
crc

(define crc (circular-list 1 2 3 4))
(define (circular-map fn crc-list)
  (define (iter fn crc-list curr-list)
    (cond ((is-last-pair-crc? crc-list curr-list) (list (fn (car curr-list))))
          (else (cons (fn (car curr-list)) (iter fn crc-list (cdr curr-list))))))
  (cond ((not (is-crc? crc-list)) (error "Not a circular list"))
        ((is-empty-crc? crc-list) (circular-list))
        (else (apply circular-list (iter fn (crc-data crc-list) (crc-data crc-list))))))
(circular-map (lambda (x) (* x x)) crc)
