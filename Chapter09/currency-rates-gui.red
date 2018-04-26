Red [
    title: "Downloading currency exchange rates"
    needs: 'view
]

url-base: http://www.floatrates.com/historical-exchange-rates.html?

download-rates: does [
    url: rejoin [url-base "&currency_date=" curr-date/text "&base_currency_code=" curr-code/text
        "&format_type=xml"]
    rates: read url
    write %rates-hist.xml rates
    out/text: "SUCCESS!" 
]

view [
    title "Currency rates"
    below
    text 280x15 "Rates for which currency (format like USD):"  
    curr-code: field 
    text 280x15 "Rates from which date (format like YYYY-MM-DD):" 
    curr-date: field 100x25 
    button "Download XML rates file" [download-rates] 
    out: text ""
]

; alternative:
; win: [
;     title "Currency rates"
;     below
;     text "Rates for which currency (format like USD):"  
;     curr-code: field 
;     text "Rates from which date (YYYY-MM-DD):" 
;     curr-date: field 100x25 
;     button "Download XML rates file" [download-rates] 
;     out: text ""
; ]

; view win

; alternative 2:
; win: []
; ; build up win with statements like append win [title "Currency rates"]
; view win
