#!/bin/sh
ln -sf ~/Pictures/currentWallpaper.jpg ~/.config/screensaver/screensaver.png
xsecurelock saver_darken

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
feh --bg-scale -Z $HOME/Pictures/currentWallpaper.jpg
xautolock -time 3 -locker "xsecurelock saver_mpv" | logger &
setxkbmap -model pc104 -layout us,be,us -variant ,,dvorak -option grp:alt_shift_toggle caps:none compose:caps
pulseaudio --start
#Fix java
export _JAVA_AWT_WM_NONREPARENTING=1
IRONIC_WM_NAME="LG3D"
NET_WIN=$(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F "# " '{print $2}')

if [[ "$NET_WIN" == 0x* ]]; then
    # xprop cannot reliably set UTF8_STRING, so we replace as string.
    # fortunately, jdk is OK with this, but wm-spec says use UTF8_STRING.
    xprop -id "$NET_WIN" -remove _NET_WM_NAME
    xprop -id "$NET_WIN" -f _NET_WM_NAME 8s -set _NET_WM_NAME "$IRONIC_WM_NAME"
else
    # even if we're not net compatible, do java workaround
    xprop -root -remove _NET_WM_NAME
    xprop -root -f _NET_WM_NAME 8s -set _NET_WM_NAME "$IRONIC_WM_NAME"
fi

compton --config /home/tleilaxu/compton.conf -b
/home/tleilaxu/.dotfiles/scripts/battery_level_checker &

sxhkd &
exec bspwm
