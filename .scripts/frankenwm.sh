#!/usr/bin/env sh

# get monitor width and height for proper layout
SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")
SCREEN_HEIGHT=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+x[\d]+" | sed -r "s/[0-9]+x//")

# layout
HEIGHT=18
WIDTH=$(echo "$SCREEN_WIDTH / 2" | bc)
X_POS=0
Y_POS=0  #1348

# colors and font
FONT='Play-9'
DZEN_BG="#ffffff"

# create a fifo to send output
wm="frankenwm"
ff="/tmp/frankenwm.fifo"
[[ -p $ff ]] || mkfifo -m 600 "$ff"

while read -r; do
    # filter output to only what we want to match and parse
    [[ $REPLY =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]] && read -ra desktops <<< "$REPLY" || continue
    for desktop in "${desktops[@]}"; do
        # set values for
        # d - the desktop id
        # w - number of windows in that desktop
        # m - layout/mode for that desktop
        # c - whether that desktop is the current (1) or not (0)
        # u - whether a window in that desktop has an urgent hint set (1) or not (0)
        IFS=':' read -r d w m c u <<< "$desktop"
        # name each desktop
        case $d in
            0) d=" Net " s="" ;;
            1) d=" Code " s="" ;;
            2) d=" Chat " s="" ;;
            3) d=" Office " s="" ;;
            4) d=" Graphic " s="" ;;
            5) d=" Game " s="" ;;
            6) d=" Other   " s="" ;;
        esac
        # current desktop color & layout/mode
        ((c)) && f="#336699" || f="#999999"
        # ((c)) && f="#000000" && case $m in
        #     # name each layout/mode with a symbol
        #     0) i="[T]" ;;
        #     1) i="[B]" ;;
        #     2) i="[G]" ;;
        #     3) i="[M]" ;;
        #     4) i="[F]" ;;
        #     5) i="[D]" ;;
        #     6) i="[E]" ;;
        # # other desktop color
        # esac  || f="#777777"

        # urgent color
        ((u)) && f="#e60926"

        # if the desktop has windows print that number next to the desktop name
        # else just print the desktop name
        ((w)) && r+="$s ^fg($f)$d ($w)^fg() " || r+="$s ^fg($f)$d^fg() "
    done

    # read from fifo and output to dzen2
    printf "%s%s\n" "$r" "$i" && unset r
done < "$ff" | dzen2 -x $X_POS -y $Y_POS -ta r -fn $FONT -bg $DZEN_BG -w $WIDTH -h $HEIGHT -e 'button3=' &

# pass output to fifo
"$wm" > "$ff"
