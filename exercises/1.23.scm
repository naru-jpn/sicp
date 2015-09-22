; 1.23

; 目的のプログラム

(define (divides? a b)
  (= (remainder b a) 0))

(define (next test-divisor)
  (if (= test-divisor 2) 3 (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
;
; 速度のテストは、小さい数では精度も悪く測定が行えない為、100000000 から 1000000050 までに含まれる素数のチェックにかかる時間の比較を行った。
;
; (search-for-primes 1000000000 1000000050)
;
; 1000000007 *** 3.0000000000000027e-2
; 1000000009 *** 1.9999999999999962e-2
; 1000000021 *** 2.0000000000000018e-2
; 1000000033 *** .02999999999999997
;
; 改良前のプログラムによる素数テェックの為の平均計算時間: 0.45[sec]
; 改良後のプログラムによる素数テェックの為の平均計算時間: 0.25[sec]
; 0.45/0.25 = 1.8
;
; 結果は 1.8 で 2 よりも小さい。
; 局所的に見れば、素数のテェックを行う回数は約半分になっているが、next の評価や、next の定義内にある if などは改良前にはなかった処理である。
; 処理の回数は半分にはなっておらず、その結果ではないか。
;
