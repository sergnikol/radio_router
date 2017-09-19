#!/bin/sh
#DIR=`dirname $(dirname "$0")`
SCRIPT=$(readlink -f "$0")
DIR=`dirname $(dirname "$SCRIPT")`
#echo $DIR
source $DIR/inc/init.sh


#echo -n `amixer | grep "Limits" | head -1 | sed -r 's/.*?-[^0-9]*([0-9]+)$/\1/'` > $DIR/db/sound_max
