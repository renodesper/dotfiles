#! /bin/bash


while true; do
    # Date and Time
    clock=$( date '+%Y-%m-%d %I:%M' );
    dwm_clock=$(echo -e "\x06  $clock  ");

    # Volume Level
    # vol=$( amixer get Master | awk 'NR==5 {print $4}' | egrep -o '[0-9]+' );
    # vol_state=$( amixer get Master | awk 'NR==5 {print $6}' );

    # if [ "$vol_state" = "[on]" ]; then
    #         dwm_vol=$(echo -e "  \x06$vol %  ");
    #     else
    #         dwm_vol=$(echo -e "  \x07$vol %  ");
    # fi

    # Net Status
    # essid=$( iwconfig wlp4s0 | awk '/ESSID/ {print $4}' );

    # if [ $essid = "ESSID:off/any" ]; then
    #     net_state=$(echo -e "   \x07Offline   ");
    # else
    #     net_state=$(echo -e "   \x06Online   ");
    # fi

    # Battery Satus
    battery=$( acpi -a | awk '{print $3}' );

    if [ "$battery" = "off-line" ]; then
        dwm_battery=$(echo -e "\x02   Discharging   \x01  <");
    else
        dwm_battery=""  
    fi

    # Separator
    sepa=$(echo -e "\x01<");

    # Overall output command
    dwm_status=" dwm_clock ";
    xsetroot -name "$dwm_status";
    sleep 1m;
done &

while true; do
    dwm 2> ~/.dwm.log
done
