#!/bin/sh
xsecurelock auth_pam_x11 saver_blank2

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

dunst -config /home/tleilaxu/.dunstrc &
xsetroot -cursor_name left_ptr &
feh --bg-scale $HOME/Pictures/currentWallpaper.jpg
xautolock -time 3 -locker xsecurelock | logger &
setxkbmap -model pc104 -layout us,be,us -variant ,,dvorak -option grp:alt_shift_toggle caps:none compose:caps

sxhkd &
exec bspwm
