#!/bin/bash
mkdir -p $STEAM_COMPAT_DATA_PATH

ARK_EXEFILE="$ARK_APPDIR/Binaries/Win64/ArkAscendedServer.exe"
ARK_LOGFILE="$ARK_SAVEDIR/Logs/ShooterGame.log"

PASSWD_ARGS="ServerPassword=$ARK_PASSWORD?ServerAdminPassword=$ARK_ADMINPASSWORD"
PORT_ARGS="Port=$ARK_SERVERPORT?RCONEnabled=True?RCONPort=$ARK_RCONPORT"
SESSION_ARGS="SessionName=$ARK_SESSIONNAME?MaxPlayers=$ARK_MAXPLAYERS"

if [ -n "$ARK_CLUSTERID" ]; then
    CLUSTER_ARGS="-ClusterId=$ARK_CLUSTERID -ClusterDirOverride=$ARK_SAVEDIR/Clusters/$$ARK_CLUSTERID -NoTransferFromFiltering"
fi

if [ -n "$ARK_MODIDS" ]; then
    MOD_ARGS="-Mods=$ARK_MODIDS"
fi

for OPTARG in ${ARK_EXTRA_OPTARGS//,/ }
do
    EXTRA_OPTARGS="$EXTRA_OPTARGS?$OPTARG"
done

# Check if the server files exist
if [ ! -f "$ARK_EXEFILE" ]; then
    echo "Error: Server executable not found. Please ensure the server is properly installed."
    exit 1
fi

# Run server
bash -c "proton run '${ARK_EXEFILE}' \
    $ARK_MAPNAME?listen?$SESSION_ARGS?$PORT_ARGS?$PASSWD_ARGS$EXTRA_OPTARGS $MOD_ARGS $CLUSTER_ARGS\
    -NoBattlEye" &

PROCID=$!
echo "Server process started with PID: $PROCID"

# Immediate write to PID file
echo $PROCID > $SERVER_PIDFILE
echo "PID $PROCID written to $SERVER_PIDFILE"

# Wait for the server to fully start, monitoring the log file
echo "Waiting for server to start ..."
sleep 5
while true; do
    echo -n "."
    if [ -f "$ARK_LOGFILE" ] && grep -q "Server has completed startup" "$ARK_LOGFILE"; then
        echo "."
        echo "Server started successfully. PID: $PROCID"
        break
    fi
    sleep 2
done

exit 0
