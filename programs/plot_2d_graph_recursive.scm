; 1変数関数を2次元上にプロットします。
; 線形再帰的プロセスで計算を行います。

(define device (make-graphics-device (car (enumerate-graphics-types))))
(clear)
(write-string ";How to use:\n")
(write-string ";  (plot-2d f(x) max-x max-y delta title clear_or_not)\n")
(write-string ":  Type '(graphics-close device)' when you close graphic window.\n\n")

(define (plot-2d f max-x max-y delta title clear)
    ; clear
    (if clear (graphics-clear device) ())
    ; draw title, x-axis, y-axis
    (graphics-draw-text device -0.96 0.94 title)
    (graphics-draw-line device -1 0 1 0)
    (graphics-draw-text device 0.94 0.04 (number->string max-x 10))
    (graphics-draw-line device 0 -1 0 1)
    (graphics-draw-text device 0.04 0.94 (number->string max-y 10))
    (graphics-draw-text device 0.02 -0.06 "O")
    ; plot graph
    (define (next x) (+ x delta))
    (define (draw-line x1 x2)
        (define (scale-x _x) (/ _x max-x))
        (define (scale-y _y) (/ _y max-y))
        (graphics-draw-line device (scale-x x1) (scale-y (f x1)) (scale-x x2) (scale-y (f x2)))
        x1)
    (define (recursive-draw-line x)
        (cond
            ((>= x max-x) x)
            (else (draw-line x (recursive-draw-line (next x))))))

    (recursive-draw-line (- max-x))
    (string-append "Drawn graph named '" title "'."))

