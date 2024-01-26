#!/bin/sh

ID=$(xinput --list | grep -i "touchpad" | awk -F '\t' '{ print substr($2, 4) }')

enabled=$(xinput --list-props $ID | grep "Device Enabled" | awk -F '\t' '{ print $3 }')

#accept one argument -- "enable" or "disable"
if [[ -z $1 ]]; then
    if [[ enabled -eq 0 ]]; then
        xinput enable $ID
        echo "Touchpad enabled"
    else
        xinput disable $ID
        echo "Touchpad disabled"
    fi
else
    if [[ $1 == "enable" ]]; then
        xinput enable $ID
        echo "Touchpad enabled"
    elif [[ $1 == "disable" ]]; then
        xinput disable $ID
        echo "Touchpad disabled"
    else
        echo "Argument not understood - acceptable arguments are [enable] or [disable]"
    fi

fi
