Red []

digit: charset "0123456789"

; parse input [rules]
parse "XY6" ["XY" digit]       ;== true
parse "XY67" ["XY" digit]      ;== false

; a number of repetitions:
parse "XY67" ["XY" 2 digit]    ;== true
parse "XY67" ["XY" 2 4 digit]  ;== true
parse "XY67" ["XY" 0 4 digit]  ;== true
parse "XY" ["XY" 0 4 digit]    ;== true

; /case:
parse "xy67" ["XY" 2 4 digit]       ;== true
parse/case "xy67" ["XY" 2 4 digit]  ;== false

; /part:
parse/part "xy67" ["XY"] 2  ;== true
parse/part "xy67" ["XY"] 3  ;== false

; some:
parse "XY67" ["XY" some digit]    ;== true
parse "XY" ["XY" some digit]      ;== false
parse "XY2915" ["XY" some digit]  ;== true

; only first item:
parse "XXY" [some "X" "Y"]     ;== true
parse "XYXY" [some "X" "Y"]    ;== false
parse "XYXY" [some ["X" "Y"]]  ;== true
parse "XYXY" [some "XY"]       ;== true

input: "XY2915"
rules: ["XY" some digit]
parse input [rules]   ;==true

; any:
parse "XY67" ["XY" any digit]   ;== true
parse "XY" ["XY" any digit]     ;== true 

; spaces:
parse "XY 2915" ["XY" some digit]       ;== false
parse "XY 2915" ["XY" space some digit] ;== true
parse "XY 2915" ["XY" skip some digit]  ;== true
parse "XYabc2915" ["XY" 3 skip some digit]    ;== true
parse "XYabc2915" ["XY" 1 3 skip some digit]  ;== true
parse "XY2915" ["XY" 0 3 skip some digit]     ;== true

program: {
        ID: 121.34
        Version: 1.2.3-5.6
        Description: "This program calculates ..."
}
id: [3 digit dot 2 digit]
parse program [some [id | skip]]   ;== true
dot ;== #"."

parse program [some [copy value id | skip]]   ;== true
probe value   ;== "121.34"

; | (or)
xy: ["X" | "Y"]
parse "X123" [xy some digit]    ;== true
parse "Y108" [xy some digit]    ;== true

uz: charset "UVWXYZ"  ;== make bitset! #{0000000000000000000007E0}
parse "X123" [uz some digit]    ;== true
parse "V456" [uz some digit]

; QA 4:
sign: ["+" | "-" | ""]
integer: [sign some digit]
parse "+42" integer   ;==true
parse "-108" integer  ;==true
parse "13" integer    ;==true

; QA 5:
prefix: ["ABC" | "XYZ"]
product-code: ["#" prefix "-" 4 digit]
parse "#ABC-1956" product-code  ;== true
parse "#XYZ-4358" product-code  ;== true
