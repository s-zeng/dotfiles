#!/usr/bin/env sh

# Terminate already running bar instances
killall -q feh 

# Wait until the processes have been shut down
while pgrep -x feh >/dev/null; do sleep 1; done

# Launch polybar
feh --bg-scale ~/Downloads/aesthetic.jpg

