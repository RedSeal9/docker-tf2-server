#!/bin/sh
cd $HOME
./update.sh
srcds_run -game tf -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/tf2_ds.txt $@
