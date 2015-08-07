; 1.17

; b が偶数の場合
;  a*b = 2a*(b/2)
; b が奇数の場合
;  a*b = a+a*(b-1)
; である。
;
; 仮定にある double と halve は、あるとすると書かれているが、
; 実行のために必要なのでそれぞれ + と / で実装しておく。


(define (even? n)
    (= (remainder n 2) 0))

(define (double n)
    (+ n n))

(define (halve n)
    (/ n 2))

(define (multiple a b)
    (cond ((= b 1) a)
          ((even? b) (multiple (double a) (halve b)))
          (else (+ a (multiple a (- b 1))))))

(multiple 3 4)
; 12

(multiple 2 100000)
; 200000
; (元々のプログラムはこの時点で maximum recursion depth exceeded となる。)

(multiple 2 1000000000)
; 2000000000
 
