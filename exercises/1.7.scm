; sicp 1.7

; 1. 小さい数の場合
;  例えば 0.001 の平方根を求めようとした場合、(abs (- (square guess) x)) の値が 0.001 以下になれば計算は終わるが、
;  これは 2 の平方根を求める際に (abs (- (square guess) x)) の値が 2 以下であれば計算を終了しろと言っているような
;  もので、数が小さくなると精度が非常に悪くなる。

; 2. 大きい数の場合
;  引き算する数同士が大きすぎるので、good-enough? 内の比較が正常に行われない。
;  (数値の扱われ方を理解できていないのではっきりした議論はまだできません。)


; 新旧予想値の差を考える

(define (square x) (* x x)) 

(define (good-enough? new-guess old-guess)
        (< (abs (- old-guess new-guess)) 0.001)) 

(define (improve guess x)
        (average guess (/ x guess))) 

(define (sqrt-iter new-guess old-guess x)
        (if (good-enough? new-guess old-guess)
            new-guess 
            (sqrt-iter (improve new-guess x) new-guess x))) 

(define (sqrt x) (sqrt-iter 1.0 x x))

; これも上で述べた理由と同様で、小さい値と大きい値では求めたい結果は得られない。
; ここでは数の比較の仕方ではなく、許容する誤差の決め方によって問題を解決しよう。
; 例えば、新しい手続き acceptable_error を考える。

(define (acceptable_error x) (/ x 2000))

; 2000 という値は 2 に対する 0.001 から定めた。
; この指定は、入力値の 1/2000 の誤差までを許容する事を意味する。

; 新しいプログラム

(define (square x) (* x x)) 

(define (average x y) (/ (+ x y) 2))

(define (acceptable_error x) (/ x 2000))

(define (good-enough? guess x) (< (abs (- (square guess) x)) (acceptable_error x))) 

(define (improve guess x) (average guess (/ x guess))) 

(define (sqrt-iter guess x) (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x))) 

(define (sqrt x) (sqrt-iter 1.0 x))

