Red [ 
    title: "Detect keypresses"
    needs: 'view
]

view/options [ 
    t: text "hit 'space', 'a', or '?' keys !"][
    actors: object [on-key: func [key event] [
            if event/key = #"a" [t/text: "'a' key pressed."]
            if event/key = #"?" [t/text:  "'?' key pressed."]
            if event/key = #" " [t/text: "'space bar'pressed."] 
                            ]
    ]
]