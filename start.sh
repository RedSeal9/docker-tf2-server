#!/bin/bash
chown -R $USER:$USER $HOME
exec sudo -u $USER $SERVER/tf.sh $@
