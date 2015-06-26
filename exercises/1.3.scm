; SICP 1.3

; 目的の手続き名: sum-of-squares-large2in3 

; --------------------
; 1. if で分岐
; --------------------

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-squares-large2in3 x y z)
    (if (< x y)
        (if (< x z) (sum-of-squares y z) (sum-of-squares x y))
        (if (< y z) (sum-of-squares x z) (sum-of-squares x y))
    )
)


; --------------------
; 2. 1,2 番目に大きいものを min, max で求める
; --------------------

(define (min a b) (if (< a b) a b))
(define (max a b) (if (> a b) a b))
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-squares-large2in3 x y z)
    (sum-of-squares (max x y) (max (min x y) z))
)


; --------------------
; 3. x^2 + y^2 + z^2 - min^2
; --------------------

(define (square x) (* x x))
(define (min a b) (if (< a b) a b))
(define (min3 a b c) (min a (min b c)))
(define (sum-of-squares3 x y z) (+ (square x) (square y) (square z)))

(define (sum-of-squares-large2in3 x y z) 
    (- (sum-of-squares3 x y z) (square (min3 x y z)))
)



(sum-of-squares-large2in3 3 1 2)
; 13

(sum-of-squares-large2in3 4 1 1)
; 17


; - 3つめは計算が多い
; - 先に進むと引数の個数に制限がない min や max を定義できるようになるらしい

