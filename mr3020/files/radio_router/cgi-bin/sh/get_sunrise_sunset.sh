#!/bin/sh
SUNRISE=`wget -q -O - "http://if.limit.com.ua/sun.php?rise"`
SUNSET=`wget -q -O - "http://if.limit.com.ua/sun.php?set"`
LEN=`echo -n $SUNRISE$SUNSET | wc -L`
if [  "$LEN" != "10" ]; then
   echo "error time from server"
   exit  
fi
CRONFILE="/etc/crontabs/root"
sed -i '/alarm_stop/d' $CRONFILE
sed -i '/alarm_play/d' $CRONFILE
echo "$SUNSET * * * /radio_router/cgi-bin/sh/alarm_stop.sh > /dev/null 2>&1 #`date`" >> $CRONFILE
echo "$SUNRISE * * * /radio_router/cgi-bin/sh/alarm_play.sh > /dev/null 2>&1 #`date`" >> $CRONFILE
