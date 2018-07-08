#!/bin/sh
cd cgi-bin
ID=`ifconfig  eth0 | grep HWaddr | awk '{ print $5}' | sed "s/://g"`
CONT=`wget -q -O - "http://top.radio/?dev=$ID"`
if [ -n "$CONT" ]; then 
    echo "Content-type: text/html"
    echo
    echo $CONT
else
    echo "Status: 301 Moved Permanently"
#    echo "Location: /cgi-bin/connect.cgi"
    echo "Content-type: text/html"
    echo
fi
exit;
