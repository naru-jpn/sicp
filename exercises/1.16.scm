; 1.16.scm

; 目的のプログラム

(define (even? n)
    (= (remainder n 2) 0))

(define (fast-expt-iterative a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iterative a (* b b) (/ n 2))) ; ... 2)
          (else (fast-expt-iterative (* a b) b (- n 1)))))    ; ... 1)

(define (expt b n) (fast-expt-iterative 1 b n))


; 上記のプログラムは、主に2つの施策から構成される。
;   1) n が奇数の場合は a, n を更新する。
;   2) n が偶数の場合は n を小さくするような変換を行い、問題を小さくする。
;
; a の役割の把握と上との比較のために、Θ(n) のステップ数を必要とする工夫の無いプログラムを書く。

(define (slow-expt-iterative a b n)
    (cond ((= n 0) a)
          (else (slow-expt-iterative (* a b) b (- n 1)))))

(define (slow-expt b n) (slow-expt-iterative 1 b n))

; slow-expt-iterative は a, n の更新を逐一行うプログラムである。
; ここに 2) の施策を導入する。
;
; 問題は、b^n を求めることであった。
; n が偶数の場合、m を整数として n = 2m と書ける。
;   b^n = b^2m = (b^2)^m
; なので、
;   b' := b^2
; とおけば、問題を b'^m を求めることに置き換えることができる。
; この b', m を再び b, n と書けば、
;   a*b^n = a*b'^m -> a*b^n 。
; 不変量としての a*b^n を考えることができる。
;
; 1) の施策と不変量との関係を考える。
; a の初期値は 1 である。
; n が奇数の場合、m を整数として n = 2m+1 と書ける。
;   a*b^n = a*b^(2m+1) = (a*b)*b^2m
; で、
;   a' := a*b,
;   n' := 2m
; とおく。この a' と n' を再び a, n と書けば、
;   a*b^n = a*b^(2m+1) = (a*b)*b^2m -> a*b^n
; 不変量としての a*b^n を考えることができる。
;


;
; 問題本文に「不変量を定義する技法は設計に有用である」という旨の文章が書かれている。
; この問題を解く限りでは、ヒントは役に立ったものの不変量という観点から解答を考えるのは難しい。
; 不変量を利用できるような問題を一般的な形式で表すことはできないだろうか。
;
