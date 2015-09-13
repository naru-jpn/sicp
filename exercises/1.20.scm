; 1.20

; 正規順序
;
;    (gcd 206 40)
;      (= 40 0)
;       -> #f
;    (gcd 40 (remainder 206 40))
;      (= (remainder 206 40) 0)
; 1     -> (= 6 0)
;       -> #f
;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;      (= (remainder 40 (remainder 206 40)) 0)
; 2     -> (= (remainder 40 6) 0)
; 3     -> (= 4 0)
;       -> #f
;    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;      (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
; 6     -> (= (remainder 6 4) 0)
; 7     -> (= 2 0)
;       -> #f
;    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;      (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
; 12    -> (= (remainder 4 (remainder 6 4)) 0)
; 13    -> (= (remainder 4 2) 0)
; 14    -> (= 0 0)
;       -> #t
;    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 16 (remainder 6 (remainder 40 6))
; 17 (reminader 6 4)
; 18 2
;
; 計18回のremainder演算が行われた

; 作用順序
;
;    (gcd 206 40)
;      (= 40 0) -> #f
;    (gcd 40 (remainder 206 40))
; 1  (gcd 40 6)
;      (= 6 0) -> #f
;    (gcd 6 (remainder 40 6))
; 2  (gcd 6 4)
;      (= 4 0) -> #f
;    (gcd 4 (remainder 6 4))
; 3  (gcd 4 2)
;      (= 2 0) -> #f
;    (gcd 2 (remainder 4 2))
; 4  (gcd 2 0)
;      (= 0 0) -> #t
;    2
;
; 計4回のremainder演算が行われた

