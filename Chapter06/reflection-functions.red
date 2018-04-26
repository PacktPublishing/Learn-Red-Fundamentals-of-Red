Red []

; other name:
pr: :print          ;== make native! [[
pr: get 'print      ; is the same
pr ["Hello" "Red"]  ;== Hello Red

; nested function:
make-timer: func [code] [
    timer: func [time] code
]

make-timer [wait time]
timer 5

; return a function:
make-timer: func [code] [
    func [time] code
]

timer: make-timer [wait time]
timer 3   ;== none

source source
source: func [
    "Print the source of a function" 
    'word [any-word! any-path!] "The name of the function" 
    /local val
][
    val: get/any word 
    print case [
        function? :val [[append mold word #":" mold :val]] 
        routine? :val [[
            ";" uppercase mold :word {is a routine! value; its body is Red/System code.^/} 
            append mold word #":" mold :val
        ]] 
        'else [[uppercase mold word "is" a-an/pre mold type? :val "so source is not available."]]
    ]
]

; body-of:
body-of :check
== [answer: "safe" 
    foreach l list [
        if find l "--" [answer: "unsafe"]
    ] 
    answer
]

body-of :replace