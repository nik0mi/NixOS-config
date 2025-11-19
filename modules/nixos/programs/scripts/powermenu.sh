#!/usr/bin/env bash

SELECTION="$(printf "Shutdown\nReboot\nSuspend\nLogout" | fuzzel --dmenu --lines=4)" || exit 0 

case $SELECTION in
	*"Shutdown")
		systemctl poweroff;;
	*"Reboot")
		systemctl reboot;;
	*"Suspend")
		systemctl suspend;;
  *"Log out (Niri)")
		niri msg action quit;;
esac
