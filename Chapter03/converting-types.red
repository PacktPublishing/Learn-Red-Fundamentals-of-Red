Red []

; "12" + "34"
; *** Script Error: + does not allow string! for its value1 argument
; *** Where: +
; *** Stack: 

(to-integer "12") + (to-integer "34")  ; == 46

pi-str: to-string pi ;== "3.141592653589793"
f1: to-float 42      ;== 42.0

pi-str: to string! pi   ;== "3.141592653589793"
pi-int: to integer! pi  ;== 3
f1: to float! 42        ;== 42.0
to integer! "34A" ;*** Script Error: cannot MAKE/TO integer! from: "34A"
to-time [12 03 22]  ;== 12:03:22

n: mold 3               ;== "3"
m: load "45"            ;== 45
type? m                 ;== integer!

pick [1 2 3] 5   ;== none
type? none       ;== none!

;to_float 42   ;*** Script Error: to_float has no value
