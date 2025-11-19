#!/usr/bin/env bash

step=0.1

case "$1" in
    up)
        wpctl set-mute @DEFAULT_SINK@ 0
        wpctl set-volume @DEFAULT_SINK@ "${step}+"
        ;;
    down)
        wpctl set-mute @DEFAULT_SINK@ 0
        wpctl set-volume @DEFAULT_SINK@ "${step}-"
        ;;
esac

# Get volume and status and send to mako
volume=$(wpctl get-volume @DEFAULT_SINK@)
vol_value=$(echo "$volume" | awk '{print $2 * 100}')

notify-send -a "volume" -h int:value:"$vol_value" ""
