#!/bin/sh

# Run the standard key-bindings, such as remapping right control
# echo "===== running xmodmap non-emoji config ====="
# xmodmap ~/.Xmodmap

# Compile the emoji map into a temp file and execute that with xmodmap
# echo "===== compiling xmodmap emoji config ====="
# ~/.config/emoji/emoji-mod.py ~/.config/emoji/emoji.conf > /tmp/xmodmap-emoji
# echo "===== running xmodmap emoji config ====="
# xmodmap /tmp/xmodmap-emoji

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Make sure that my webcam always focusses on me
v4l2-ctl -c focus_auto=0
v4l2-ctl -c focus_absolute=10

# Keyboard layout commands
setxkbmap -layout gb -option caps:escape

# Set terminal to alacritty
export $TERMINAL=alacritty

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

nitrogen --restore &
picom &
# HLWM will spawn polybar
exec herbstluftwm
