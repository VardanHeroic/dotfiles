#!/bin/bash
while true
do
sleep 5
pactl move-source-output $(pactl list source-outputs short | grep $(pactl list short clients | grep glava | cut -f 1) | cut -f 1) @DEFAULT_MONITOR@
done
