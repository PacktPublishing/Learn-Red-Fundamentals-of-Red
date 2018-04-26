Red [
    title: "Hovering over a button"
    needs: 'view
]

cities: ["Paris" "London" "Tokio"]
view [
    t1: text "City Trip?" red
        on-over [face/color: green]
        on-wheel [
            t1/text: first cities
            cities: next cities
            if tail? cities [cities: head cities]
        ]
]