; 2変数関数を3次元上にプロットします。
; 反復的プロセスで計算を行います。

(define device (make-graphics-device (car (enumerate-graphics-types))))
(clear)
(write-string ";How to use:\n")
(write-string ";  (plot-3d f(x,y) max-x max-y max-z delta title)\n")
(write-string ":  Type '(graphics-close device)' when you close graphic window.\n\n")

(define (plot-3d f max-x max-y max-z delta title)
    ; clear
    (graphics-clear device)
    ; draw title, x-axis, y-axis, x-axis
    (graphics-draw-text device -0.96 0.94 title)
    (graphics-draw-line device -0.80 -0.70  0.30 -0.90) ; x-front
    (graphics-draw-line device  0.30 -0.90  0.80 -0.60) ; y-front
    (graphics-draw-line device -0.30 -0.40  0.80 -0.60) ; x-back
    (graphics-draw-line device -0.80 -0.70 -0.30 -0.40) ; y-back

    (graphics-draw-line device -0.80  0.00  0.30 -0.20) ; x-front
    (graphics-draw-line device  0.30 -0.20  0.80  0.10) ; y-front
    (graphics-draw-line device -0.30  0.30  0.80  0.10) ; x-back
    (graphics-draw-line device -0.80  0.00 -0.30  0.30) ; y-back

    (graphics-draw-line device -0.80 -0.70 -0.80  0.70) ; z1
    (graphics-draw-line device  0.30 -0.90  0.30 -0.20) ; z2
    (graphics-draw-line device  0.80 -0.60  0.80  0.10) ; z3
    (graphics-draw-line device -0.30 -0.40 -0.30  0.30) ; z4

; O: (0.0, 0.05)
    ; plot graph
    (define (next x) (+ x delta))
    (define sin-theta (/ -0.2 1.118)) ; sin(theta)
    (define tan-phy (/ 0.5 0.3)) ; tan(phy)
    (define (scale-x x y) (+ 0.0 (* (/ x max-x) (/ 1.1 2)) (* (/ y max-y) (/ 0.3 2) tan-phy)))
    (define (scale-y x y z) (+ 0.05 (* (/ y max-y) (/ 0.3 2)) (* (/ x max-x) (/ 1.1 2) sin-theta) (* (/ z max-z) (/ 1.4 2))))
    (define (draw-line-x x y)
        (graphics-draw-line device (scale-x x y) (scale-y x y (f x y)) (scale-x (next x) y) (scale-y (next x) y (f (next x) y))))
    (define (draw-line-y x y)
        (graphics-draw-line device (scale-x x y) (scale-y x y (f x y)) (scale-x x (next y)) (scale-y x (next y) (f x (next y)))))

    (define (iterative-draw-line-x x y)
        (cond
            ((>= x max-x) (cond 
                ((>= y max-y) ())
                (else (iterative-draw-line-x (- max-x) (next y)))))
            (else (draw-line-x x y)
                  (iterative-draw-line-x (next x) y))))

    (define (iterative-draw-line-y x y)
        (cond
            ((>= y max-y) (cond 
                ((>= x max-x) ())
                (else (iterative-draw-line-y (next x) (- max-y)))))
            (else (draw-line-y x y)
                  (iterative-draw-line-y x (next y)))))
   
    (iterative-draw-line-x (- max-x) (- max-y)) 
    (iterative-draw-line-y (- max-x) (- max-y))
    (string-append "Drawn graph named '" title "'.")
)
