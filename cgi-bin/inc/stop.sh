#tokill=`ps -w|grep playlist.sh |awk '{ printf $1" "}'`; kill $tokill;
#echo -n "stop" > /www/cgi-bin/db/command_last
killall wget
killall madplay
