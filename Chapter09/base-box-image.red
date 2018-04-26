Red [
    title: "Base, box and image"
    needs: 'view
]

view [
    base
    box red
    image 140x140  %heads.jpg
    below
    text "I am a button:"
    button %heads.jpg [quit]
]