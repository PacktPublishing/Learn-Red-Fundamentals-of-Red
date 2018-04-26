Red []

s1: [7 13 42 108]
s2: [2 7 14 42 109]

union s1 s2         ;== [7 13 42 108 2 14 109]
intersect s1 s2     ;== [7 42]
difference s1 s2    ;== [13 108 2 14 109]
exclude s1 s2       ;== [13 108]