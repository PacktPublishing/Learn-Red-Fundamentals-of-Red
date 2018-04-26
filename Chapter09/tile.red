Red [needs: 'view]

view [ 
    title "Tile Game"
    backdrop silver
    style tl: button 100x100 [
        temp: face/offset
        face/offset: empty/offset 
        empty/offset: temp
    ] 
    tl "8"  tl "7"  tl "6"  return 
    tl "5"  tl "4"  tl "3"  return 
    tl "2"  tl "1"  empty: base silver
]