Red []

; do:
do 9 * 9                ;== 81
do square-root 25       ;== 5.0
do [print [tab uppercase "Red"]]    ;   == "RED"

do %script.red      ;== This is executed in a script

code: %script.red   ;== %script.red
do code             ;== This is executed in a script

; reduce
bl: [8 * 3 99 / 11 square-root 25 [pi ** 2]]    ;== [8 * 3 99 / 11 square-root 25 [pi ** 2]]
r: reduce bl                                    ;== [24 9 5.0 [pi ** 2]]
bl      ;== [8 * 3 99 / 11 square-root 25 [pi ** 2]]