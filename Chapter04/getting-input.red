Red [
    Title: "Working with input"
]

; when compiling, you need:
; #include %../../../red-source/environment/console/input.red

print "Enter a number: "
num: input
print ["You entered the number" num "with" length? num "digits"]

; length? 89 ;*** Script Error: length? does not allow integer! for its series argument.
; length? "89" ;== 2 