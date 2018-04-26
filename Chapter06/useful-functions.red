Red [
    "Useful functions"
]

check: func [list] [
    answer: "safe"
    foreach l list [
        if find l "--" [answer: "unsafe"]
    ]
    answer
]

fact: func [
        n [integer!]        
][
        if n = 0 [return 1]
        n * fact n - 1
]