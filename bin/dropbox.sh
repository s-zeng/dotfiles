#!/usr/bin/env sh

# Terminate already running bar instances
killall -q dropbox 

# Wait until the processes have been shut down
while pgrep -x dropbox >/dev/null; do sleep 1; done

# Launch polybar
dropbox start
