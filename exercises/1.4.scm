; SICP 1.4

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))

(a-plus-abs-b 1 2)
; 3

(a-plus-abs-b 1 -2)
; 3

; 1. b が正数の場合 
;     (> b 0) = #t
;     b = |b|
;       なので、
;     ((if (> b 0) + -) a b))
;       => ((if #t + -) a b))
;       => (+ a b)
;
;    a + b = a + |b| が計算される

; 2. b が非正数の場合 
;    (> b 0) = #f
;    b = -|b|
;      なので、
;    ((if (> b 0) + -) a b))
;       => ((if #f + -) a b))
;       => (- a b)
;
;    a - b = a - (-|b|) = a + |b| が計算される

