#!/bin/sh

muted=$(pacmd list-sinks | awk '/muted/ { print $2 }')

icon=" "

[[ $muted = "yes" ]] && icon= 

echo $icon
