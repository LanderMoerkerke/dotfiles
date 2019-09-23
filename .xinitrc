#!/bin/sh

for file in "/etc/profile" "$HOME/.profile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

xrdb ./.Xresources

feh --bg-fill $HOME/Pictures/bg.jpg
xrandr --dpi 100

# keybindings
sxhkd &

trackpad-setup
keyboard-setup &

# appearance
compton -f --config ~/.config/compton/compton.conf -b
redshift -l 51.01:4.03 &
# variety &

# notifications
/usr/lib/kdeconnectd &
battery-popup -L 20 -n -i $HOME/Pictures/Notifications/low-battery.png &

xss-lock -l -- lockscreen &

udiskie &

exec i3
