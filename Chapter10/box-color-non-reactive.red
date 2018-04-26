Red [
    title: "Non reactive version"
    needs: 'view
]

to-color: function [value [percent!]][to integer! 255 * value]
    
    view [
        title "Box changes color"
        below
        slider [box/color/1: to-color face/data]
        slider [box/color/2: to-color face/data]
        slider [box/color/3: to-color face/data]
        box: base
    ]
