Red [
    title: "Draw Lines" 
    needs: 'view 
]

view [ 
    base white 500x300 
    draw [ 
        pen blue line 0x150 500x150  
        pen blue line 250x0 250x300 
        pen red line 0x0 500x300 
        pen red line 0x300 500x0  
    ] 
]