#!/bin/bash

PID=$(ps -ef | grep 'dzen2 -tw clock' | grep -v grep | awk '{print $2}')                                                                                                                  
if [ $PID ]; then                                                                                                                                                                            
    kill $PID                                                                                                                                                                                
else
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
    DZEN_BG="#336699"

    date +"%A, %d %B %Y ~ %T" | dzen2 -tw 'clock' -x $X_POS -y $Y_POS -h $HEIGHT -w $WIDTH -fn "Ubuntu Mono-24" -fg $DZEN_FG -bg $DZEN_BG -xs 1 -e "onstart=uncollapse;button1=exit;key_Escape=exit" -p 5
fi
