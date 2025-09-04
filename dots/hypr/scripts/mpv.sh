#!/bin/bash

if pgrep -x "mpv" > /dev/null; then
    pkill -x mpv
else
    mpv mpv --playlist=~/Music/ --shuffle --idle=yes --no-video
fi
