Red [
    title: "Panel and group-box"
    needs: 'view
]

view [
    title "Slider and progress bar"
    across
    ;-- horizontal progress bar:
    p1: progress 100x20 10%
    ;-- vertical progress bar: 
    p2: progress 20x100 15%
    ;-- bar following input:
    below
    text "Give the percentage (like 30%) and ENTER"
    field [p3/data: face/data]
    p3: progress
    ;-- slider showing status in text:
    t: text "25%"
    slider 100x20 data 25% [t/text: to-string face/data]
    return
    ;-- slider displayed in a progress bar:
    slider 100x20 data 10% [p4/data: face/data]
    p4: progress 100x20 10%  
]