; sicp 1.8

; 目的のプログラム

(define (square x) (* x x)) 

(define (cubic x) (* x x x)) ; (b)

(define (average x y) (/ (+ x y) 2))

(define (acceptable_error x) (/ x 2000))

(define (good-enough? guess x) (< (abs (- (cubic guess) x)) (acceptable_error x))) ; (c)

(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3)) ; (a)

(define (sqrt-iter guess x) (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x))) 

(define (sqrt x) (sqrt-iter 1.0 x))


; 問題 1.7 のプログラムからの修正点
; (a): 予測値を更新する為の表式を修正する。
; (b): 新しく3乗を計算する手続き cubic を定義した。
; (c): good-enough? では予測値の3乗と入力値を比較する。


(sqrt 8)
; 2.000004911675504

(sqrt 27)
; 3.0000005410641766

(sqrt 2)
; 1.259933493449977

(* 1.259933493449977 1.259933493449977 1.259933493449977)
; 2.0000592593226547

