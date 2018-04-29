; Contains Red/System code which requires compilation
Red [
    Title: "Printing out in Red or in Red/System"
    Comment: {Contains Red/System code which requires compilation}
]

print "From Red"

; #system-global [#include %print-test.reds]
#system [
    #include %print-test.reds
    f
]

print "From Red"

r: routine [][f]
r

print "From Red"

; Output from #system-global:
; From Red
; From Red
; From Red System
; From Red

; Output from #system:
; From Red
; From Red System
; From Red
; From Red System
; From Red
