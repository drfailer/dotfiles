#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xrandr --output HDMI-0 --primary --left-of DVI-D-0 --output DVI-D-0 --auto
xrandr --output DP-0 --rotate left --left-of HDMI-0 --auto --output HDMI-0 --primary --auto --left-of DVI-D-0 --output DVI-D-0 --auto
xset r rate 300 50
setxkbmap -layout fr -option ctrl:nocaps
nitrogen --restore &
picom &
slstatus &
exec dwm
# exec xmonad
