Red [
    title: "Drag and drop"
    needs: 'view
]

view [
    size 200x200 backdrop yellow
    below
    t: text ""    
    button 150x50 "Don't lose me!" loose 
;        on drop [t/text: "I am dropped"]
;        on drag [t/text: "Button is on the loose"]
]
