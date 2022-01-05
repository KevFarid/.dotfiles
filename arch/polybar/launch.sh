#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

#THEME CONFIG
THEME=abdelr-config
THEME_PATH=~/.config/polybar/$THEME

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar bottom >>/tmp/polybar1.log 2>&1 & disown

if [[ $(xrandr -q | grep 'DVI-D-1 connected') ]]; then
  polybar -c $THEME_PATH main -r >>/tmp/polybar1.log 2>&1 & disown &

  polybar -c $THEME_PATH external -r >>/tmp/polybar2.log 2>&1 & disown &
else
  polybar -c $THEME_PATH only -r >>/tmp/polybar1.log 2>&1 & disown &
fi

echo "Bars launched..."

