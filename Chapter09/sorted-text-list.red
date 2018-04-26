Red [
    title: "Sorted text list"
    needs: 'view
]

city-trip: copy ["Paris" "London" "Leipzig" "Rome" "New York" "Beijing"]

view [
    tl: text-list data []
    ; (1) do - block:
    do [append tl/data sort city-trip]
    ; (2) button:
    ; why /reverse here?
    button "Add Items to List" [append tl/data sort/reverse city-trip]
]