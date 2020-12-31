#!/bin/sh

for file in "/etc/profile" "$HOME/.profile"; do
    if [ -f "$file" ]; then
        echo "Loading profile from $file";
        . "$file"
    fi
done

xrdb ./.Xresources &

xwallpaper --stretch $HOME/Pictures/bg.jpg &
xrandr --dpi 100 &

dwmbar-launch &

lf -server &

# keybindings
sxhkd &

trackpad-setup &
keyboard-setup &

# appearance
picom --experimental-backends &
redshift -l 51.01:4.03 &

# notifications
/usr/lib/kdeconnectd &
battery-popup -L 20 -n -i $HOME/Pictures/Notifications/low-battery.png &

xss-lock -l -- lockscreen &

udiskie &

dunst &

urxvtd &

# exec i3
# exec dwm

# exec selectwm -c $XDG_CONFIG_HOME/selectwm/selectwmrc

while true; do
    dwm 2> /tmp/dwm.log
done
