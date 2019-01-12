#!/usr/bin/env sh

# Terminate already running bar instances
if pgrep -x redshift >/dev/null; then
    sleep 1;
else
    redshift
fi

