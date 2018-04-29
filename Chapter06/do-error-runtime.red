Red [
    Title: ""
]

; mycode: [prnt "Hello" halt]
; do mycode
        
; Interpreted in Red console (F6):
;*** Script Error: prnt has no value
;*** Where: do
;*** Stack:

; Compile to native code: no problem:
; code between [ ] is considered data and not compiled
; Compiling to native code...
; ...compilation time : 39005 ms
; ...linking time     : 286 ms
; ...output file size : 596480 bytes
; ...output file      : E:\test\do-error-runtime.exe

; when executing: Command failed: "f:\Red\testen\test.exe"
; PS E:\test> ./do-error-runtime
; *** Script Error: prnt has no value
; *** Where: do
; *** Stack:
; PS E:\test>

