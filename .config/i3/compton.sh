#!/usr/bin/env sh

# Terminate already running bar instances
killall -q compton

# Wait until the processes have been shut down
while pgrep -x compton >/dev/null; do sleep 1; done

# Launch polybar
#compton -b -i 0.92 -c -f -z -D 1 -m 0.92 --inactive-opacity-override -r 20 -o 0.5 -t 0 -l 0
compton -b --config ~/.config/compton/config
