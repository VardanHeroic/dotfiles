#!/bin/bash

disp="eDP-1"

light -S 0
sleep 5
light -S 0
sleep 0.016
light -S 2.5
sleep 0.016
light -S 5
sleep 0.016
light -S 7.5
sleep 0.016
light -S 10
sleep 0.016
light -S 12.5
sleep 0.016
light -S 15
sleep 0.016
light -S 17.5
sleep 0.016
light -S 20
sleep 0.016
light -S 22.5
sleep 0.016
light -S 25
sleep 0.016
canberra-gtk-play -f /usr/share/sounds/ubuntu/stereo/service-login.ogg &
light -S 27.5
sleep 0.016
light -S 30
sleep 0.016
light -S 32.5
sleep 0.016
light -S 35
sleep 0.016
light -S 37.5
sleep 0.016
light -S 40
sleep 0.016
light -S 42.5
sleep 0.016
light -S 45
sleep 0.016
light -S 47.5
#light -S 50

if [ "$XDG_SESSION_TYPE" = 'wayland' ]
then
	wlsunset -l 40.2 -L 44.5 -t 4500
else
	redshift -l 40.2:44.5
fi
