Red [ "Working with Objects"]

; make
i: make integer! 5         ; == 5
output: make string! 1000  ; == ""
blk: make block! 20        ; == []

; working with objects
square1: make object! [
    length: 10
    display: does [ print ["Length of square1 is" length] ]
]  ;== make object! [ ... ]

square2: object [
    length: 10
    display:does [ print ["Length of square2 is" length] ]
]  ;== make object! [ ... ]

square3: context [
    length: 15
    display: does [ print ["Length of square3 is" length] ]
]  ;== make object! [ ... ]

object? square1     ;== true
ser: [2 7 42 108]
object? ser         ;== false

square1/length    ;== 10
square1/display   ; Length of square1 is 10
square1/length: 5 ;== 5
square1/length    ;== 5

get in square1 'length     ;== 10
set in square1 'length 5   ;== 5

set square1 none ;== none
square1  ;== make object! [length: none  display: none]
set square1 [3 "Red"]   ;== [3 "Red"]
square1  ;== make object! [length: 3 display: "Red"]

square1: make object! [
    print "Entering square1"
    length: 10
    display: does [ print ["Length of square1 is" length] ]
]  ;== make object! [ ... ]
; Entering square1  ;== make object! [ ... ]

square1/length      ;== 10

person: object [
    name: none
    show: does [print name]
]  ;== make object! [ ... ]

person/name: "Johnson"
person/show  ;== "Johnson"

creature: object [
    name: "Amygdala"
    show: does [print self]
]  ;== make object! [ ... ]

creature/show
; name: "Amygdala"
; show: func [][print self]

; nested objects:
person1: object [ 
    name: "Mueller"  
    tel: none 
    address: object [
        street: "Kensington Street 28"
        postal-code: 86512
        city: "Burmington"
        state: "OH"
    ]
]

person1/address/state   ;== "OH"

; copying and inheritance:
; copying
person1: object [ name: "Mueller"  tel: none ]
person2: person1
person1/tel: "108-4271"
person2/tel    ;== "108-4271"
person3: copy person1    ; makes a true copy
; same as:
person3: make person1 []
person3  ;== make object! [name: "Mueller" tel: "108-4271"]
person1/tel: "333-4271"
person3  ;== make object! [name: "Mueller" tel: "108-4271"]

; inheritance
person1  ; == make object! [name: "Mueller" tel: "333-4271"]
; = starting object
person4: make person1 [id-number: #MFG-932-741-A]
person4 ;== make object! [name: "Mueller" tel: "333-4271" id-number: #MFG-932-741-A]
person4/name: "Johnson"
person4: make person1 [name: "Johnson" id-number: #MFG-932-741-A]
person1 ;== make object! [name: "Mueller" tel: "333-4271"]

; merging objects:
a: object [x: 5]
b: object [y: 10]
c: make a b    ;== make object! [x: 5 y: 10]
d: object [x: 3 y: 10]
c: make a d    ;== make object! [x: 3 y: 10]
d: object [x: 7 y: 13]
c: make a d c  ;== make object! [x: 7 y: 13] 

; QA 10:
car: object [
    brand: ""
    sell-price: 0 
    VAT: 20%
    stock: 0
    total-price: does [sell-price * (1 + VAT)]
    stock-value: does [stock * sell-price]
]

tesla1: make car [ brand: "Tesla Model S" sell-price: 100000 stock: 4]
tesla1/total-price   ;== 120000.0
tesla1/stock-value   ;== 400000

; searching in an object
find person1 'tel       ;== true
find person1 'id-number ;== none

person1/tel               ;== "333-4271"
select person1 'tel       ;== "333-4271"
select person1 'id-number ;== none

; reflective properties:
person1: object [ name: "Mueller"  tel: "333-4271" ]
body-of person1    ;== [name: "Mueller" tel: "333-4271"]
words-of person1   ;== [name tel]
values-of person1  ;== ["Mueller" "333-4271"]

person1: object [
        name: "Mueller"  tel: "333-4271" 
        on-change*: func [word old new /local msg][
            if word = 'name [
                msg: "The person's name is changed!"
                print ["Warning:" msg]  
            ]
        ]
]

person1/name: "Johnson"   ;== Warning: The person's name is changed!
person1
; == make object! [
;     name: "Johnson"
;     tel: "333-4271"
; ]

; QA 11:
person1: object [
        name: "Mueller"  tel: "333-4271" 
        on-change*: func [word old new /local msg][
            if word = 'name [
                msg: "Attempt to change the person's name!"
                print ["Error:" msg]
                name: old 
            ]
        ]
]

; Error: Attempt to change the person's name!
person1
; == make object! [
;     name: "Mueller"
;     tel: "333-4271"
; ]