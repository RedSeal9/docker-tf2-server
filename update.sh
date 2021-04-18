#!/bin/sh
cd $SERVER
$SCMD/steamcmd.sh +runscript tf2_ds.txt
mkdir -p /home/$USER/.steam/sdk32
ln -s $SCMD/linux32/steamclient.so /home/$USER/.steam/sdk32/steamclient.so
cd tf2
chmod +x srcds_run srcds_linux
