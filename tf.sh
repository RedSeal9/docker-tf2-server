#!/bin/sh
cd $SERVER
./update.sh
srcds_run -game tf -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/tf2_ds.txt $@
