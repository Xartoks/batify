#!/bin/bash

# Config
TMP_FILE="/tmp/batify"

case "$1" in
10 | 15 | 20)
    param=("normal" "battery-caution" "Battery is LOW at $1%")
    ;;
[0-5])
    param=("critical" "battery-empty" "Battery level is CRITICAL at $1%")
    ;;
"unplugged")
    param=("low" "battery-missing" "Charging cable has been unplugged.")
    ;;
"plugged")
    param=("low" "battery-charged" "Charging cable has been plugged.")
    ;;
*)
    param=()
    ;;
esac

if [ ${#param[@]} -ne 0 ]; then
    notify_cmd="notify-send -p -e -u ${param[0]} -i ${param[1]} 'Battery status' '${param[2]}'"
    # Read previous ID if it exists
    if [[ -f "$TMP_FILE" ]]; then
        read REPLACE_ID LAST_STATE <"$TMP_FILE"
        if [[ "$LAST_STATE" != "$1" ]]; then
            notify_cmd="$notify_cmd -r $REPLACE_ID"
            ID=$(eval $notify_cmd)
            echo "$ID $1" >"$TMP_FILE"
        fi

    else
        ID=$(eval $notify_cmd)
        echo "$ID $1" >"$TMP_FILE"
    fi

fi
