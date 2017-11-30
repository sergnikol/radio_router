#!/bin/sh
SCRIPT=$(readlink -f "$0")
DIR_START=`dirname $(dirname "$SCRIPT")`
echo -n "stop" > $DIR_START/db/last_played_command
source "${DIR_START}/inc/stop.sh"
