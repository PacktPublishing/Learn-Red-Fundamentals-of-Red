Red [
    title: "Menus" 
    needs: 'view
]

mex: layout [title "Menu example" ar: area cyan 400x400]

mex/menu: [
    "File" [ "Load" load --- "Save" sv --- "Save As" svas --- "Print" prnt ]
    "Sub-menus" [
            "Submenu1" s1
            "Submenu2" s2
            "Submenu3" [
                "Submenu4" s4
                "Submenu5" s5
            ]
    ]
    "Tools" [ "Text Size" txts  ]
    "Help" [ "Some Help" hlp ]
    "Quit" [ "Close all" qt]
]

mex/actors: make object! [
    on-menu: func [face [object!] event [event!]][
        switch event/picked [
            load [print "load"  ar/text: "Load !"]
            sv   [print "save" ar/text:  "Save !"]
            svas [print "save as" ar/text:  "Save As !"]
            s4   [print "submenu4 selected" ar/text:  "Submenu 4"]
            txts [print "Tools tab !"  ar/text: "Tools tab !"] 
            hlp  [print "help tab !"  ar/text: "Help tab !"]
            prnt [print "print menu selected" ar/text: "Print tab !"]
            qt   [quit]            
        ]
    ] 
]        

view mex
