Red [
    Title: "Reactive programming examples"
]

; distance doesn't change when point changes:
point: [x: 3 y: 5]
distance: square-root (point/x ** 2) + (point/y ** 2)
print distance   ;== 5.8309518948453
point/x: 2
print distance   ;== 5.8309518948453
distance: square-root (point/x ** 2) + (point/y ** 2)
print distance   ;== 5.385164807134504

; using react:
point: make reactor! [x: 3 y: 5]
distance: is [square-root (point/x ** 2) + (point/y ** 2)]
print distance   ;== 5.8309518948453
point/x: 2
print distance   ;== 5.385164807134504

; reactor updating itself:
point: make reactor! [
    x: 3 
    y: 5 
    distance: is [square-root (x ** 2) + (y ** 2)]
]
point ;== make object! [x: 3 y: 5 distance: 5.8309518948453]
point/x: 2
point ;== make object! [x: 2 y: 5 distance: 5.385164807134504]
