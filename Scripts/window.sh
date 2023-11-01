#!/bin/bash
#if  xdotool getactivewindow > /dev/null 2>&1; then
#	class=$(xdotool getactivewindow getwindowclassname); echo ${class^}
#else
#	echo Desktop
#fi

if  xdotool getactivewindow getwindowclassname > /dev/null 2>&1; then
	echo Desktop
fi
