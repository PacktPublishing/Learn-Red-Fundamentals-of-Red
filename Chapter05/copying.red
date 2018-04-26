Red []

not-expected: [ 
    var1: "" 
    append var1 "*" 
    print var1 
]

loop 3 [do not-expected]
;== *
;== **
;== ***

expected: [ 
    var1: copy "" 
    append var1 "*" 
    print var1 
]

loop 3 [do expected]
;== *
;== *
;== *

copy []   ; creates an empty series
copy ""   ; creates an empty string

; clear
data: [A B C D]
clear data
data    ;== []

copy/part "Red herring" 3  ;== "Red"
copy/part [A B C D] 3      ;== [A B C]

; shallow copy
nblk: [11 12 13 14 [22 33 44] 15]
blk: copy nblk  ;== [11 12 13 14 [22 33 44] 15]
nblk/3: 108
nblk  ;== [11 12 108 14 [22 33 44] 15]
blk   ;== [11 12 13 14 [22 33 44] 15]
nblk/5/2: 108
nblk  ;== [11 12 108 14 [22 108 44] 15]
blk   ;== [11 12 13 14 [22 108 44] 15]

; deep copy
nblk: [11 12 13 14 [22 33 44] 15]
blk: copy/deep nblk  ;== [11 12 13 14 [22 33 44] 15]
nblk/3: 108
nblk  ;== [11 12 108 14 [22 33 44] 15]
blk   ;== [11 12 13 14 [22 33 44] 15]
nblk/5/2: 108
nblk  ;== [11 12 108 14 [22 108 44] 15]
blk   ;== [11 12 13 14 [22 33 44] 15]
