#!/bin/bash
#
# from : https://gist.github.com/DN-debug/f21c00299a5a076a3afee6de3df38be2 
#
# Getting the data and initializing an array.
BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# Formatting helpers
CHARGE=$((${BATTERY_INFO[3]//%,}))
ICON=""
FORMAT=""

# Battery icon to reflect on the bar.
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]] || [[ "${BATTERY_INFO[2]}" == *"Unknown"* ]] ; then
    ICON="  "
else
    ICON="   "
fi


# Formatting tags https://github.com/polybar/polybar/wiki/Formatting#format-tags
# charging status with same background color
if [[ $CHARGE -lt 10 ]]; then
    FORMAT="%{F#f00}  "
elif [[ $CHARGE -lt 40 ]]; then
    FORMAT="%{F#f00}  "
# elif [[ $CHARGE -lt 60 ]]; then
#     FORMAT="%{B#18181}%{B#8c0a0a0a}  "
elif [[ $CHARGE -lt 100 ]]; then
    FORMAT=" "
fi

# Format charge & color depending on the status.
FORMAT="$FORMAT $ICON $CHARGE%"

# Display on bar
echo $FORMAT



# user_modules.ini
# create a custom module in polybar and link the above script file_name to the module

# [module/battery-da]
# type = custom/script
# exec = ~/.config/polybar/scripts/battery_acpi.sh
# interval = 10
