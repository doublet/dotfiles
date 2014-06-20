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

# load fonts that are installed in /usr/share/fonts/local (aren't added to font path by default - see Arch wiki)
xset +fp /usr/share/fonts/local
xset fp rehash

# set background
xloadimage -onroot -center ~/Downloads/bank.jpg
xsetroot -cursor_name left_ptr # use a nice cursor instead of the default X
#setxkbmap be # I'm using a Belgian azerty keyboard
setxkbmap -layout dvorak -variant gb # I'm using a britsh dvorak keyboard

# note: the following is commented out because xfce starts that

## start xscreensaver
#/usr/bin/xscreensaver -no-splash &

## launch window manager
#exec xmonad

# launch xfce
exec startxfce4

