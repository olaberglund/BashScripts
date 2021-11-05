#!/bin/sh
charge_full_design=$(cat /sys/class/power_supply/BAT0/charge_full_design 2>/dev/null || cat /sys/class/power_supply/BAT0/energy_full_design)
charge_now=$(cat /sys/class/power_supply/BAT0/charge_now 2>/dev/null || cat /sys/class/power_supply/BAT0/energy_now 2>/dev/null) 
percentage=$(echo "100*$charge_now/$charge_full_design" | bc)
echo "full charge design: $charge_full_design"
echo "charge now: $charge_now"
echo $percentage%
