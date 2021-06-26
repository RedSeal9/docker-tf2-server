#!/bin/bash
chown -R $USER:$USER $HOME
exec sudo -E -u $USER $SERVER/run.sh $@
