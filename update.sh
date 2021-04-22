#!/bin/sh
cd "$SERVER" || exit 1
"$SCMD"/steamcmd.sh +runscript "$SERVER"/tf2_ds.txt
