#!/bin/bash

# get monitor name
# echo $(xrandr | grep " connected" | cut -f1 -d " ")
MONITOR=eDP-1
LEVEL=$(xrandr --verbose |grep $MONITOR -A 5 |grep Brightness |grep -o '[0-9].*')

while getopts "h?:m:il" opt; do
    case "$opt" in
    h|\?)
        echo "h"
        exit 0
        ;;
    m)  MONITOR=$2
		LEVEL=$(xrandr --verbose |grep $MONITOR -A 5 |grep Brightness |grep -o '[0-9].*')
        ;;
	i)  INC="+"
		;;
	l)  INC="-"
		;;
    esac
done

LEVEL=$(echo "$LEVEL$INC 0.1" | bc)
echo $LEVEL

# Increment
if [ $(echo "$LEVEL < 0.95" | bc) -eq 1 ] && [ $(echo "$LEVEL > 0.05" | bc) -eq 1 ]
then
	xrandr --output $MONITOR --brightness $LEVEL
fi

# xrandr --output $MONITOR --brightness $LEVEL
