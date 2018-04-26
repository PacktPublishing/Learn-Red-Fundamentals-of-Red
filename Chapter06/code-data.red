Red []

; simple code
calc: "3.14 ** 2"
type? calc  ;== string!
calc        ;== "3.14 ** 2"
; :calc or get 'calc give the same result
code: load calc ;== [3.14 ** 2]
code            ;== [3.14 ** 2]
type? code      ;== block!
length? code    ;== 3
do code         ;== 9.8596

code/1: pi      ;== 3.141592653589793
code/3: 3       ;== 3
code            ;== [3.141592653589793 ** 3]
do code         ;== 31.00627668029982

code/2: -       ;*** Script Error: - operator is missing an argument
; solution:
code/2: '-      ;== -
code            ;== [3.141592653589793 - 3]
do code         ;== 0.1415926535897931

append code [- pi]   ;== [3.141592653589793 - 3 - pi]
code                 ;== [3.141592653589793 - 3 - pi]
do code              ;== -3.0

second code            ;== -
type? second code      ;== word!
type? get second code  ;op!

-: :+    ;== make op! [[    "Returns the sum of the two values" ...
code     ;== [3.141592653589793 - 3 - pi]
do code  ;== 9.283185307179586

; a function:
fun: "inc: func [n][n + 1]"  ;== "inc: func [n][n + 1]"
type? fun                    ;== string!
code: load fun               ;== [inc: func [n] [n + 1]]
code                         ;== [inc: func [n] [n + 1]]                   
type? code                   ;== block!

inc 7                        ;== *** Script Error: inc has no value
do code                      ;== func [n][n + 1]
inc 7                        ;== 8
:inc                         ;== func [n][n + 1]
body-of :inc                 ;== [n + 1]
type? :inc                   ;== function!

foreach item code [print [type? item mold item]]
set-word inc:
word func
block [n]
block [n + 1]

; function flexibility:
; example 1:
fp1: function [x [integer!] y [string!]] [
    prin [x "- "]
    print y
]

;-- assigning header and body to variables
header: [x [integer!] y [string!]]
body: [
    prin [x "- "]
    print y
]

;-- alternate expression of a function equivalent to foo
fp1-alt: function header body

;-- make fp2 a function that prints the reverse of y
fp2: function header replace copy body 'y [reverse y] 

;-- call the three functions
fp1 108 "Red"              ;== 108 - Red
fp1-alt 108 "Red"          ;== 108 - Red
fp2 109 "Red"              ;== 109 - deR

; example 2:
params: [] 
body: []
append params load {message}
append body load {print message}
prn: function params body    ;-- function definition     

prn "Hello World"   ;== Hello World
source prn          ;== prn: func [message][print message]
