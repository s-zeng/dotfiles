#!/usr/bin/env sh

# Terminate already running bar instances
killall -q nm-applet 

# Wait until the processes have been shut down
while pgrep -x nm-applet >/dev/null; do sleep 1; done

# Launch polybar
nm-applet
