#!/bin/sh

set -e

ref=$(dirname $(realpath $(dirname $0)))

dirs=($(ls -d $ref/.config/suckless/*/))

for dir in ${dirs[@]}; do
    echo -e "\nCleaning $dir\n"
    cd $dir
    echo "rm -f *.rej"
    rm -f *.rej
    make clean
    [[ -f "config.h" ]] && echo "cp config.h config.def.h" && cp config.h config.def.h
    echo "rm -f config.h"
    rm -f config.h
done