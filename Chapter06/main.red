Red []

; main.red and useful-functions.red are in the same folder here
; perhaps you need to do a cd to the directory where main.red is stored, like this:
; cd %/F/Red/code/Chapter6

; #include %useful-functions.red
do %useful-functions.red

names1: ["Joe" "Dan" "Sh--" "Bill"]
names2: ["Paul" "Tom" "Mike" "John"]

print append "names1 is " check names1   ;== names1 is unsafe
print append "names2 is " check names2   ;== names2 is safe

; no reference to check:
; *** Script Error: check has no value
; *** Where: append

; #include : ok

; do :
; ok when interpreted
; but when compiled:
; names1 is ?function?
; names2 is ?function?