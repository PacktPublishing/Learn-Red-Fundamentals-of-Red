Red [
    Title: "Ways of interacting with the OS"
]

; call:
call "explorer.exe"                ;== 9668
call/shell "notepad.exe"           ;== 2292
call/shell "notepad.exe info.txt"  ;== 11632
cmd: "notepad.exe info.txt"
call/shell cmd
call/shell/wait "notepad.exe"      ;== 0
call/output "ls" %listing          ;== 0
call "start copy nul > myfile.txt" ;== 13760

; clipboard
write-clipboard "Some important info"  ;== true
; close Red console or Red program
print read-clipboard ;== Some important info