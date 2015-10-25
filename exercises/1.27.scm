; 1.27

; 目的のプログラム

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
      (remainder (square (expmod base (/ exp 2) m)) m))
    (else
      (remainder (* base (expmod base (- exp 1) m)) m))))

(define (carmichael-test-itr n a)
  (cond ((= n a) #t)
        ((= (expmod a n n) a) (carmichael-test-itr n (+ a 1)))
        (else #f)))

(define (carmichael-test n)
  (carmichael-test-itr n 1))

; 実行結果 (#t ならば素数であるという判定)

(carmichael-test 561)
; #t

(carmichael-test 1105)
; #t

(carmichael-test 1729)
; #t

(carmichael-test 2465)
; #t

(carmichael-test 2821)
; #t

(carmichael-test 6601)
; #t

