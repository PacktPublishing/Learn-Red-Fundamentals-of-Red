Red [
    Title: "Working with input"
]

; when compiling:
; #include %../../../red-source/environment/console/input.red

num: ask "Enter a number: "
print ["You entered the number" num "with" length? num "digits"]