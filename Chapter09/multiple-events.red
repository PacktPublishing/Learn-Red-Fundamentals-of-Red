Red [
    title: "Multiple Events"
    needs: 'view
]

view [
    below
    message: text 100x25 green "Nothing"
    button "Different things happen" 
        [message/text: "A click!"]             ; default event
        on-over [message/text: "Hovering!"]    ; hovering cursor
        on-dbl-click [message/text: "A double click!"]
        on-wheel [message/text: "Wheeling!"]   ; mouse wheel
]