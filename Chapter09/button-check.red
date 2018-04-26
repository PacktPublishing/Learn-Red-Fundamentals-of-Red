Red [ needs: 'view ]

count: 0

view [
    below
    ch: check 250x30 "Change me through the button" 
    button "Click to change the check box" [
        ch/data: not ch/data
        either ch/data 
            [ch/text: "Changed to checked"]
            [ch/text: "Changed to unchecked"]
        count: count + 1
        if count = 3 [face/enabled?: not face/enabled?]
    ]
]