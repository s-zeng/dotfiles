#!/usr/bin/env sh

# Terminate already running bar instances
killall -q blueberry-tray 

# Wait until the processes have been shut down
while pgrep -x blueberry-tray >/dev/null; do sleep 1; done

# Launch polybar
blueberry-tray
