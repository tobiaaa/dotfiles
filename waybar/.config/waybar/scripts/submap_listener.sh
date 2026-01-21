#!/bin/bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

while [ ! -S "$SOCKET" ]; do
    sleep 0.1
done

socat -u UNIX-CONNECT:$SOCKET - | while read -r line; do
    if [[ $line =~ ^submap\>\>(.*)$ ]]; then
        submap="${BASH_REMATCH[1]}"
        if [ -z "$submap" ]; then
            echo '{"text": "", "class": "normal"}'
        else
            echo "{\"text\": \"[$submap]\", \"class\": \"submap\"}"
        fi
    fi
done
