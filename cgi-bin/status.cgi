#!/bin/sh
echo "Content-type: text/html"
echo 
DIR_START="$(dirname "$SCRIPT_FILENAME")"
SOUND_VOL=`cat ${DIR_START}/db/sound_vol`
URL_PLAYED=`ps -w | grep wget | grep -m 1 -v grep | sed "s/.* \(.*\)/\\1/"`
#echo SOUND_VOL
echo '{';
echo "\"sound\": \"$SOUND_VOL\"",
echo "\"mute\": \"$SOUND_MUTE\"",
echo "\"played\": \"$URL_PLAYED\""
echo '}'