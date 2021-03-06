#!/bin/bash

# Get monitor width and height for proper Layout
SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")
SCREEN_HEIGHT=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+x[\d]+" | sed -r "s/[0-9]+x//")

# Layout
WIDTH=$SCREEN_WIDTH
HEIGHT=98
X_POS=0
Y_POS=$(echo "$SCREEN_HEIGHT /2 - $HEIGHT / 2" | bc)

# Colors
DZEN_FG="#ffffff"
DZEN_BG="#e60926"

BAT=`acpi -b | awk '{gsub(/%,/,""); print $4}'`
STATUS=`acpi -b | awk '{gsub(/,/,""); print $3}'`

if [[ $BAT -lt 25  ]]; then
    echo "$BAT%"
    if [[ $STATUS = "Discharging" ]]; then
        echo "Warning, battery level below 25 percent" | dzen2 -tw 'battery' -x $X_POS -y $Y_POS -h $HEIGHT -w $WIDTH -fn "Poiret One-32" -fg $DZEN_FG -bg $DZEN_BG -xs 1 -e "onstart=uncollapse;button1=exit;key_Escape=exit" -p 10
    fi
else
    echo "$BAT%"
fi
