Red [
    Title: "Download currency exchange rates from Floatrates"
]

; 1. Read the url to get the rates
; 2. Store the rates in a memory variable
rates: read http://www.floatrates.com/daily/USD.xml 
; 3. Write the rates contained in the variable to an XML file
write %rates.xml rates

; or in one line:
write %rates.xml read http://www.floatrates.com/daily/USD.xml