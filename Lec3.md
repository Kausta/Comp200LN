# Lecture 3 @ 17/09/26

## Summary: Substition Model

To evaluate a combination:

1- Evaluate all subexpressions
2- Apply the first value (operator) to all other values (arguments)

To apply a compound procedure

1- Substitute each parameter with the corresponding argument in procedure body.
2- Evaluate the procedure body.

```
(define square 
        (lambda (x) 
                (* x x)))
(square 4)
 > ((lambda (x) (* x x)) 4)
 > (*:Mult-Proc x:4 x:4)
 > 16
(define average 
        (lambda (x y) 
                (/ (+ x y) 2)))
(average 5 (square 3))
 > ((lambda (x y) ...) 5 (* x:3 x:3) -> 9)
 > (/ (+ x:5 y:9) 2) => 7 
```

### Special Forms

Unlike combinations, these do NOT evaluate all subexpressions
