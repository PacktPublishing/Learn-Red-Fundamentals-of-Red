Red [
    title: "Macros"
]

; named macro:
#macro as-KB: func [n][n * 1024]

; pattern-matching macro:
#macro [number! 'KB] func [s e][to-integer s/1 * 1024]

print as-Kb 64  ;== 65536
print 64 KB     ;== 65536
print 2.5 KB    ;== 2560
