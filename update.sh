#!/bin/bash
cd $SERVER
./steamcmd.sh \
+login anonymous \
+force_install_dir $SERVER/tf2 \
+app_update 232250 \
+quit \
