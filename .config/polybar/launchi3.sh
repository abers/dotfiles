#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c ~/.config/polybar/config_i3 & 
polybar main2 -c ~/.config/polybar/config_i3 & 
