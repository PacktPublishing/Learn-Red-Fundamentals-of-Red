Red []

; passing arguments by reference:
passing-ref: function [ data [block! ]][
    append data 108
]

data: [2 3 7 42]
passing-ref data
data  ;== [2 3 7 42 108]

; typing arguments:
inc: func [n][n + 1]
inc 3.14 ;== 4.14
; inc "abc"    ;*** Script Error: + does not allow string! for its value1 argument

inc: func [n [integer!]][n + 1]
; inc 3.14  ;*** Script Error: inc does not allow float! for its n argument
; inc "abc" ;*** Script Error: inc does not allow string! for its n argument

inc: func [n [integer! float!]][n + 1]
inc 3.14 ;== 4.14

inc: func [n [number!]][n + 1]
inc 3.14 ;== 4.14

; QA 5:
sum: func [ n[number!] m[number!]][n + m]
sum 3 4   ;== 7
sum pi 1  ;== 4.141592653589793

; return values:
search-val: func [series value] [
    forall series [
        if (first series) = value [
            return series
        ]
    ]
    none
]

search-val [10 20 30 40] 3   ;== [30 40]
search-val [10 20 30 40] 9   ;== none

; return multiple values:
search-val: func [series value] [
    forall series [
        if (first series) = value [
            return reduce [series  index? series]
        ]
    ]
    none
]

search-val [10 20 30 40] 3   ;== [[30 40] 3]

; return type
double: function [
    n [integer!] 
    return: [integer!]
][
    2 * n 
]

double 42 ;== 84
double pi ;*** Script Error: double does not allow float! for its n argument

; refinements:
sum: func [arg1 arg2 /avg][
    either avg [arg1 + arg2 / 2][arg1 + arg2]
]
sum 3 5         ;== 8
sum/avg 3 5     ;== 4

div-sum: func [arg1 arg2 /div n][
    either div [arg1 + arg2 / n][arg1 + arg2]
]
div-sum 3 5         ;== 8
div-sum/div 3 5 4   ;== 2

; QA 6:
test-ref: func [n m /add /sub][
    if add [return n + m]
    if sub [return n - m]
]

test-ref/add 42 7  ;== 49
test-ref/sub 42 7  ;== 35

; doc strings:
max: function [                      
        "Return the maximum of 2 numbers"
        arg1 [number!] "First number argument"
        arg2 [number!] "Second number argument"
][
        either arg1 > arg2 [
            arg1
        ][
            arg2
        ]
]

max 42 7 ;== 42

; code style:
func-name: func [
        "Comments for the function itself"
    	arg1    [type1!]  "Describe 1st argument"
        arg2    [type2!]  "Describe 2nd argument"
		/ref1             "Describe refinement"
                argref1 [type1]                        
        return: [type3!]  "Describe return value"                
][
    	; function body
]

; QA 7
average: func [
        "Return the numerical average of numbers"
    	series "Numbers to average"
][
        sum: 0
        foreach value series [sum: sum + value]
        sum / (length? series)
]

average [2 4 6 8 10]   ;== 6
average [ 3.14 7 42]   ;== 17.38


