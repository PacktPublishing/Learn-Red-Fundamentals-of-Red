Red []

; error-handling
inc: func [n][
    if (type? n) <> integer! [   
        print ["n must be an integer, not a " (type? n)]
        exit
    ]
    n + 1
]

inc 9       ;== 10
inc pi      ;== n must be an integer, not a  float
inc "abc"   ;== n must be an integer, not a  string

inc: func [n][
    unless (type? n) = integer! [   
        print ["n must be an integer, not a " (type? n)]
        exit
    ]
    n + 1
]

zero? 0.0     ;== true
none? 5       ;== false
positive? -9  ;== false
float? pi     ;== true

inc: func [n][
    if not integer? n [   
        print ["n must be an integer, not a " (type? n)]
        exit
    ]
    n + 1
]

inc: func [n][
    unless integer? n [   
        print ["n must be an integer, not a " (type? n)]
        exit
    ]
    n + 1
]

; using if error? try
inc: func [n /local result][
    if error? try [result: n + 1][
        print ["n must be an integer, not a " (type? n)]
        exit    
    ]
    result
]

inc 9           ;== 10
inc "Red"       ;n must be an integer, not a  string


; general:
; guarded-func: function [arguments][
;     unless condA [ print "error-message" exit]
;     unless condB [ print "error-message" exit]
;     ; main logic
; ]

; error-handling outside function
average: function [
    total [number!] count [integer!]] [
    if zero? count [
        cause-error 'math 'zero-divide  []
    ]
    total / count ; might cause an error
]

average 354 6   ;== 59
average 354 0   ;*** Math Error: attempt to divide by zero

either error? result: try [average 354 0] [
    print ["Error id: " result/id]
][
    print ["No error, the result is: " result]
]
;== Error id:  zero-divide

; QA 8
mysqrt: func [n][
    unless ((type? n) = integer!) or ((type? n) = float!) [
        print ["n must be a number, not a " (type? n)]
        exit
    ]
    unless n >= 0 [
        print "argument n must be a positive number"
        exit
    ]
    sqrt n
]

;tests:
mysqrt 81      ;== 9.0
mysqrt 81.0    ; == 9.0
mysqrt "abc"   ; n must be a number, not a  string
mysqrt -81     ; argument n must be a positive number

; recursive function
fact: func [
        n [integer!]        
][
        if n = 0 [return 1]
        n * fact n - 1
]

fact 4  ; 24
; fact 20  
; *** Math Error: math or number overflow
; *** Where: *
; *** Stack: fact fact fact fact fact fact fact fact

; QA 9
fact: func [
        "Calculate the factorial of a number"
        n   "Argument to factorial"      
][
        unless (type? n) = integer! [   
            print ["n must be an integer, not a " (type? n)]
            exit
        ]
        unless n >= 0 [   
            print ["n must be positive or zero "]
            exit
        ]
        unless n <= 20 [   
            print ["n is too big, must be < 21 "]
            exit
        ]
        if n = 0 [return 1]
        n * fact n - 1
]

fact 4.0    ; n must be an integer, not a  float
fact -4     ; n must be positive or zero 
fact "abc"  ; n must be an integer, not a  string
fact 21     ; n is too big, must be < 21 