#!/bin/bash

if ! command -v rcon-cli 2>&1 >/dev/null
then
    echo "rcon-cli could not be found"
    exit 1
fi

if [ -f "$SERVER_PIDFILE" ]; then
    PROCID=$(cat "$SERVER_PIDFILE")
    if ! ps -p $pid >/dev/null 2>&1; then
        echo "Error: Backup cannot be done because ARK server process (PID: $PROCID) is still running!"
        exit 1
    fi
fi

rcon-cli --host $ARK_RCONHOST --port $ARK_RCONPORT --password $ARK_ADMINPASSWORD "saveworld"
