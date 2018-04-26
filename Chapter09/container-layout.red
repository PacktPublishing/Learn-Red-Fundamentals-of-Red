Red [
    title: "Downloading currency exchange rates"
    needs: 'View
]

; structure of view block:
; view/refine1/refine [
;     container settings
;     layout commands
;     face1 faces [action facet]
;     face2 faces [action facet]
;     ...
; ][details refine1][details refine2]

; view [
;     text "Use of do block"
;     n: 2 ** 3
;     print n
; ]
; *** Script Error: VID - invalid syntax at: [2 ** 3]
view [
    text "Use of do block"
    do [n: 2 ** 3 print n]
]
;== 8
;== windows appears witch displays "Use of do block"

; Container settings:
view [ size  350x125]
view [ backdrop blue]

view/options [
][offset: 400x100]

view/flags [
][resize]

view/flags/options [
][modal resize][offset: 400x100]

view/flags [
][no-title]

view/flags [
][no-border]

view/flags [
][no-min]

view/flags [
][no-max]

view/flags [
][no-buttons]

; Windows only:
view/flags [
][popup]

; Layout commands:
; example QA 3
view [
    base yellow 25x25
    base green 25x25
    return
    base blue 25x25
    space 30x30
    base red 25x25
    base yellow 25x25
    pad 15x15
    base green 25x25
]

; offset:
v: view [
    base aqua 25x25
]
v/offset: 75x40
