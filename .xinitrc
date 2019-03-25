#!/bin/sh

for file in "/etc/profile" "$HOME/.profile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

xrdb ~/.Xresources

numlockx on

xset -b
xset r rate 200 50

# faster mouse speed
xinput --set-prop 12 --type=int --format=8 "Device Accel Profile" "2"

# scrolling both ways
xinput --set-prop 12 --type=int --format=8 "Synaptics Two-Finger Scrolling" 1, 1

# natural scrolling
xinput --set-prop 12 --type=int --format=32 "Synaptics Scrolling Distance" -100, -100

# Map the caps lock key to super...
setxkbmap -option caps:super

# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'

exec i3
