#!/bin/sh
IP=$(ifconfig wlan0 | grep "inet addr" | sed "s/.*addr:\([^\ ]*\).*/\1/")
if [ -n "$IP" ]; then
    echo "Connect is present $IP"
    CONNECT_ERROR="0"
else
    echo "Connect isn't present"
    CONNECT_ERROR=$(cat /radio_router/cgi-bin/db/connect_error)
    let CONNECT_ERROR=$CONNECT_ERROR+1     
fi
CLIENT_WIFI=$(uci -q get wireless.@wifi-iface[1])                 
if [ -z $CLIENT_WIFI ] 
then 
  CONNECT_ERROR="0" 
else
  if [ "$CONNECT_ERROR"  -ge "5"   ]                                             
     then                                                            
        uci delete wireless.@wifi-iface[1]                            
        uci commit wireless                          
        /etc/init.d/network restart                  
  fi
fi
echo -n "$CONNECT_ERROR" > /radio_router/cgi-bin/db/connect_error
