#!/bin/sh

switch=$(amixer sget Master | awk -F"[" '/Left:/ { print $NF }' | sed 's/\]//')

icon="🔇 "

[[ $switch = "on" ]] && icon="🔊 " 

echo $icon
