#!/bin/bash

# Get monitor width and height for proper Layout
SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")
SCREEN_HEIGHT=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+x[\d]+" | sed -r "s/[0-9]+x//")

# Layout
HEIGHT=18
WIDTH=$(echo "$SCREEN_WIDTH / 2" | bc)
X_POS=$(echo "$SCREEN_WIDTH - $WIDTH" | bc)
Y_POS=1348

# Colors and font
FONT='Helvetica-9'
DZEN_BG="#ffffff"

conky -c ~/.scripts/conky/toprightbar | dzen2 -tw 'rightbar' -x $X_POS -y $Y_POS -ta r -fn $FONT -bg $DZEN_BG -w $WIDTH -h $HEIGHT -e 'onnewinput=;button3='
