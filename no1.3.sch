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

(num 1 2 3)