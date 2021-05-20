# Structure and Interpretation of Computer Programs
by AndOr aka @deovaliandro

## Building Abstractions with Procedures

### Exercise 1.1

```scheme
10                                  = 10

(+ 5 3 4)                           = 12

(- 9 1)                             = 8

(/ 6 2)                             = 3

(+ (* 2 4) (- 4 6))                 = 8 + (-2) = 6

(define a 3)                        = a = 3

(define b (+ a 1))                  = b = 4

(+ a b (* a b))                     = 3 + 4 + 12 = 19

(= a b)                             = #f (false)

(if (and (> b a) (< b (* a b)))     = 4
    b
    a)

(cond ((= a 4) 6)                   = 16
    ((= b 4) (+ 6 7 a))
    (else 25))

(+ 2 (if (> b a) b a))              = 6

(* (cond ((> a b) a)                = 16
        ((< a b) b)
        (else -1))
    (+ a 1))
```

### Exercise 1.2

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (* (- 6 2) (- 2 7 ))))
```

result = -37/150 (dif by -2)

### Exercise 1.3

```scheme

(define (num a b c) ((cond ((and (= a b) (= b c)) (sumsquare a b)) ((and (= a b) (= b c) (= a c)) (sumsquare b c)) ((and (not a b) (not a c) (not b c)) (sumsquare a c)))))

(define
    (num a b c) (
        (cond
            ((and (= a b) (= b c)) (sumsquare a b))
            ((and (or (= a b) (= b c) (= a c)) (not (and (= a b) (= b c)))) (sumsquare b c))
            ((or (not a b) (not a c) (not b c)) (sumsquare a c))
        )
    )
)

(define (sumsquare a b) (+ (* a a) (* b b)))

(define (num a b c) (
    (cond
        ((and (= a b) (= b c)) (sumsquare a b))
        ((and (or (= a b) (= b c) (= a c)) (not (and (= a b) (= b c)))) (
            (cond
                ((and (= a b) (> a c))  (sumsquare a b))
                ((and (= a b) (< a c))  (sumsquare a c))
                ((and (= a c) (> a b))  (sumsquare a c))
                ((and (= a c) (< a b))  (sumsquare a c))
                ((and (= b c) (> a c))  (sumsquare b c))
                ((and (= b c) (< a c))  (sumsquare b c))
            )
        ))
        ((or (not a b) (not a c) (not b c)) (
            [(or (and (> b c) (> c a)) (and (> c b) (> b a)))  (sumsquare b c)]
            [(or (and (> a b) (> b c)) (and (> b a) (> a c)))  (sumsquare a b)]
            [(or (and (> a c) (> c b)) (and (> c a) (> a b)))  (sumsquare a c)]
        ))
    )
))

[(or (= a b) (= a c) (= b c)) (
            (cond
                [(and (= a b) (> a c))  (sumsquare a b)]
                [(and (= a b) (> a c))  (sumsquare a b)]
                [ else                  (sumsquare a c)]
            )
            (cond
                [(and (= a c) (> a b))  (sumsquare a c)]
                [ else                  (sumsquare a b)]
            )
            (cond
                [(and (= b c) (> a c))  (sumsquare b c)]
                [ else                  (sumsquare a c)]
            )
        )]

        [(or (not a b) (not a c) (not b c)
            [(or (and (> b c) (> c a)) (and (> c b) (> b a)))  (sumsquare b c)]
            [(or (and (> a b) (> b c)) (and (> b a) (> a c)))  (sumsquare a b)]
            [(or (and (> a c) (> c b)) (and (> c a) (> a b)))  (sumsquare a c)]
        )]
```