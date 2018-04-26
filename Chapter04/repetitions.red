Red []

; forever
count: 99
forever [
    print append form count " books to read"
    count: count - 1
    if count = 0 [break]
]
;== 99 books to read
;== 98 books to read
;== 97 books to read
;...
;== 2 books to read
;== 1 books to read

forever [ print "1" break ]  ;== 1

; loop
n: 3   ;== 3
loop n [prin "looping "]  ;= looping looping looping 

; repeat
repeat i 5 [prin i]           ;== 12345
repeat i 5 [i: i + 2 prin i]  ;== 34567

; QA 6
repeat i 7 [prin append form i " "]   ;==1 2 3 4 5 6 7

; while
n: 1
while [n <= 10 ][
    if odd? n [prin n prin " "]
    n: n + 1
] ;== 1 3 5 7 9 

n: 1
while [n <= 10 ][
    prin n prin " "
    n: n + 2
] ;== 1 3 5 7 9

n: 1
until [
    prin n prin " "
    n: n + 2
    n > 10  ; the condition to end the loop
] ;== 1 3 5 7 9

; break and continue
repeat n 8 [
    prin ["Before" n " - "]
    if n < 3 [continue]
    if n = 6 [break] 
    prin ["After" n " - "]
]
;== Before 1  - Before 2  - Before 3  - After 3  - Before 4  - After 4  - 
;== Before 5  - After 5  - Before 6  - 