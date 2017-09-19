#!/bin/sh
TIME_UPTIME=$(uptime | sed "s/.*up\([^,]*\).*/\1/g" | sed "s/min//g" | sed  "s/[: ]//g")
#let TIME_UPTIME=$TIME_UPTIME-1
#echo $TIME_UPTIME
# -lt  = < 
if [ "$TIME_UPTIME"  -lt "3" ] 
then
    echo "uptime < 3 min"   
    exit;
fi
CONNECT_ERROR=$(cat /radio_router/cgi-bin/db/connect_error)
# -lt  = < 
if [ "$CONNECT_ERROR"  -lt "5"  ] 
then
    echo "time error connect $CONNECT_ERROR < 5"
    exit;
fi
# -lt  = < 
#exit;

TIME_CH_WIFI=$(cat /radio_router/cgi-bin/db/wifi_list_time_change)
TIME_CH_WIFI=`expr $TIME_CH_WIFI + 60`
#set pause 30 sec befor new connect
TIME_NOW=`date +%s`
# if "$TIME_CH_WIFI" >= "$TIME_NOW"
if [ "$TIME_CH_WIFI" -ge "$TIME_NOW" ]
then
   echo -n "wifi changed please wait "
   let OUT=$TIME_CH_WIFI-$TIME_NOW
   echo $OUT
   exit
fi

CLIENT_WIFI=$(uci -q get wireless.@wifi-iface[1])
if [ -z $CLIENT_WIFI ]
  then
  echo -n
  else
    uci delete wireless.@wifi-iface[1]
    uci commit wireless
    /etc/init.d/network restart
   exit;
  fi
