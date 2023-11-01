#!/usr/bin/env bash

date=$(date +"%A %d %B %Y %n%T")
icon=$(exec sh ~/.config/conky/Mimosa/scripts/weather-text-icon)
temp=$(cat ~/.cache/weather.json | jq '.main.feels_like' | awk '{print int($1+0.5)}' )
name=$(cat ~/.cache/weather.json | jq -r '.name')


weather=$(cat ~/.cache/weather.json | jq -r '.weather[0].description' | sed "s|\<.|\U&|g")
speed=$(cat ~/.cache/weather.json | jq '.wind.speed')
humd=$(cat ~/.cache/weather.json | jq '.main.humidity')
#source ~/.config/nwg-wrapper/termout.sh

echo "<span foreground='#fcfcfc' size='35000' font='feather' >$icon <span font='Bebas Neue'>$temp°C</span></span>"
echo "<span foreground='#fcfcfc' size='35000' font='Bebas Neue' >$date</span>"


