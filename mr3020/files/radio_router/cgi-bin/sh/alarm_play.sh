#!/bin/sh
amixer set Speaker 4
PID=`ps | grep madplay | grep -v grep | wc -l | awk '{ print $1 }'`
SCRIPT=$(readlink -f "$0")
DIR_START=`dirname $(dirname "$SCRIPT")`
#DIR_START=`dirname $(dirname "$0")`
echo -n "play" > $DIR_START/db/last_played_command
COMMAND_LAST=`/bin/cat ${DIR_START}/db/last_played_command`
if [ "$PID" -eq "0" ] && [ "$COMMAND_LAST" = "play" ]; then
        source "${DIR_START}/inc/stop.sh"
        URL=`/bin/cat "${DIR_START}/db/last_played_url"`
        source "${DIR_START}/inc/play_url.sh"
fi
