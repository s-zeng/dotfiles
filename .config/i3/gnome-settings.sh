#!/usr/bin/env sh

# Terminate already running bar instances
killall -q gnome-settings-daemon

# Wait until the processes have been shut down
while pgrep -x gnome-settings-daemon >/dev/null; do sleep 1; done

gnome-settings-daemon
