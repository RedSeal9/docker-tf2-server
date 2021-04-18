#!/bin/sh
cd $SERVER
./steamcmd.sh +runscript tf2_ds.txt
cd tf2
chmod +x srcds_run srcds_linux
