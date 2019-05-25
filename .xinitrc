#!/bin/sh

for file in "/etc/profile" "$HOME/.profile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

xrdb ~/.Xresources &

numlockx on &

# keybindings
sxhkd &

# faster mouse speed
xinput --set-prop "SynPS/2 Synaptics TouchPad" --type=int --format=8 "Device Accel Profile" "2" &

# scrolling both ways
xinput --set-prop "SynPS/2 Synaptics TouchPad" --type=int --format=8 "Synaptics Two-Finger Scrolling" 1, 1 &

# natural scrolling
xinput --set-prop "SynPS/2 Synaptics TouchPad" --type=int --format=32 "Synaptics Scrolling Distance" -100, -100 &

keyboard-setup &

# appearance
compton -f --config ~/.config/compton/compton.conf -b &
feh --bg-fill $HOME/Pictures/bg.jpg &
redshift -l 51.01:4.03 &
variety &

# notifications
/usr/lib/kdeconnectd &
battery-popup -L 20 -n -i $HOME/Pictures/Notifications/low-battery.png &

xss-lock -l -- lockscreen &
udiskie &

exec i3
# exec dwm
