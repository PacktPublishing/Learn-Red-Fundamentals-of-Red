Red [
    title: "List faces"
    needs: 'view
]

city-trip: copy ["Paris" "London" "Leipzig" "Rome" "New York" "Beijing"]

view [
    title "List faces"
    t1: text "Click on a city to visit ->"
    text-list 100x100 data city-trip [t1/text: pick face/data face/selected]

    t2: text "Click on a city to visit ->"
    drop-list data city-trip [t2/text: pick face/data face/selected]

    t3: text "Click on a city to visit ->"
    drop-down data city-trip [t3/text: pick face/data face/selected]
    ; drop-down data city-trip on-change [t3/text: pick face/data face/selected]
]
