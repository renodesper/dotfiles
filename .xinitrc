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

# This script toggles only external monitor (specified by $EXT),
# leaves the default monitor (specified by $IN) on. The default monitor
# (specified by $IN) should be connected when running the script, which
# is always true for a laptop.
# EXT="HDMI-0"
# INT="LVDS-0"
# if (xrandr | grep "$EXT disconnected"); then
#    xrandr --output $INT --auto --output $EXT --off
# else
#    xrandr --output $INT --auto --primary --output $EXT --auto --left-of $INT
#    xrandr --output $EXT --auto --primary --output $IN --off
# fi

# DE
# exec gnome-session
# exec startkde

# Autostart and WM
~/.autostart.sh &
# exec ~/.scripts/dwm.sh
exec ~/.scripts/frankenwm.sh
# exec budgie-session
# exec compiz --replace ccp
# exec openbox-session
# exec xmonad
