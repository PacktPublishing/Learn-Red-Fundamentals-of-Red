Red [
    title: "Basic contacts app"
    needs: 'view
]

extract-info: func [] [
    clear names
    clear addresses
    clear phones
    foreach contact contacts [
        arr-contact: split contact ";"
        append names arr-contact/1
        append addresses arr-contact/2
        append phones arr-contact/3
    ]
]

clear-fields: func [] [
    name/text: copy ""  
    address/text: copy ""  
    phone/text: copy ""
]

if not find read %. %contacts [write %contacts ""]  ;(1)
contacts: read/lines %contacts                      ;(2)
names: copy []                                      ;(3)
addresses: copy []
phones: copy []
extract-info                                        ;(4)

view [
    title "Contacts"
    tl: text-list data names [
        name/text: pick tl/data tl/selected         ;(5)
        address/text: pick addresses tl/selected
        phone/text: pick phones tl/selected
    ]
    panel [
        below
        text "Name:"
        name: field 200
        text "Address:"
        address: field 250
        text "Phone:"
        phone: field 100
        button "Add" [                              ;(6)
            new-contact: rejoin [ name/text ";" address/text ";" phone/text]
            append contacts new-contact             ;(7)
            clear-fields
            extract-info
        ]
        button "Save" [
            write/lines %contacts contacts          ;(8)
            clear-fields
        ]
        button "Clear" [clear-fields]
    ]
]