; contains code of section "Words and Values"
; this is not a valid Red code file

what

; op!
3 * 5
13 < 42

; function!
cos
to-integer

; action!
append
delete

; native!
if
print

;routine!
list-env

; datatypes
date!
percent!    ; %
datatype!

name: John   ;*** Script Error: John has no value
name: "John"

room-number: 42

; word separators:
[ ] ( ) { } " : ; / 

valid words
is-integer?
date-of-birth
date!
*new-line*
Area51

; the same word:
; City
; city
; CITY

; your turn:
? system
system/build
