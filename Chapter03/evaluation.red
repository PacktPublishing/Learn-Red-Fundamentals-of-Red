Red []

; basic operations:
print (6 < 13) and (42 < 33)    ;== false
print (43 < 42) xor (44 < 43)   ;== false
print complement 3              ;== -4
if (4 < 5) and (6 < 7) [print "ok"]  ;== ok

; comparison operators:
n: 13
m: 42
n = m       ;== false
13 = 13.0   ;== true
n <> m      ;== true 
13 == 13    ;== true
13 == 13.0  ;== false

13 =? 13    ;== true
a: 14       ;== 14
b: a        ;== 14
a = b       ;== true
"red" = "Red"   ;== true

a == b      ;== true
"red" == "Red"  ;== false
a =? b      ;== true

; your turn:
a: "red"    ;== "red"
b: copy a   ;== "red"
a = b       ;== true     ;same value
a == b      ;== true     ;same value and datatype
a =? b      ;== false    ;not the same object!
print [3 = 2 tab 5 = 5 tab 1 = 1.0] ;== false     true     true
on = (5 = 5)   ;== true


; all:  (n: 13  m: 42)
all [n = 13  m = 42]  ;== true
all [n = 12  m = 42]  ;== none
; any:
any [n = 12  m = 42]  ;== true

n * m           ;== 546
multiply n m    ;== 546

round 2.35          ;== 2.0
round 2.5           ;== 3.0
round/to pi 0.001   ;== 3.142   ; rounds to 0.001

; hexadecimal numbers:
to-hex 32 ;== #00000020

; now:
now/year        ;== 2018
now/zone        ;== 1:00:00
now/yearday     ;== 44

; random:
random 100      ;==71
random 2.71     ;== 2.027808184808962
random "house"  ;== "hsuoe"
random 2018-02-13   ;== 23-Mar-1968
random/only ["one" "two" "three" "four"]   ;== "three"

random/seed now/time          
loop 9 [
    r: random 10                          
    prin r prin space
]

; order of evaluation:
1 + 2 * 3     ;== 9     ; other languages would give you 7!
1 + (2 * 3)   ;== 7     ; use ( ) to get that result
math [1 + 2 * 3]    ;== 7

print 10 + sine 30 + 60     ;== 11.0

; print 10 + sine 30 + 60    
; print (10 + sine 30 + 60)	    (1)
; print (10 + (sine 30 + 60))	(2)
; print (10 + (sine (30 + 60)))	(3)

; your turn:
square-root 9 + square-root 9       ;== 3.464101615137754
(square-root 9) + square-root 9     ;== 6.0