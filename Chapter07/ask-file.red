Red []

file: request-file
print file  ;== /E/Red/red.bat
probe file  ;== %/E/Red/red.bat
probe file  ;== %/home/user/Red/readme.txt       ;on Linux

dir: request-dir
probe dir   ;== %/C/Program%20Files/

request-file/title "Browse to the application:"
request-dir/title "Browse to the application:"

request-file/file %"app1.exe"
request-dir/dir %"/C/Windows"
request-file/file/save %data1.txt
request-file/filter ["data files" "*.dat" "executables" "*.exe"]
request-file/multi  ;== [%/E/Red/red.bat %/E/Red/todo.txt]

request-font

