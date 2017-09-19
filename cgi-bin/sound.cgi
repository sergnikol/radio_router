#!/bin/sh
echo "Content-type: text/html"
echo
cd cgi-bin
eval $(echo "$QUERY_STRING"|awk -F'&' '{for(i=1;i<=NF;i++){print $i}}')
source "inc/sound.cgi"
amixer set Speaker $sound
echo -n ${sound} > db/sound_vol
