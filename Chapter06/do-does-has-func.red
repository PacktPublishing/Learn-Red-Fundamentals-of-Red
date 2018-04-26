Red []

print "Hi"   ;== Hi
cd %/E/Red/The-Way-to-Red/code/Chapter4

; do
; code block with a label:
pri5: [ repeat i 5 [prin i prin "-"] ]
do pri5 ;== 1-2-3-4-5-   ; evaluate code block with label pri5

; asking something interactively with do:
do [
    pass: ask "Enter Password:  "
    either pass = "secret" [
        print "Welcome back."
    ] [
        print "Incorrect password."
    ]
]

; simple metaprogramming with do:
do [
    code: ask "Enter some code:  "   
    do append {print "Here's your running code..."} code
]
;Enter some code:  loop 3 [prin "Hi!"]
;Here's your running code...
;Hi!Hi!Hi!

; does : no parameters or local numiables
cls: does [ loop 100 [print newline] ]  ; == func [][loop 100 [print newline]]
cls   ; call function cls

; QA 2
repri: does [ repeat i 5 [prin i prin "-"] ]
;== func [][repeat i 5 [prin i prin "-"]]
repri  ;== 1-2-3-4-5-

; has : with local numiables
calc-hours-year: has [number] [
    number: 365 * 24        ; number is local
    print number
]
; == func [/local number][number: 365 * 24 
;     print number
; ]
calc-hours-year  ;== 8760
number   ; *** Script Error: number has no value

; QA 3
has1: has [][
    num: 108 - 42
    print num
] ;== func [/local][...]
has1  ;== 66
num   ;== 66

has2: has [num2][
    num2: 108 - 42
    print num2
] ;== func [/local num2][...]
has2  ;== 66
num2  ;*** Script Error: num2 has no value

; func  ; with parameter(s)
inc: func [n][n + 1] ;== func [n][n + 1]
inc ; *** Script Error: inc is missing its n argument
inc 7     ;== 8
:inc      ;== func [n][n + 1]
get 'inc  ;== func [n][n + 1]

sum: func [a b][
    number: a + b
    print number   
]  ;== func [a b][...]
sum 3 5           ;== 8
print number + 1  ;== 9  ; number is a global numiable
a  ; *** Script Error: a has no value

; shadowing a global numiable:
number: 108        ; global
sum: func [a b /local number][
    number: a + b
    print number   ; local 
]  ;== func [a b][...]
sum 3 5           ;== 8
print number + 1   ;== 109 ;  global

; function
number: 108        ; global
sum: function [a b][
    number: a + b  ; local
    print number   ; local 
]  ;== func [a b /local number][...]
sum 3 5           ;== 8
print number + 1  ;== 109  ; global

number: 108        
sum: function [a b /extern number][
    number: a + b 
    print number   
]  ;== func [a b][...]
sum 3 5           ;== 8
print number + 1  ;== 9  ;

; copy local series
correct: function[] [
    data: copy []      ; correct initialization!
    append data 108
    data
]

correct  ;== [108]
correct  ;== [108]
correct  ;== [108]

incorrect: function[] [
    data: []      
    append data 108
]

incorrect  ;== [108]
incorrect  ;== [108 108]
incorrect  ;== [108 108 108]

; QA 4:
ex-glob: function [
    /extern num1 
] [
    num1: 13
    num2: 42
]

num1: 100  ;== 100
num2: 200  ;== 200
ex-glob    ;== 42
; answers:
num1       ;== 13    ; global
num2       ;== 200   ; 42 was a local, shadowing value