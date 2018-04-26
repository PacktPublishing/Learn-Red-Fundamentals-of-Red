Red []

; split
s1: "The quick brown fox jumps over the lazy dog"
split s1 " " ;== ["The" "quick" "brown" "fox" "jumps" "over" "the" "lazy" "dog"]
s2: "bracadabra"
split s2 "a" ;== [br" "c" "d" "br"]
s3: "abracadabra"
split s3 "a" ;== ["" "br" "c" "d" "br"]

; form
s: ["Red" "world" 13 42 4 * 8 ["a" "bee" "cee"]]
form s         ;== "Red world 13 42 4 * 8 a bee cee"
form/part s 15 ;== "Red world 13 42"

; rejoin
ser: ["Product is: "  7 * 42]
rejoin ser   ;== "Product is: 294"
ser          ;== ["Product is: " 7 * 42]
ser2: ["Total is: " 108 + 42]
rejoin [ser ser2]  ;== ["Product is: " 7 * 42 ["Total is: " 108 + 42]]

count: 10
print rejoin [newline "Total Images: " count]
;== Total Images: 10

; clear
s: "American politics"
clear skip s 8   ;== ""
s                ;== "American"
s: "American politics"
clear find s " politics"
s                ;== "American"

; trim
str: "    No more war !.    "
trim/head str       ;== "No more war !.    "      
trim/tail str       ;== "No more war !."
; trim str          ; does both /head and /tail                        
trim/all str        ;== "Nomorewar!."   ; removes all spaces                       
trim/with str "!."  ;== "Nomorewar"

; pad
s: "Red"
pad s 5
s  ;== "Red  "
pad/left s 7
s  ;== "  Red  "

; insert
; at the start:
str: "painting"               
insert str "beautiful "
str  ;== "beautiful painting"

str: "abcdefg"
insert at str 3 "ONE"  ;== "cdefg"
str                    ;== "abONEcdefg"
str: "abcdefg"
insert find str "c" "ONE" ;== "cdefg"
str	                      ;== "abONEcdefg"
; insert (find str "c") "ONE"  ; equivalent

; append
str: "Red"         ;== "Red"
append str "100"   ;== "Red100"
append str [1 0 0] ;== "Red100100"

; find
s1: "The quick brown fox jumps over the lazy dog"
find s1 "fox" ;== "fox jumps over the lazy dog"

; poke
s: "abcde"
poke s 3 #"S"
s  ;== "abSde"
s: "abcde"

; replace
replace s "c" "S"  ;== "abSde"

; copy
str: "beautiful"
copy/part str 4    ;== "beau"
at tail str -3     ;== "ful"
remove/part str 4  ;== "tiful"
str                ;== "tiful"

str: "mnopqrst"
copy/part at str 2 4    ; start at position 2, get 4 items
;== "nopq"

;exclude
exclude "The United Kingdom" "aeiou"  ;== "Th ndKgm"

; lower- and uppercase
str: "Red"
lowercase str  ;== "red"
uppercase str  ;== "RED"
lowercase/part str 1  ;== 1
str ;== "rED"

; QA 11:
names: ["John" "Dave" "Jane" "Bob" "Sue"]
foreach name names [
    if find name "a" [print name]
]
;== Dave
;== Jane

names: ["John" "Dave" "Jane" "Bob" "Sue"]
foreach name names [
    if find name "a" [
        if find name "e" [print name]
    ]
]
