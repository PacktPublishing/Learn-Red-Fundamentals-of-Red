Red []

; 4 / 0  ;*** Math Error: attempt to divide by zero

; 4 < "abc"
; *** Script Error: cannot compare 4 with "abc"
; *** Where: <
; *** Stack:  

; attempt
attempt [4 < "abc"] ;== none
attempt [4 * 7]     ;== 28   

; try
try [4 * 7] ;== 28      ; normal evaluation result
try [4 / 0]  ; *** Math Error: attempt to divide by zero
type?  try [4 / 0]      ; == error!

; error? try
error? err: try [4 / 0]  ;== true
type? err ;== error!
err
; *** Math Error: attempt to divide by zero
; *** Where: /

error? try [4 < "abc"]  ;== true
error? [4 < "abc"]      ;== false

err: try [4 < "abc"]
; *** Script Error: cannot compare 4 with "abc"
; *** Where: <
; *** Stack:  
type? err  ;== error!
try [4 * 7] ;== 28

if error? try [4 < "abc"][
    print "Wrong input, enter an integer!"
    quit  ; or: continue
]

either error? try [4 < "abc"][
    print "Wrong input, enter an integer!"
    quit  ; or: continue
][ ; everything ok, now we can proceed
    ; next code step
]

if error? err: try [4 < "abc"] [probe err]
; make error! [
;     code: none
;     type: 'script
;     id: 'invalid-compare
;     arg1: 4
;     arg2: "abc"
;     arg3: none
;     near: none
;     where: '<
;     stack: 77629472
; ]
; *** Script Error: cannot compare 4 with "abc"
; *** Where: <
; *** Stack: probe

; cause-error
m: 10
n: 0
if n = 0 [ cause-error 'math 'zero-divide [] ]
m / n

if n = 0 [ make error! [math zero-divide] ]    ; equivalent
if n = 0 [ make error! 402 ]    ; equivalent