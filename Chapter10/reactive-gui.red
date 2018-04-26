Red [
    title: "Slider and progress, actor and reactive"
    needs: 'view]

view [
    origin 0x0 space 0x0
    tab-panel 500x500 [
        "Tab 1    " [
            progress 100x20 data 20% react [face/data: s/data]
            s: slider 100x20 data 20%
        ]
        "Tab 2    " [
        p: progress 100x20 20%
        slider 100x20 data 20% [p/data: face/data]
        ]
    ]
]