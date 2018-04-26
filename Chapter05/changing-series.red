Red []

; change an item:
data: [A B C D]
; data/3: X    ; doesn't work: X has no value!
data/3: "X"    ;== "X"
data           ;== [A B "X" D]
data: [A B C D]
poke data 3 "X"
data           ;== [A B "X" D]

blk: [11 12 13 14 [22 33 44] 15]
blk/5/2: 108
blk ;== [11 12 13 14 [22 108 44] 15]
i: 5 
j: 2
blk/:i/:j: 108 

; replace
replace [10 11 12] 11 13  ;== [10 13 12]
replace/all [10 11 12 11] 11 13  ;== [10 13 12 13]

; change
s: [2 7 13 42]
change s [a b]  ;== [13 42]
s               ;== [a b 13 42]

; alter
; If a value is not found in a series, append it; otherwise, remove it. 
; Returns true if added. 
s: ["Red" "Java"]
alter s "Crystal"  ;== true
s  ; == ["Red" "Java" "Crystal"]
alter s "Java"     ;== false
s  ;== ["Red" "Crystal"]

; swap
; Swaps elements between two series or the same series. 
swap [A B C][1 2 3]  ;== [1 B C]

; append
append [10 11 12] 13                  ;== [10 11 12 13]
append [10 11 12] [13 14]             ;== [10 11 12 13 14]
append/only [10 11 12] [13 14]        ;== [10 11 12 [13 14]]
append/part [10 11 12] [13 14 15] 2   ;== [10 11 12 13 14]
; /dup         => Duplicate the inserted values.
append/dup ["a" "b" "c"] ["A" "B"] 3  ;== ["a" "b" "c" "A" "B" "A" "B" "A" "B"]

list: ["John" 2804 "Dave" 9439 "Jane" 2386 "Bob" 9823 "Sue" 4217]
names: copy []
foreach [n c] list [append names n]  ; extract the names from list
names   ;== ["John" "Dave" "Jane" "Bob" "Sue"]

names: ["John" "Dave" "Jane" "Bob" "Sue"]
repeat i (length? names) [
    print append append form i ": " pick names i
]
; 1: John
; 2: Dave
; 3: Jane
; 4: Bob
; 5: Sue

; equivalent:
names: ["John" "Dave" "Jane" "Bob" "Sue"]
repeat i (length? names) [
    print append (append form i ": ") (pick names i)
]

; repend
repend [10 11 12] [8 + 5 "pi"]       ;== [10 11 12 13 "pi"]
repend/only [10 11 12] [8 + 5 "pi"]  ;== == [10 11 12 [13 "pi"]]

; insert
s: [10 11 12] ;== [10 11 12]
insert s 13   ;== [10 11 12]
s             ;== [13 10 11 12]
; don't do:
; s: insert s 13
; s              ;== [10 11 12]
s: [10 11 12]    ;== [10 11 12]
insert at s 2 13 ;== [11 12]
s                ;== [10 13 11 12]

; remove
remove [10 11 12]   ;== [11 12]
s: [0 1 2 3 4 5]    ;== [0 1 2 3 4 5]
remove at s 2       ;== [2 3 4 5]
remove at s length? s    ;== []
s                        ;== [0 1 2 3 4] 
s                        ;== [0 2 3 4 5]   ; item 1 at position 2 is deleted
remove/part [10 11 12] 2 ;== [12]

; take
take [10 11 12]      ;== 10
take/last [10 11 12] ;== 12

; move
s: ["A" "B" "C"]
move [1 2 3] s ;== [2 3]
s              ;== [1 "A" "B" "C"]
; move/part series1 series2 n

; QA 10:
s: [1 2 3 4 5]
move s tail s        ;== [2 3 4 5 1]
move/part s tail s 3 ;== [5 1 2 3 4]
