Red [
    Title: "Download historical currency exchange rates from FloatRates"
]

url-base: http://www.floatrates.com/daily/
curr-code: uppercase ask "Rates for which currency (format like USD)? "
format: ask "Data in which format (xml or json)? "
url: rejoin [url-base curr-code "." format ]
; probe url  ; for testing
rates: read url
write %rates-format.json rates

; Example input:
; Rates for which currency (format like USD)? usd
; Data in which format (xml or json)? json