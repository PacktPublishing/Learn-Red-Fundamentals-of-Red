Red [
    Title: "Rocket count down"
]

count: 10
while [count > 0][
    either count = 1 [prin count print " second from launch"] 
    [prin count print " seconds from launch"]
    count: count - 1
]
print "IGNITION: Rocket fired!"

; 10 seconds from launch
; 9 seconds from launch
; 8 seconds from launch
; 7 seconds from launch
; 6 seconds from launch
; 5 seconds from launch
; 4 seconds from launch
; 3 seconds from launch
; 2 seconds from launch
; 1 second from launch
; IGNITION: Rocket fired!