#! /usr/bin/env sh

killall -q polybar

# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# HOST=$(cat /etc/hostname)
#
# if [[ $HOST == "sevahoDesktop" ]]; then
#
#     polybar left &
#     polybar mid &
#     polybar right &
#
# # elif xrandr | grep HDMI; then
# #
# #     polybar mybar &
# #     polybar mybar-right &
# #
# else
#
#     # polybar mybar &
#     polybar bar &
#
# fi

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar &
  done
else
  polybar --reload bar &
fi
echo "Bars launched"
