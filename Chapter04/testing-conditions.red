Red [
    Title: "Branching code depending on conditions"
]

;-- if
account: -250
if account < 0 [print "Your account is overdrawn."]  ;== Your account is overdrawn.
if not exists? %missing.txt [print "File missing.txt does not exist"]
if now/time < 12:00 [print "before noon"] ;== before noon

n: 12 m: 42
if any [n = 13  m = 42] [print "true!"]  ;== true!
if all [n = 13  m = 42] [print "true!"]  ;== none ; nothing printed

if 42 [print "true!"]   ;==true!
if "ok" [print "true!"] ;==true!
if none [print "true!"] ;== none

unless exists? %missing.txt [print "File missing.txt does not exist"] 

if 13 < 42 [print "13 < 42"] [print "13 > 42"] ; 13 < 42  ;== [print "13 > 42"]

; QA 1:
if 0 [print "0 is true"]    ;== 0 is true
if 13 = 13.0 [print "ok"]   ;== ok      ; same value!
if 13 == 13.0 [print "ok"]  ;== none    ; same value but not same datatype!

; either
either 13 < 42 [print "13 < 42"][print "13 > 42"] ;== 13 < 42  
; equivalent to:
if 13 < 42 [print "13 < 42"]
print "13 > 42"

either 13 > 42 [print "13 < 42"][print "13 > 42"] ;== 13 > 42

print either now/time < 12:00 ["AM"]["PM"]   ;== PM

n: 42
either n < 0 [msg: "negative"][msg: "zero or positive"]
print ["n is" msg]  ;== a is zero or positive

; equivalent if statement:
if n < 0 [msg: "negative"]
msg: "zero or positive"
print ["n is" msg]  ;== a is zero or positive

either n < 0 [
    msg: "negative"
    print "in true branch"
][
    msg: "zero or positive"
    print "in false branch"
]  ;== in false branch

msg: either n < 0 ["negative"]["zero or positive"]  ;== "zero or positive"
msg  ;== "zero or positive"

user: ask "Username (jvh38):  "
pass: ask "Password (avi108):  "
either all [user = "jvh38" pass = "avi108"][
    print ["Hi" user]
    print "Welcome back"
][
    print "Incorrect Username/Password"
]   
;== Hi jvh38
;== Welcome back

; QA 2:
p: 7
out: either p == 7.0 ["p is 7"]["bad luck"]
out   ;== "bad luck"

; quit
answer: ask "Type a number (from 1 till 99) or stop(S): "
if answer = "S" [
    print "Allright, you want to stop."
    quit
]
print "This line is not executed when S is entered"

; halt
if now/time > 19:00 [prin "Stop working" halt] ;== Stop working(halted)

; switch
person: "John"
switch person [
    "Bob"   [print "Bob is at the gym"]
    "John"  [print "John is at work"]
    "Laila" [print "Laila is shopping"]
] ;== John is at work

person: "John"
switch/default person [
    "Bob"       [print "Bob is at the gym"]
    "Lawrence"  [print "Lawrence is at work"]
    "Laila"     [print "Laila is shopping"]
][
    print "person not found"
] ;== person not found

var: 108
switch type?/word var [
    string!  [print "found a string"]
    binary!  [print "found a binary"]
    integer! [print "found an integer number"]
    decimal! [print "found a decimal number"]
] ;== an integer number

; QA 4
item: "red"
switch/default item [
    42       [print "it's 42"]
    "red"    [print "nice color"]
    23.77.44 [print "it's a tuple"]
][print "no match"] ;== nice color

; case
num: 42
case [
    num > 42  [print "num is more than 42"]
    num < 42  [print "num is less than 42"]
    num > 33  [print "num is more than 33"]
    num = 42  [print "num is 42"]
    true      [print "yes its true"]
] ;== num is more than 33

num: 42
case/all [
    num > 42  [print "num is more than 42"]
    num < 42  [print "num is less than 42"]
    num > 33  [print "num is more than 33"]
    num = 42  [print "num is 42"]
    true      [print "yes its true"]
]
;== num is more than 33
;== num is 42
;== yes its true

; QA 5:
name: "kim"
case [
    find name "a" [print {Your name contains the letter "a"}]
    find name "e" [print {Your name contains the letter "e"}]
    find name "i" [print {Your name contains the letter "i"}]
    find name "o" [print {Your name contains the letter "o"}]
    find name "u" [print {Your name contains the letter "u"}]
    true [print {Your name doesn't contain any vowels!}]
] ;== Your name contains the letter "i"

; catch - throw
catch  [print "before throw" throw "error" print "after throw"]
;== before throw  ; "error" is returned     

if n = 0 [throw 5] ;== *** Throw Error: no catch for throw: 5

; throw/name rvalue tname
; catch/name [some function call with a throw] tname
; catch/name [some function call with a throw] [tname1 tname2]