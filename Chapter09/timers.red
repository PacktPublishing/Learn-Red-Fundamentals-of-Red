Red [
    title: ""
    needs: 'view
]

txt: "Blinking..."

view [
    size 400x400
    b: button 80x30 green "Catch me" rate 50 
        on-time [b/offset: b/offset + 1x1]
        on-down [quit]
    t1: text txt rate 5
        on-time [either t1/text = "" [t1/text: txt][t1/text: ""]]
    t2: text txt rate 0:00:03
        on-time [either t2/text = "" [t2/text: txt][t2/text: ""]]
]
