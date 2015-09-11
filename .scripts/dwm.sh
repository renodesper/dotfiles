while true; do
    # Power/Battery Status
    if [ "$( cat /sys/class/power_supply/AC0/online )" -eq "1" ]; then
            DWM_BATTERY="AC";
            DWM_RENEW_INT=3;
    else
        DWM_BATTERY=$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',');
        DWM_RENEW_INT=30;
    fi;

    # Wi-Fi eSSID
    if [ "$( cat /sys/class/net/wlp3s0/carrier )" -eq "1" ]; then
            DWM_ESSID=$( /sbin/iwgetid -r ); 
    else
            DWM_ESSID="OFF";
    fi;

    # Volume Level
    DWM_VOL=$( amixer -c1 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

    # Date and Time
    DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

    # Overall output command
    DWM_STATUS="WiFi: [$DWM_ESSID] | Power: [$DWM_BATTERY] | Vol: $DWM_VOL | $DWM_CLOCK";
    xsetroot -name "$DWM_STATUS";
    sleep $DWM_REFRESH_INT;
done &

dwm 2> ~/.dwm.log
