#!/bin/sh
echo "Content-type: text/html"
echo
cd cgi-bin
read POST_DATA
POST_DATA=`echo $POST_DATA| sed -e 's/\([()]\)/\\\\\1/g'`
eval $(echo "$POST_DATA"|awk -F'&' '{for(i=1;i<=NF;i++){print $i}}')
ID=`echo -n $id` 
URL=`echo -n $url | sed 's/\%0[dD]//g' |\
   awk '/%/{while(match($0,/\%[0-9a-fA-F][0-9a-fA-F]/))\
     {$0=substr($0,1,RSTART-1)sprintf("%c",0+("0x"substr(\
      $0,RSTART+1,2)))substr($0,RSTART+3);}}{print}'`
#URL=$url
source "inc/stop.sh"

echo -n "$URL" > "db/last_played_url"
echo -n "play" > db/last_played_command
source "inc/play_url.sh"
