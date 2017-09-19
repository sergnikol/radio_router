#!/bin/sh
CONT=`wget -q -O - http://radio-top.net/connect.html 2>&1`
if [ -n "$CONT" ]; then
    echo "Internet is present"
    echo -n "0" > /radio_router/cgi-bin/db/connect_error
else
    echo "Internet isn't present"
    /radio_router/cgi-bin/sh/wifi_reset_client.sh 
    CONNECT_ERROR=$(cat /radio_router/cgi-bin/db/connect_error)
    let CONNECT_ERROR=$CONNECT_ERROR+1     
    echo -n "$CONNECT_ERROR" > /radio_router/cgi-bin/db/connect_error
fi
exit
