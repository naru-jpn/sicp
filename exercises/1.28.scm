; 1.28

; 目的のプログラム

(define (miller-rabin-test n a)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= (remainder (* a a) n) 1)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((miller-rabin-test base m) 0)
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
; #f

(carmichael-test 1105)
; #f

(carmichael-test 1729)
; #f

(carmichael-test 2465)
; #f

(carmichael-test 2821)
; #f

(carmichael-test 6601)
; #f

; 改善された。
