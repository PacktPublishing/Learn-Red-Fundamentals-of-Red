Red []

contacts: [
    "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234"
    "Paul Thompson" "234 Georgetown Pl. Grove, AL" "555-2345"
    "Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456"
    "George Jones" "456 Topforge Court Mountain Creek, CO" ""
    "Tim Paulson" "" "555-5678"
]

name: "John Smith"
address: "123 Tomline Lane Forest Hills, NJ"
phone: "555-1234"

write %contacts1 name
write/append %contacts1 address
write/append %contacts1 phone

; contents of contacts1:
John Smith123 Tomline Lane Forest Hills, NJ555-1234

; read
read %contacts1  ;== {John Smith123 Tomline Lane Forest Hills, NJ555-1234}

write %contacts1 rejoin [name ";" address ";" phone newline]
; contents of contacts1:
; John Smith;123 Tomline Lane Forest Hills, NJ;555-1234

foreach [name address phone] contacts [
    write/append %contacts2 rejoin [name ";" address ";" phone newline]
]

contents: read %contacts2
;== {John Smith;123 Tomline Lane Forest Hills, NJ;555-1234^/Paul Thompson;234 Georgetown Pl. Grove, AL;555-2345^/Jim Persee;345 Pickles Pike Orange Grove, FL;555-3456^/George Jones;45

contents: read/lines %contacts2
;== [{John Smith;123 Tomline Lane Forest Hills, NJ;555-1234} {Paul Thompson;234 Georgetown Pl. Grove, AL;555-2345} {Jim Persee;345 Pickles Pike Orange Grove, FL;555-3456} {George ...

write %contactsw contacts
; [
;     "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234" 
;     "Paul Thompson" "234 Georgetown Pl. Grove, AL" "555-2345" 
;     "Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456" 
;     "George Jones" "456 Topforge Court Mountain Creek, CO" "" 
;     "Tim Paulson" "" "555-5678"
; ]

; QA 1
write/lines %contacts3.txt contacts

; QA 2:
write/part %contacts4.txt contacts 20

; QA 3:
write/seek %contacts6.txt "Adam" 55

 read %contacts99  ;*** Access Error: cannot open: %contacts99

; binary files:
tmp: read/binary %red.png
; In hexadecimal format
; == #{
; 89504E470D0A1A0A0000000D49484452000002EE000002ED08060000007789E1
; 64000078C34944415478DAECDD079C645599F7F1E739F75655E7389DD3040686
; 0C8A202220028AB8200883AEBB20418220023A8489...

write/binary %red-copy.png tmp
write/binary %red-copy2.png read/binary %red.png

read %.
;== [%apps/ %articles/ %benchmarks/ %blockchain/ %books/ %build/ %cinfo %contactss ... ]

; downloading a file from the internet:
read http://www.red-lang.org/index.html
;== {<!DOCTYPE html>^/<html class='v2' dir='ltr' xmlns='http://www.w3.org/1999/xhtml' xmlns:b='http://www.google.com/2005/gml/b' xmlns:data='http://www.google.com/2005/gml/data' xml

data: read http://www.red-lang.org/index.html

data: copy/part read http://www.red-lang.org/index.html 15
; == "<!DOCTYPE html>"

write %redhome.html read http://www.red-lang.org/index.html

