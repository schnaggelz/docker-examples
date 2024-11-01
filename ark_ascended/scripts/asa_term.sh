#!/bin/bash

if ! command -v rcon-cli 2>&1 >/dev/null
then
    echo "rcon-cli could not be found"
    exit 1
fi

RCONOUT_SAVEWORLD=$(rcon-cli --host $ARK_RCONHOST --port $ARK_RCONPORT --password $ARK_ADMINPASSWORD "saveworld" 2>&1)

echo "$RCONOUT_SAVEWORLD"

RCONOUT_DOEXIT=$(rcon-cli --host $ARK_RCONHOST --port $ARK_RCONPORT --password $ARK_ADMINPASSWORD "doexit" 2>&1)

sleep 5

if [ -f "$SERVER_PIDFILE" ]; then
    PROCID=$(cat "$SERVER_PIDFILE")
    if ps -p $pid >/dev/null 2>&1; then
        echo "Error: ARK server process (PID: $PROCID) is still running!"
        exit 1
    else
        echo "Server process (PID: $PROCID) stopped as expected."
    fi
else
    echo "Error: PID file not found."
    exit 1
fi

exit 0
