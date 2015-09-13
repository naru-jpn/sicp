; 1.19

; 仮定
;   a1 = b0q + a0q + a0p ... (1
;   b1 = b0p + a0q       ... (2
;
;   a2 = b1q + a1q + a1p ... (3
;   b2 = b1p + a1q       ... (4
;
;  (3, (4  に (1, (2 を代入する
;
;   a2 = (b0p + a0q)q + (b0q + a0q + a0p)q + (b0q + a0q + a0p)p
;      = 2*b0pq + b0q^2 + 2*a0q^2 + 2*a0pq + a0p^2
;      = (2pq + q^2)b0 + (2pq + 2q^2 + p^2)a0
;      = (2pq + q^2)b0 + (2pq + q^2)a0 + (q^2 + p^2)a0
;
;   b2 = (b0p + a0q)p + (b0q + a0q + a0p)q
;      = b0p^2 + 2*a0pq + b0q^2 + a0q^2
;      = (q^2 + p^2)b0 + (2pq + q^2)a0
;
;  従って、
;   p' = (p^2 + q^2)
;   q' = (2pq + q^2)
;
 
;  プログラムを書くとほぼ問題文を書く事になってしまうので、ここには書かない。
;  上で求めたものを <??> に代入するだけである。
;
;  2n回の変換 T_(pq) と、n回の変換 T_(p'q') が等しい事を利用した問題。
