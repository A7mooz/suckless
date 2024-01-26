#!/bin/sh

CUSTOM_PROMPT=${1:-"Do you wish to continue? (y/n) "}

YES_TEXT=${2:-"Continuing."}
NO_TEXT=${3:-"Exiting..."}

INVALID_TEXT=${4:-"Invalid response"}

while true; do
    read -p "$CUSTOM_PROMPT" yn
    case $yn in 
        [yY]* ) echo "$YES_TEXT"; break;;
        [nN]* ) echo "$NO_TEXT"; exit 1;;
        * ) echo "$INVALID_TEXT";;
    esac
done