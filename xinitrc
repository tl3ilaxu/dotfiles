#!/bin/sh
xsecurelock

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

dunst -config /home/tleilaxu/.dunstrc &
xsetroot -cursor_name left_ptr &
feh --bg-scale $HOME/Pictures/currentWallpaper.jpg
xautolock -time 3 -locker xsecurelock | logger &
setxkbmap -model pc104 -layout us,be,us -variant ,,dvorak -option grp:alt_shift_toggle caps:none compose:caps

sxhkd &
exec bspwm
