Red []

; series:
data: [A B C D]               ; of words
; QA 1:
data: ["A" "B" "C" "D"]       ; of strings
data: [#"A" #"B" #"C" #"D"]   ; of characters

type? data   ;== block!
block? data  ;== true
series? data ;== true

names: ["John" "Dave" "Jane" "Bob" "Sue"]
codes: [2804 9439 2386 9823 4217]
files: [%employees %vendors %contractors %events]
sales: ["Saturday"  56 "Sunday" 11]
some-code: [print "Hello"]
