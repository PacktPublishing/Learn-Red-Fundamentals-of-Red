Red []

digit: charset "0123456789"
letter: charset [#"a" - #"z" #"A" - #"Z"]
alpha-num: union letter digit

; parsing exchange rate string:
rate: "<title>1 USD = 0.81191502 EUR</title>"
parse rate [to "<title>" pos:]    ;== false
pos         ;== "<title>1 USD = 0.81191502 EUR</title>"
index? pos  ;== 1

parse rate [thru "<title>" pos:]  ;== false
pos         ;== "1 USD = 0.81191502 EUR</title>"
index? pos  ;== 8

parse rate [thru "<title>" pos1: to "</title>" pos2: thru ">"]   ;== false
pos1          ;== "1 USD = 0.81191502 EUR</title>"
index? pos1   ;== 8   
pos2          ;== "</title>"
index? pos2   ;== 30

parse rate [thru "<title>" to "</title>"]
parse rate [thru "<title>" to "</title>"]           ;== false
parse rate [thru "<title>" to "</title>" thru ">"]  ;== true
parse rate [thru "<title>" copy data to "</title>" thru ">"]  ;== true
parse rate [thru "<title>" to "</title>" to end]  ;== true

print data ;1 USD = 0.81191502 EUR
probe data  ;== "1 USD = 0.81191502 EUR"

parse rate [thru "<title>" copy data to "</title>" (print data) thru ">"]
;1 USD = 0.81191502 EUR  ;== true

parse rate [thru "<title>" set data to "</title>" (print data) thru ">"]
;1 ;== true

; QA 6:
data:  "1 USD = 61.40501792 MZN"
parse data [thru "= " copy exchange-rate to " " thru some letter]  ;== true
probe exchange-rate  ;== "0.81191502"

; using variables:
parse "xxxyyy" [copy letters some "x" (n: length? letters) n "y"]  ;== true
letters  ;== "xxx"

; copy with binary value:
parse #{FFFFDECAFBAD000000} [
    2 #{FF}
    copy data to #{00}
    some #{00}
]     ;== true
data  ;== #{DECAFBAD}

parse rate [to "<title>" change "<title>" "<rate>"]   ;== false
rate  ;== "<rate>1 USD = 0.81191502 EUR</title>"

; more flexible:
start-tag: "<title>"
change-tag: "<rate>"
find-tag: [to start-tag]
replace-tag: [change start-tag change-tag]
parse rate [find-tag replace-tag]
do-action: [find-tag replace-tag]
parse rate do-action
rate ;== "<rate>1 USD = 0.81191502 EUR</title>"

rate: "<title>1 USD = 0.81191502 EUR</title>"
parse rate [to "<title>" remove "<title>"]   ;== false
rate  ;== "1 USD = 0.81191502 EUR</title>"

rate: "<title>1 USD = 0.81191502 EUR</title>"
parse rate [to "<title>" insert "NEW"]   ;== false
rate  ;== "NEW<title>1 USD = 0.81191502 EUR</title>"

; QA 7:
rate: "<title>1 USD = 0.81191502 EUR</title>"
parse rate [
    to "<title>" change "<title>" "<rate>"
    to "</title>" change "</title>" "</rate>"
]   ;== false
print rate  ;== "<rate>1 USD = 0.81191502 EUR</rate>"

; on the entire file:
rates: read %rates.xml

;parse rates [ any [thru "<title>" copy data to "</title>"] ] ;== false
;data  ;== "1 USD = 61.40501792 MZN"

; read date of the rates:
; make usd variable
usd: copy []
parse rates [ any [thru "<title>" copy data to "</title>" (append usd data)] ]
;== false
usd
;== [{XML Daily Foreign Exchange Rates for U.S. Dollar (USD)} "1 USD = 0.81191502 EUR" "1 USD = 0.70675954 GBP" "1 USD = 0.94840517 CHF" "1 USD = 1.29753098 CAD" "1 USD = 1.294292...

usd: copy []
parse rates [
    thru </lastBuildDate>
    any [thru "<title>" copy data to "</title>" (append usd data)] 
]
usd
;== ["1 USD = 0.81191502 EUR" "1 USD = 0.70675954 GBP" "1 USD = 0.94840517 CHF" "1 USD = 1.29753098 CAD" "1 USD = 1.29429260 AUD" "1 USD = 105.59598315 JPY" "1 USD = 114.07517952 ...

; QA 8:
; use probe to verify the extracted data
usd: copy []
parse rates [
    any [
        thru "<targetCurrency>" copy data to "</targetCurrency>" 
            (   probe data 
                append usd data)
        thru "<exchangeRate>" copy data to "</exchangeRate>" 
            (   probe data 
                append usd data)
        ]
]
usd ;== ["EUR" "0.81191502" "GBP" "0.70675954" "CHF" "0.94840517" "CAD" "1.29753098" 
;"AUD" "1.29429260" "JPY" "105.59598315" "DZD" "114.07517952" "KRW" "1,075.79477270" 
;"LKR" "155.936...

; QA 9:
parse "xyxxyyx" [
    some [
        "x" (print "found an x")
        |
        "y" (print "found a y")
    ]
]
; found an x
; found a y
; found an x
; found an x
; found a y
; found a y
; found an x
; == true