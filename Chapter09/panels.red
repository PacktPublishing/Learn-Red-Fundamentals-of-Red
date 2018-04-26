Red [
    title: "Panel and group-box"
    needs: 'view
]

view [
    title "Panel and group-box"
    panel yellow bold 
    [   size 150x200 below 
        text bold "Orders"
        check
        area 60x75
        button "Quit" [quit]
    ]
    group-box green "group-box" bold 
    [   size 150x200 below 
        text bold "Payments"
        check 
        area 60x75
        button "Quit" [quit]
    ]
    tbp: tab-panel  250x150 [
        "Tab 1" [h4 "In panel 1!" button "Click in 1" [print tbp/data] ]      
        "Tab 2" [text "Second panel" button "Click in 2" [print tbp/pane] ]
        "Tab 3" [below text font-color red "Third panel" 
                check "subscribe to email?"
                button "Quit" [print tbp/selected quit]   
        ]
    ]  
]