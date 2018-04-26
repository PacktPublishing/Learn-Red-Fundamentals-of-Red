Red []

to-local-file %/e/code/red/red.bat   ;== "e:\code\red\red.bat"
to-red-file "e:\code\red\red.bat"    ;== %/e/code/red/red.bat
to-local-file/full %red.bat          ;== "E:\Red\red.bat"

pwd              ;== %/C/ProgramData/Red/
what-dir         ;== %/C/ProgramData/Red/
get-current-dir  ;== "C:\ProgramData\Red"

cd %/E/test      ;== %/E/test/
pwd              ;== %/E/test/
what-dir         ;== %/E/test/
get-current-dir  ;== "E:\test"

file? %/E/Red/red.bat    ;== true
dir? %/E/Red/            ;== true

make-dir %scripts        ;== %scripts/

exists? %/E/Red/red.bat    ;== true
exists? %/E/Red/red2.bat   ;== false
exists? %/E/NotExist/      ;== false

suffix? %/E/Red/red.bat    ;== %.bat
size? %red.bat             ;== 22

