Red [ 
    title: "Time" 
    needs: 'view
]    

time-now: to string! now/time

view/flags [ 
    title "Clock"
    show-time: text font-size 13 font-color red time-now
    ; ticking clock code:
    rate 1 on-time [show-time/text: to string! now/time]
]
[modal popup]   