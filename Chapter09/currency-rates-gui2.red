Red [
    title: "Downloading currency exchange rates"
    needs: 'view
]

url-base: http://www.floatrates.com/historical-exchange-rates.html?

download-rates: func [code date] [
    url: rejoin [url-base "&currency_date=" date "&base_currency_code=" code
        "&format_type=xml"]
    rates: read url
    write %rates-hist2.xml rates
    out/text: "SUCCESS!" 
]

view [
    title "Currency rates"
    below
    text 280x15 "Rates for which currency (format like USD):"  
    curr-code: field 
    text 280x15 "Rates from which date (format like YYYY-MM-DD):" 
    curr-date: field 100x25 
    button "Download XML rates file" [download-rates curr-code/text curr-date/text] 
    out: text ""
]
