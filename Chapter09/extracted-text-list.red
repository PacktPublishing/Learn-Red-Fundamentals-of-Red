Red [
    title: "Extracted text list"
    needs: 'view
]

contacts: copy ["Dave" 1804 "Peter" 9439 "Viviane" 2386 "Marcus" 9423]
names: copy []
foreach [n c] contacts [append names n]
; alternative:
; names: extract contacts 2

view [
    below
    t: text ""
    tl: text-list data names 
    ; form is needed to make a string from the number
        [ 
            t/text: form pick contacts (2 * tl/selected)
            probe form index? find contacts (pick face/data face/selected)
        ]
]