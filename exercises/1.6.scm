; sicp 1.6

; new-if ではまず全ての引数が評価される。
; (sqrt-iter (improve guess x) x) を評価すると、再び手続き new-if が現れる。
; new-if は際限無く入れ子になり、処理は終わらない。


; 実際に実行すると
; ;Aborting!: maximum recursion depth exceeded
; と表示されて、エラーが発生して処理が止まった。

