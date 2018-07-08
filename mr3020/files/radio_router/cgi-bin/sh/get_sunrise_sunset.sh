#!/bin/sh
GPS="&la=48.45&lo=34.98333" #Dnipro
SUNRISE=`wget -q -O - "http://if.limit.com.ua/sun.php?rise${GPS}"`
SUNSET=`wget -q -O - "http://if.limit.com.ua/sun.php?set${GPS}"`
LEN=`echo -n $SUNRISE$SUNSET | wc -L`
if [  "$LEN" != "10" ]; then
   echo "error time from server"
   exit  
fi
CRONFILE="/etc/crontabs/root"
sed -i '/alarm_stop/d' $CRONFILE
sed -i '/alarm_play/d' $CRONFILE

#SUNSET=`echo $SUNSET | sed 's/^0//g' | sed 's/ 0/ /g'`
#SUNRISE=`echo $SUNRISE | sed 's/^0//g' | sed 's/ 0/ /g'`
echo "$SUNSET * * * /radio_router/cgi-bin/sh/alarm_stop.sh > /dev/null 2>&1 #`date`" >> $CRONFILE
echo "#$SUNRISE * * * /radio_router/cgi-bin/sh/alarm_play.sh > /dev/null 2>&1 #`date`" >> $CRONFILE
/etc/init.d/cron restart
