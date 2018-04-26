Red []

; save and load
; QA 4:
save %contactss contacts
; "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234"
; "Paul Thompson" "234 Georgetown Pl. Grove, AL" "555-2345"
; "Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456"
; "George Jones" "456 Topforge Court Mountain Creek, CO" ""
; "Tim Paulson" "" "555-5678"

contactsl: load %contactss
; == ["John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234" 
; "Paul Thompson" "234 Georgetown Pl. Grove, AL" "555-2345" 
; "Jim Persee" "345 Pickles Pike Orange Grove, F... ]

; saving in json format:
save %contacts-json contacts /as [json]  ;== [json]

; loading data as a series:
; file names contains:
; "John" "Dave" "Jane" "Bob" "Sue" "Sarah" "Mikhail" "Rudolf" "Nenad"
names: load %names
probe names
== ["John" "Dave" "Jane" "Bob" "Sue" "Sarah" "Mikhail" "Rudolf" "Nenad"]
type? names  ;== block!

; saving code:
save %code.red [Red[] print "Hello from saved Red"]
do %code.red
code: load %code.red
do code
;== Hello from saved Red

; saving a function to a file:
code:  [appin: func [input /local str] [str: "-" append str input]]
save %codef.red code
blk: load %codef.red
;== [appin: func [input /local str] [str: "-" append str input]]
do blk
;== func [input /local str][str: "-" append str input]
appin "a"
;== "-a"
appin "b"
;== "-ab"
:appin
;== func [input /local str][str: "-ab" append str input]


; QA 5:
code:  [appin: func [input /local str] [str: copy "-" append str input]]
save %codef2.red code
blk: load %codef2.red
;== [appin: func [input /local str] [str: "-" append str input]]
do blk
;== func [input /local str][str: "-" append str input]
appin "a"
;== "-a"
appin "b"
;== "-b"

; Saving and loading the console history
save %history system/console/history
system/console/history: load %history