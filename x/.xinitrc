#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
    for f in "$xinitdir/xinitrc.d"/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# xinput set-prop "Elan Touchpad" "libinput Natural Scrolling Enabled" 1

# Clipmenu
systemctl --user import-environment DISPLAY
clipmenud &

# Night mode
# LA
redshift -l 34.05223:-118.24368 -m randr &
# PA
# redshift -l 39.9535743:-75.187736 -m randr &

# Hide mouse
unclutter &
~/.fehbg &
# dwmstatus &
picom -b

# DWM stuff
wmname LG3D
export AWT_TOOLKIT=MToolKit export _JAVA_AWT_WM_NONREPARENTING=1

exec startdwm
