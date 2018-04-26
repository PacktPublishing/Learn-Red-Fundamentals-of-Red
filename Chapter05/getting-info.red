Red [
    Title: "Getting Info from a series"
]

data: [A B C D]
length? data  ;== 4

; empty list:
empty-lst: []
length? empty-lst  ;== 0
empty? empty-lst   ;== true


; selecting an item:
data/3          ;== C
pick data 3     ;== C

i: 3
data/:i         ;== C

; QA 6 :
empty-lst/5     ;== none

pick data 100   ;== none
s: "I'm enjoying Red"
s/4        ;== #" "
pick s 5   ;== #"e"

at data 3  ;== [C D]

data: next data  ;== [B C D]
pick data 3      ;== D
data/3           ;== D

; QA 7:
s: ["A" "B" [42.1 42.2 42.3] red]  ; a nested series
i: 3      ; used to point to element in top-level series -> [42.1 42.2 42.3]
j: 2      ; used to point to element in second-level series -> 42.2
s/:i/:j   ;== 42.2
pick pick s 3 2  ;== 42.2

; extract:
contacts: [
    "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234"
    "Paul Thompson" "234 Georgetown Pl. Peanut Grove, AL" "555-2345"
    "Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456"
    "George Jones" "456 Topforge Court Mountain Creek, CO" ""
    "Tim Paulson" "" "555-5678"
]

extract contacts 3
; == [
;     "John Smith" 
;     "Paul Thompson" 
;     "Jim Persee" 
;     "George Jones"
;     "Tim Paulson"
;] 
phones: extract/index contacts 3 3
;== ["555-1234" "555-2345" "555-3456" "" "555-5678"]

; searching for an item:
data1: [1 2 3 4]
select data1 2     ;== 3
select data1 99    ;== none
data2: [A B C D]
select data2 [B]   ;== C
find data1 2       ;== [2 3 4]

; QA 8:
s: ["A" "B" [42.1 42.2 42.3] red]
length? find s "B"  ;== 3
; find returns the series [B" [42.1 42.2 42.3] red]
; [42.1 42.2 42.3] counts for 1 item

; refinements:
find/tail data1 2 ;== [3 4]
blk: [11 12 13 14 [22 33 44] 15]
select blk 14            ;== [22 33 44]
select/part blk 12 3     ;== 13
select/part blk 14 3     ;== none
select blk [22 33 44]    ;== none
select/only blk [22 33 44] ;== 15
select/last blk 13

; QA 9:
select/part ["Red" "Crystal" "Ruby" "Java" "Go" "Rust"] ["Java"] 4
;== "Go"
find/part ["Red" "Crystal" "Ruby" "Java" "Go" "Rust"] ["Java"] 4
; == ["Java" "Go" "Rust"]
select/part ["Red" "Crystal" "Ruby" "Java" "Go" "Rust"] ["Java"] 3
;== none
find/part ["Red" "Crystal" "Ruby" "Java" "Go" "Rust"] ["Java"] 3
;== none

; sorting:
codes: [2804 -9439 2386 9823 -4217]
sort codes ;== [-9439 -4217 2386 2804 9823]
codes      ;== [-9439 -4217 2386 2804 9823]

sort/reverse codes  ;== [9823 2804 2386 -4217 -9439]
codes: [2804 -9439 2386 9823 -4217]

codes: [2804 -9439 2386 9823 -4217]
sort/part codes 4  ;== [-9439 2386 2804 9823 -4217]

codes: [2804 -9439 2386 9823 -4217]
sort/reverse/part codes 4  ;== [9823 2804 2386 -9439 -4217]

reverse codes
codes  ;== [-4217 9823 2386 -9439 2804]