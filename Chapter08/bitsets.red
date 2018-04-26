Red []

; bitsets:
make bitset! #"R"  ;== make bitset! #{0000000000000000000020}
make bitset! #"ß"
;== make bitset! #{00000000000000000000000000000000000000000000000000000001}
make bitset! "Red" ;== make bitset! #{0000000000000000000020000C}
make bitset! [108 "Red" #"R"] ;== make bitset! #{0000000000000000000020000C08}
charset [108 "Red" #"R"]      ;== make bitset! #{0000000000000000000020000C08}

; using a charset to search in a string: 
vowel: charset "aeiou" ;== make bitset! #{000000000000000000000000444104}
str: "dog"
find str vowel  ;== "og"

digit: charset "0123456789"  ;== make bitset! #{000000000000FFC0}
; ranges using -:
digit: charset [#"0" - #"9"] ;== make bitset! #{000000000000FFC0}

; QA 1:
lower: charset [#"a" - #"z"] 
;== make bitset! #{0000000000000000000000007FFFFFE0}
upper: charset [#"A" - #"Z"]
;== make bitset! #{00000000000000007FFFFFE0}

letter: charset [#"a" - #"z" #"A" - #"Z"]
;== make bitset! #{00000000000000007FFFFFE07FFFFFE0}
letter: union lower upper
;== make bitset! #{00000000000000007FFFFFE07FFFFFE0}

; QA 2:
alpha-num: union letter digit
;== make bitset! #{000000000000FFC07FFFFFE07FFFFFE0}

; QA 3:
hexa: union upper digit
;== make bitset! #{000000000000FFC07FFFFFE0}

non-digit: charset [not "0123456789"]
;== make bitset! [not #{000000000000FFC0}]
non-digit: complement charset ["0123456789"]
;== make bitset! [not #{000000000000FFC0}]

ws: charset reduce [space tab cr lf] ;== make bitset! #{0064000080}

make bitset! 100 ;== make bitset! #{00000000000000000000000000}

; expanding a bitset:
bs1: make bitset! "A" ;== make bitset! #{000000000000000040}
append bs1 "Z"        ;== make bitset! #{000000000000000040000020}
