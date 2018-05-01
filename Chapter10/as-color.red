Red []

as-color: function [
    r [integer!]
    g [integer!]
    b [integer!]
][
    make tuple! reduce [r g b]
]

print as-color 153 255 51  ;== 153.255.51


; Red/System equivalent:
as-color: function [
    r [integer!]
    g [integer!]
    b [integer!]
    /local arr1 [integer!]
][
    arr1: (b % 256 << 16) or (g % 256 << 8) or (r % 256)
    stack/set-last as red-value! tuple/push 3 arr1 0 0
]
