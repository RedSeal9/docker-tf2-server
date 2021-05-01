#!/bin/sh
<<<<<<< HEAD
cd $SERVER
./steamcmd.sh +runscript $SERVER/tf2_ds.txt
=======
cd "$SERVER" || exit 1
"$SCMD"/steamcmd.sh +runscript "$SERVER"/tf2_ds.txt
>>>>>>> 9a477424b974a7d64542677d6000681901c43483
