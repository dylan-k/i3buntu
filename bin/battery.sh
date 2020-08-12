#!/bin/bash
export DISPLAY=:0
battery=`acpi -b`
battery_level=`acpi -b | cut -d ' ' -f 4 | grep -o '[0-9]*'` 
battery_state=$(acpi | grep 'Battery' | sed 's/Battery\s[0-9]*: //' | sed 's/, [0-9][0-9]*\%.*//')

if [[ "$battery_state" == "Discharging" && "$battery_level" -lt "15" ]] ; then
    /usr/bin/notify-send -u critical "Low battery: ${battery}"
fi

