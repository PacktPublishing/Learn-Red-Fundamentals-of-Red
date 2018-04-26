Red [
    title: "Live clocj demo"
    needs: 'view
]

clock-demo: {
    base 200x200 transparent rate 1 now draw [
        scale 2 2
        fill-pen #0B79CE pen off
        circle 50x50 45
        line-width 2
        hour: rotate 0 50x50 [pen #023963 line 50x50 50x20]
        min:  rotate 0 50x50 [pen #023963 line 50x50 50x10]
        sec:  rotate 0 50x50 [pen #CE0B46 line 50x50 50x10]
    ] on-time [
        time: now/time
        hour/2: 30 * time/hour
        min/2:  6  * time/minute
        sec/2:  6  * time/second
    ]
    }

system/view/silent?: yes

view [
    title "Eve clock demo"
    backdrop #2C3339
    across

    source: area #13181E 410x300 no-border clock-demo font [
        name: "Consolas"
        size: 9
        color: hex-to-rgb #9EBACB
    ]

    panel 200x300 #2C3339 react [
        attempt/safer [face/pane: layout/tight/only load source/text]
    ]
]