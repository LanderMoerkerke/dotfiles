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

exec i3
