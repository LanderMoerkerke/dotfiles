#!/bin/sh

for file in "/etc/profile" "$HOME/.profile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

xrdb ~/.Xresources

numlockx on

trackpad="SynPS/2 Synaptics TouchPad"

# faster mouse speed
xinput --set-prop $trackpad --type=int --format=8 "Device Accel Profile" "2"

# scrolling both ways
xinput --set-prop $trackpad --type=int --format=8 "Synaptics Two-Finger Scrolling" 1, 1

# natural scrolling
xinput --set-prop $trackpad --type=int --format=32 "Synaptics Scrolling Distance" -100, -100

keyboard-setup

exec i3
