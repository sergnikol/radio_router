#!/bin/sh

# for fast WIFI client connect
# APNAME  - change on your
# KEYPHRASE  - change on your
uci set network.wwan=interface
uci set network.wwan.proto=dhcp

uci set firewall.@zone[1].network='wan wan6 wwan'

uci -q delete wireless.@wifi-iface[1]
uci add wireless wifi-iface > /dev/null
uci set wireless.@wifi-iface[-1].ssid=kvitka
uci set wireless.@wifi-iface[-1].key=tiktak247op
uci set wireless.@wifi-iface[-1]=wifi-iface
uci set wireless.@wifi-iface[-1].device=radio0
uci set wireless.@wifi-iface[-1].encryption=psk2
uci set wireless.@wifi-iface[-1].mode=sta
uci set wireless.@wifi-iface[-1].network=wwan

uci commit 

/etc/init.d/firewall reload
/etc/init.d/network reload
