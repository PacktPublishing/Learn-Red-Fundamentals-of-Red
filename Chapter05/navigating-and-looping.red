Red []

data: [A B C D] 
empty-lst: []

index? data  ;== 1
head? data   ;== true
tail data    ;== []
tail? data   ;== false
first data   ;== A
second data  ;== B
last data    ;== D

next data    ;== [B C D]
data ;== [A B C D]
back data

data: next data  ;== [B C D]
data             ;== [B C D]
index? data      ;== 2
head? data       ;== false
tail data        ;== []
tail? data       ;== false
first data       ;== B

; moving to the tail:
data: next next next data  ;== []
data       ;== []
head? data ;== false
tail data  ;== []
tail? data ;== true
index? data ;== 5
first data ;== none

; using back:
data: back data  ;== [D]
head? data       ;== false
tail? data       ;== false
tail data        ;== []
first data       ;== D

; skip:
data: skip data -2   ;== [B C D]
head? data           ;== false
tail data            ;== []
first data           ;== B
index? data          ;== 2

head data        ;== [A B C D]

; looping:
names: ["John" "Dave" "Jane"]
foreach name names [print name]
;== John
;== Dave
;== Jane

forall names [print names]
;== John Dave Jane
;== Dave Jane
;== Jane

; QA 5
numbers: [323 2498 94321 31 82]
foreach number numbers [
    if number > 1000 [print number]
]
;== 2498
;== 94321
;== none

; Structuring data in a list in rows and columns:
contacts: [
    "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234"
    "Paul Thompson" "234 Georgetown Pl. Peanut Grove, AL" "555-2345"
    "Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456"
    "George Jones" "456 Topforge Court Mountain Creek, CO" ""
    "Tim Paulson" "" "555-5678"
]

foreach [name address phone] contacts [print [name "/" phone]]
; John Smith / 555-1234
; Paul Thompson / 555-2345
; Jim Persee / 555-3456
; George Jones / 
; Tim Paulson / 555-5678

; while
colors: [red green blue yellow orange]

while [not tail? colors] [
    print first colors
    colors: next colors
]

; red
; green
; blue
; yellow
; orange
