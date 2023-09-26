#!/bin/bash

O=VIRTUAL1  # The name of the virtual display (check using xrandr)
P=LVDS1      # The name of your physical display (check using xrandr)

# Create the virtual display
xrandr --newmode "1080x900_60.00" 80.08 1080 1144 1256 1432  900 901 904 932 -HSync +Vsync
xrandr --addmode ${O} "1080x900_60.00"
xrandr --output ${O} --mode "1080x900_60.00" --right-of ${P}
    
# Forward the VNC port to your device and start a VNC session
adb reverse tcp:5900 tcp:5900
x11vnc -localhost -clip "1080x900+1366+0"

# When the session ends, turn off the virtual display
xrandr --output ${O} --off
