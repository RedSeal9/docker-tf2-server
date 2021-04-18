#!/bin/sh
cd $SERVER
./steamcmd.sh +runscript tf2_ds.txt
ln -s $SERVER/linux32/steamclient.so $USER/.steam/sdk32/steamclient.so
cd tf2
chmod +x srcds_run srcds_linux 