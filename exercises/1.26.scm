; 1.26

; まず引数が評価される事を思い出すと、exp が偶数の場合に expmod が2重に呼び出されている。
; 結局 exp と同じ程度の回数だけ expmod が呼び出されるので、θ(n) のプロセスになる。
