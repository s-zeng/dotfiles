#!/bin/sh

# Get out of town if something errors
set -e

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )  

if [ "connected" == "$HDMI_STATUS" ]; then  
    /usr/bin/xrandr --output eDP-1 --auto --output HDMI-1 --auto --left-of eDP-1
    /home/kronicmage/.config/i3/polybar.sh
    exit
else  
    /usr/bin/xrandr --output HDMI-1 --off
    /home/kronicmage/.config/i3/polybar.sh
    exit
fi
