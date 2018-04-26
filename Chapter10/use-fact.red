Red [
    Title: {Calculates factural using a 
    Red/System routine}
]

#system-global [#include %fact.reds]

red-fact: routine [
    n [integer!]
    return: [integer!]
][
    fact n	; function from fact.reds
]

print red-fact 9 ;== 362880 
