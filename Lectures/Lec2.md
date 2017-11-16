# COMP 200 Lecture #2

## Anonymous Procedures

```
(lambda (x) (* x x))
 Anonymous Function Constructor
        Args
            Body

(lambda ...) -> Procedure
```

## With Define

```
(define square
    (lambda  (x)
        (* x x)))
(square 5) => 25
```
is equiavelent to
```
(define (square x) (* x x))
```

--- 

Q: Are define & lambda procedures ?
A: No. (Builtins ?)

## if

```
(if (> a b) a b)
    Condition
            if-true consequent
              if-false alternative
```

## Scheme Evaluator

To evaluate an expr:
1. If constant (number, bool, string) return value
2. If value return associated value
3. If special form, do something special (define, lambda, if) 
4. If combination: 
    * Evaluate all subexoressions
    * Apply the operator to arguments

To apply a procedure to args:
1. If primitive procedure (+, >, etc) just do it
2. If compound procedure (user defined with lambda):
    Eval the body with each parameter replaced with the corresponding input argument.

### Constants (Self-Evaluating Values)

```
3, 3.1, -4, #t, #f, "foo"
```