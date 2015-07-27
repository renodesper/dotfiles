#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

## test for an existing bus daemon, just to be safe
#if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
#   ## if not found, launch a new one
#   eval `dbus-launch --sh-syntax --exit-with-session`
#   echo "D-Bus per-session daemon address is:
#$DBUS_SESSION_BUS_ADDRESS"
#fi



# This script toggles only external monitor (specified by $EXT),
# leaves the default monitor (specified by $IN) on. The default monitor
# (specified by $IN) should be connected when running the script, which
# is always true for a laptop.
#EXT="HDMI-0"
#INT="LVDS-0"
#if (xrandr | grep "$EXT disconnected"); then
#    xrandr --output $INT --auto --output $EXT --off
#else
#    xrandr --output $INT --auto --primary --output $EXT --auto --left-of $INT
#    xrandr --output $EXT --auto --primary --output $IN --off
#fi

# Autostarting applications
#(sleep 10 && amixer -c 0 set Speaker 100%) &
#export XDG_CACHE_HOME=/dev/shm
###xmodmap -e "pointer = 3 2 1"
xrdb -load .Xresources
sudo macchanger -e wlp3s0

# End key as Right key and Pause key as End key
#xmodmap -e "keycode 115 = Right NoSymbol Right"
#xmodmap -e "keycode 127 = End NoSymbol End"
#xset r 115
#xset r 127

# Alt_R as Super_L
xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
xmodmap -e "remove mod1 = Super_L"  # keeps it out of the mod1 group

# Calling WM or DE
#exec compiz --replace ccp
#exec gnome-session
#exec openbox-session
#exec startkde
exec xmonad
#exec ~/.dwm_start.sh
#exec budgie-wm
