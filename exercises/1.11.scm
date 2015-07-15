; sicp 1.11

; 再帰的プロセス
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; 反復的プロセス
;
; fib-iter を参考にする。
; fib-iter の場合、漸化式は f(n) = f(n-1) + f(n-2) と書ける。
; f(n), (n>=2) を計算する為に、あらかじめ f(1) と f(0) は分かっていなければいけない。

(define (f n)
    (f-iter 2 1 0 n))

(define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* b 2) (* c 3)) a b (- count 1))))

