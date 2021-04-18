#!/bin/sh
cd $SERVER
cd tf2
if [ -f ".inst" ]; then
    echo fount .inst, starting game server as normal
    ./srcds_run -game tf  $@
else
    echo did not find .inst, installing tf2 server and restarting script
    cd ..
    ./update.sh && touch tf2/.inst && $0
fi
