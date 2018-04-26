Red/System [
    Title: "Calculate factorial"
]

fact: func [
    n [integer!]
    return: [integer!]
][
    if n = 0 [ return 1]
    n * fact n - 1
]

;print fact 9  ;== 362880