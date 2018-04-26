Red []

; quit
answer: ask "Type a number (from 1 till 99) or stop(S): "
if answer = "S" [
    print "Allright, you want to stop."
    quit
    ; quit/return 5
    ; quit-return 5
]

print "This line is not executed when S is entered"

wait 5  ; stop for 5 seconds