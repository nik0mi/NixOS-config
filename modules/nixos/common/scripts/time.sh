#!/bin/bash

echo -e "Time - $(date +%H:%M)\nDate - $(date +%d.%m.%Y)" | fuzzel --dmenu --lines=2 --width=30 --no-icons
