Red [ 
    title: "Time" 
    needs: 'view
]    

time-now: to string! now/time
view/flags [ 
    title "Red Time"
    show-time: text font-size 14 font-color red time-now
]
[modal popup]                                               