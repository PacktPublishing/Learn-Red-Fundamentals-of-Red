Red [
    Title: "Performance datatypes"
]

; vector!
v1: make vector! [7 13 42 108]  ;== make vector! [7 13 42 108]
vector? v1   ;== true

v1 + 2  ;== make vector! [9 15 44 110]
print v1 ;== 9 15 44 110
v1 * 4  ;== make vector! [36 60 176 440]
v2: make vector! [1 2 3 4]
v1 + v2 ;== make vector! [37 62 179 444]

length? v1     ;== 4
append v1 666  ;== make vector! [7 13 42 108 666]
find v1 42     ;== make vector! [42 108 666]
; looping through a vector:
foreach n v1 [prin [n "-"]]  ;==7 - 13 - 42 - 108 - 666 -
v1/3           ;== 42

; hash!
h1: make hash! [n 13 m 42 o 108]  ;== make hash! [n 13 m 42 o 108]
hash? h1                 ;== true
hash? [n 13 m 42 o 108]  ;== false
h1/m                     ;== 42
select h1 [m]            ;== 42 
select h1 'm             ;== 42

; map!
m1: make map! ["Red" 1 "Crystal" 7 "Python" 13 "Ruby" 42]
== #(
    "Red" 1
    "Crystal" 7
    "Python" 13
    "Ruby" 42
)

m5: #(
    "Red" 1
    "Crystal" 7
)
type? m5  ;== map!

select m1 "Crystal"   ;== 7
put m1 "Crystal" 5    ;== 5
put m1 "Java" 132     ;== 132
put m1 "Ruby" none    ;== none ; delete key "Ruby" and its value 
print m1
; "Red" 1
; "Crystal" 5
; "Python" 13
; "Java" 132

m4: make map! [n 13 m 42 o 108]
m4/m    ;== 42
m4/m: 43
print m4
; n: 13
; m: 43
; o: 108

extend m4 [p 113 q 666]
print m4
== #(
    n: 13
    m: 43
    o: 108
    p: 113
    q: 666
)

; reflection:
find m1 "Crystal"   ;== true
find m1 "C#"        ;== none
length? m1          ;== 4
keys-of m1          ;== ["Red" "Crystal" "Python" "Java"]
values-of m1        ;== [1 5 13 132]
body-of m1          ;== ["Red" 1 "Crystal" 5 "Python" 13 "Java" 132]

; QA 5:
m2: make map! ["Red" 1 "RED" 2 "red" 3]
; == #(
;     "Red" 1
;     "RED" 2
;     "red" 3
; )
select m2 "RED"       ;== 1
select m2 "red"       ;== 1
select/case m2 "red"  ;== 3

m3: make map! [] ;== #()
put m3 "Red" 1   ;== 1
put m3 "RED" 2   ;== 2
print m3         ; "Red" 2
put/case m3 "RED" 2   ;== 2
print m3
; "Red" 2
; "RED" 2