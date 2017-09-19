#!/bin/sh
/etc/init.d/network restart
sleep 15
/radio_router/cgi-bin/sh/cron_play.sh
