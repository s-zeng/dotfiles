#!/usr/bin/env sh

# Terminate already running bar instances
if pgrep -x mopidy >/dev/null; then
    sleep 1;
else
    mopidy
fi

