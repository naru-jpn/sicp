; 1.24

; 目的のプログラム

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
      (remainder (square (expmod base (/ exp 2) m)) m))
    (else
      (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next test-divisor)
  (if (= test-divisor 2) 3 (+ test-divisor 2)))

(define (search-for-primes n max)
  (cond ((even? n) (search-for-primes (+ n 1) max))
        ((> n max) "finish")
        (else
          (timed-prime-test n)
          (search-for-primes (+ n 2) max))))

