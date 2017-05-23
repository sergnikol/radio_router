#!/bin/sh
echo "Content-type: text/html"
echo
cd cgi-bin
DIR=$(dirname "$0")
source "inc/stop.sh"
echo -n "stop" > $DIR/db/last_played_command