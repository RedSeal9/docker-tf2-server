#!/bin/bash
cd $SERVER
cd tf2
if [ -f ".inst" ]; then
    echo fount .inst, starting game server as normal
args=$(eval echo $@)
    ./srcds_run -game tf  $args
else
    echo did not find .inst, installing tf2 server and restarting script
    cd ..
    ./update.sh && touch tf2/.inst && $0 $@
fi
