; 1.18

; 仮定

(define (even? n)
    (= (remainder n 2) 0))

(define (double n)
    (+ n n))

(define (halve n)
    (/ n 2))


; 目的のプログラム

(define (improved-multiple-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (improved-multiple-iter a (double b) (halve n)))
          (else (improved-multiple-iter (+ a b) b (- n 1)))))

(define (improved-multiple b n)
    (improved-multiple-iter 0 b n))


(multiple 3 4)
; 12

(multiple 2 100000)
; 200000

(multiple 2 1000000000)
; 2000000000

