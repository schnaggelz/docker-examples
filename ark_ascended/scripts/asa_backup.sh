#!/bin/bash

ARK_WORLDDIR="$ARK_SAVEDIR/SavedArks/$ARK_MAPNAME"
ARK_BACKUP="$ARK_SAVEDIR/SavedArks/Backup/$ARK_MAPNAME-$(date +"%d-%m-%Y").7z"

if ! command -v 7z 2>&1 >/dev/null
then
    echo "7zip could not be found"
    exit 1
fi

if [ -f "$SERVER_PIDFILE" ]; then
    PROCID=$(cat "$SERVER_PIDFILE")
    if ps -p $pid >/dev/null 2>&1; then
        echo "Error: Backup cannot be done because ARK server process (PID: $PROCID) is still running!"
        exit 1
    fi
fi

7z a "$ARK_BACKUP" "$ARK_WORLDDIR"

