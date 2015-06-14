#!/bin/bash

# Get monitor width and height for proper Layout
SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")
SCREEN_HEIGHT=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+x[\d]+" | sed -r "s/[0-9]+x//")

# Layout
WIDTH=183
X_POS=$(echo "$SCREEN_WIDTH - $WIDTH" | bc)
Y_POS=18
#Y_POS=735
LEFTSPACE=16
LINESIZE="160x1"

BLACK="#333333"
WHITE="#FFFFFF"
COLOR1="#00B454"
COLOR4="#78E700"
COLOR2="#086CA2"
COLOR3="#FF3900"

TODAY=`date +'%d'`
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(echo; echo; echo `date +"^p($LEFTSPACE) ^fg($COLOR3)%a,^fg($COLOR3) %d %b ^fg($COLOR2)%H:%M %n"`; echo; echo `date +"^p($LEFTSPACE) ^fg($COLOR1)%B %Y"`; cal | sed "2,8!d" | sed "/./!d" | sed "s/^/^p($LEFTSPACE) /" | sed "s/$/ /" | sed "s/Su Mo Tu We Th Fr Sa/^fg($COLOR2)Su Mo Tu We Th Fr Sa/" | sed -e "s/ $TODAY /^fg($COLOR3) $TODAY ^fg()/"; echo

for i in {1..1}; do
    NEXTMONTH=`expr $MONTH + $i`
    [ $NEXTMONTH -eq 13 ] && YEAR=`expr $YEAR + 1`
    M=`expr $NEXTMONTH % 12`
    if [ $M -eq 0 ]; then
        M=12
    fi

    echo `date -d "$YEAR-$M-1" +"^p($LEFTSPACE) ^fg($COLOR1)%B %Y"`;cal $M $YEAR | sed "2,8!d" | sed "/./!d" | sed "s/^/^p($LEFTSPACE) /" | sed "s/$/ /" | sed "s/Su Mo Tu We Th Fr Sa/^fg($COLOR2)Su Mo Tu We Th Fr Sa/"; echo;

done) \
| dzen2 -l 21 -p -fn 'Ubuntu Mono:size=10' -e 'onstart=uncollapse,scrollhome;button1=exit;' -bg $WHITE -w $WIDTH -x $X_POS -y $Y_POS
