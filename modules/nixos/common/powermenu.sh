#!/usr/bin/env bash

SELECTION="$(printf "Suspend\nLogout\nReboot\nShutdown" | fuzzel --dmenu)" || exit 0 

case $SELECTION in
	*"Suspend")
		systemctl suspend;;
  *"Log out (Niri)")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac
