#!/bin/sh

export GDK_SCALE=1.25
export GDK_DPI_SCALE=1.25

slstatus &
picom &
~/.fehbg &
exec dwm
