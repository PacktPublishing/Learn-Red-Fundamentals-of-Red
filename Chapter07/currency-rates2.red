Red [
    Title: "Download historical currency exchange rates from FloatRates"
]

url-base: http://www.floatrates.com/historical-exchange-rates.html?
curr-code: ask "Rates for which currency (format like USD)? "
curr-date: ask "Rates from which date (YYYY-MM-DD)? "
url: rejoin [url-base "&currency_date=" curr-date "&base_currency_code=" curr-code
 "&format_type=xml"]
rates: read url
write %rates-hist.xml rates

; Example input:
; Rates for which currency (format like USD)? USD
; Rates from which date (YYYY-MM-DD)? 2018-03-15
