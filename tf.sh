#!/bin/sh
cd $SERVER
cd tf2
if [ -f ".inst" ]; then
    echo fount .inst, starting game server as normal
    ./srcds_run -game tf -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/tf2_ds.txt $@
else
    echo did not find .inst, installing tf2 server and restarting script
    cd ..
    ./update.sh && touch tf2/.inst && $0
fi
