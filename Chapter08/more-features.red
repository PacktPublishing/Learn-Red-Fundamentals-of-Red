Red []

; using end:
vowel: charset "aeiou" 
str: "dog"
parse str [ to vowel to end]    ;== true
parse "xyz" [ to vowel to end]  ;== false

; email pattern:
digit:   charset "0123456789"
letter:  charset [#"a" - #"z" #"A" - #"Z"]
dash: charset "-"
email-char: union union letter dash digit
email-word:    [some email-char]
host:    [email-word]
domain:  [email-word some [dot email-word]]
email:   [host "@" domain]

parse dtrump@whitehouse.org email           ;== true
parse "john-locke@lost.island.org" email    ;== true
parse "h4x0r-l33t@domain.net" email         ;== true

; changing a rule on the fly:
rule: ["x" | "y"]
parse "xyyxqyyxz" [
    some [
        rule
    |
        "q" (append rule [ | "z" ])
    ]
]
;== true

; parsing blocks:
parse ["x"] ["z" | "x" | "y"]   ;== true
; parse [x] [z | x | y]  ;*** Script Error: PARSE - invalid rule or usage of rule: z
parse [x] ['z | 'x | 'y]  ;== true

; QA 10:
parse [x x x y y y] [copy words some 'x (n: length? words) n 'y] ;== true
words  ;== [x x x]

parse [hello Red world] [3 word!]  ;== true

input: [13 "Red" 42  a-word %file 108 3.14]
parse input [ collect[ some[ keep integer! | any-type!] ] ]
;== [13 42 108]

; working on code:
code: [
    if x < n [
        print {x is smaller than n}
    ]
    print {in the middle of the code}
    probe "true"
    probe n
    if n = y [
        probe {n and y are equal}
    ]
]

result: [] 
;-- if word-string match, append to result
rule: [start: word! string! finish: 
    (   
        print ["-->" start]
        print ["<--" finish]
        append result copy/part start finish 
    )
]

parse code [
    some [
        ;-- first try to match the word/string rule
        rule 
    |
        ;-- look ahead to match a block
        ahead block!
        ;-- if we saw one, descend into it and apply rule
        into rule
    |
        ;-- skip current position otherwise
        skip
    ]
]

probe result
[
    print "x is smaller than n" 
    print "in the middle of the code"
    probe "true"  
    probe "n and y are equal"
]

do result
; x is smaller than n
; in the middle of the code
; "n and y are equal"
; == "n and y are equal"

rule: [start: word! string! finish:
    ( 
        print ["-->" start]
        print ["<--" finish]
        append result copy/part start finish 
    )
]

; --> print x is smaller than n
; <-- 
; --> print in the middle of the code probe true probe n if n = y probe n and y are equal
; <-- probe true probe n if n = y probe n and y are equal
; --> probe true probe n if n = y probe n and y are equal
; <-- probe n if n = y probe n and y are equal
; --> probe n and y are equal
; <-- 
; == true

; debugging parse:
rate: "<title>1 USD = 0.81191502 EUR</title>"

parse rate [thru "<title>" copy data to "</title>" (probe data) thru ">"]
;"1 USD = 0.81191502 EUR"
;== true

parse-trace rate [thru "<title>" copy data to "</title>" (probe data) thru ">"]
; -->
;    match: [thru "<title>" copy data to "</title>" (probe dat 
;    input: "<title>1 USD = 0.81191502 EUR</title>"   
;    -->
;      ==> matched
;    <--
;    match: ["<title>" copy data to "</title>" (probe data) th 
;    input: "1 USD = 0.81191502 EUR</title>"   
;    -->
;      -->
;        ==> matched
;      <--
;    <--
;    match: [data to "</title>" (probe data) thru ">"] 
;    input: "</title>"   
; "1 USD = 0.81191502 EUR"
;    match: [to "</title>" (probe data) thru ">"] 
;    input: "</title>"   
;    -->
;      ==> matched
;    <--
; return: true
; == true

; parse/trace input rules callback