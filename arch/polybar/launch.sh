#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

while pgrep -x polybar >/dev/null; do
	sleep 1
done

if [[ $(xrandr -q | grep 'VGA-1 connected') ]]; then
  MONITOR=VGA-1 polybar left -r &
fi

MONITOR=DVI-D-1 polybar left 2>~/.config/polybar/left.log &
MONITOR=DVI-D-1 polybar right 2>~/.config/polybar/right.log &
MONITOR=DVI-D-1 polybar middle 2>~/.config/polybar/middle.log &


echo "Bars launched..."
