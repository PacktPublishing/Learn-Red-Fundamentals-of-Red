Red [
    Title: "Capturing command-line arguments"
    Example: { Starting program with:
            red args.red 78 A Red 
        or after compiling with red -r:
            ./args 78 A Red }
]

print system/script/args  ;== "78 A Red"
type? system/script/args  ;== string!
args: split system/script/args " "  ;== ["78" "A" "Red"]
print ["Number of command-line arguments:" length? args]
;== Number of command-line arguments: 3
foreach arg args [
    print arg
]
; 78
; A
; Red