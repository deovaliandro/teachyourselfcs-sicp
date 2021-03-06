# Structure and Interpretation of Computer Programs
by AndOr aka @deovaliandro

May 18th, 2021, we started small group in Discord to teach ourself SICP. We only 3 noob programmers.
The schedule follow [UC Berkeley CS61A - 2011](https://archive.org/details/ucberkeley-webcast-PL3E89002AA9B9879E?sort=titleSorter)

All of the homework assignments and labs are here in course reader [vol 1](https://people.eecs.berkeley.edu/~bh/61a-pages/).

The First-day handout (PDF) file contains the schedule. it's 3 classes per week and it has the required readings from sicp.

The libraries that have all those functions [here:](https://people.eecs.berkeley.edu/~bh/downloads/simply/)

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
(define (sumsquare a b) (+ (* a a) (* b b)))

(define (num a b c)
    (cond
        ((and (= a b) (= b c)) (sumsquare a b))
        ((or (and (= a b) (not (= a c))) (and (= b c) (not (= b a))) (and (= a c) (not (= a b))))
        (cond
                ((and (= a b) (> a c))  (sumsquare a b))
                ((and (= a b) (< a c))  (sumsquare a c))
                ((and (= a c) (> a b))  (sumsquare a c))
                ((and (= a c) (< a b))  (sumsquare a c))
                ((and (= b c) (> a c))  (sumsquare b c))
                ((and (= b c) (< a c))  (sumsquare b c))
        ))
        ((and (not (= a b)) (not (= b c)))
        (cond
            ((or (and (> b c) (> c a)) (and (> c b) (> b a)))  (sumsquare b c))
            ((or (and (> a b) (> b c)) (and (> b a) (> a c)))  (sumsquare a b))
            ((or (and (> a c) (> c b)) (and (> c a) (> a b)))  (sumsquare a c))
        )
)))
```