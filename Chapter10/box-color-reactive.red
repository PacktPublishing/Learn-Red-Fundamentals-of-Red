Red [
    title: "Non reactive version"
    needs: 'view
]

to-color: function [value [percent!]][to integer! 255 * value]

view [
        below
        r: slider
        g: slider
        b: slider
        base react [
            face/color: as-color to-color r/data to-color g/data to-color b/data
        ]
    ]
