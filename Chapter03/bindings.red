Red [
     Title: "Bindings"
]

age: 62
is-integer?: false
lunch-time: 12:32
birth-day: 17-Jan-1997
friends: ["Jeff" "Paula" "Viviane"]

n: 12   m: 42    ;== 42
n  ;== 12
m  ;== 42

age: number: size: 62
age ;== 62
number! ;== 62
size ;== 62

print :age   ;== 62

value? age    ;== true

i2: 1 + i1: 1 ;== 2
i1  ;== 1
i2  ;== 2

print friends       ;== Jeff Paula Viviane
probe friends       ;== ["Jeff" "Paula" "Viviane"]
form friends        ;== "Jeff Paula Viviane"
mold friends        ;== {["Jeff" "Paula" "Viviane"]}

print [10 * 5]  ;== 50
probe [10 * 5]  ;== [10 * 5]

name: "John"
print ["My name is:" tab name]   ;== My name is:     John

type? age           ;== integer!
type? birth-day     ;== date!
type? friends       ;== block!

; Assigning and copying
;-- b points to the same value as a:
a: [1 2 3]
b: ["a" "b" "c"]
b: a
print b     ;== 1 2 3

;-- b points to the same value as a:
append a 4
print a     ;== 1 2 3 4
print b     ;== 1 2 3 4

;-- same with simple types:
a: 20 ;== 20
b: a  ;== 20
a: 25 ;== 25
b     ;== 20

;-- b points to a different value than a with copy:
a: [1 2 3]
b: copy a
print b ;== 1 2 3
append a 4
print a ;== 1 2 3 4
print b ;== 1 2 3
a: [1 2 3 4 5]
print b ;== 1 2 3

; Working with words
'b              ;== b
type? 'b        ;== word!

get 'b          ;== [1 2 3]
get 'print
; == make native! [[
;     "Outputs a value followed by a newline" 
;     value [any-type!]
; ]]

:b              ;== [1 2 3]
set 'b [0 1 2]  ;== [0 1 2]
b               ;== [0 1 2]

unset 'b
b               ;*** Script Error: a has no value
