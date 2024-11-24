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
# ~/.fehbg &
dwmstatus &
picom -b
exec startdwm
