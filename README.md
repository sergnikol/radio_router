# radio_router
install empty firmwre openwrt from glinet
```
cd /tmp
wget http://www.gl-inet.com/firmware/6416/clean/openwrt-clean-gl-inet-6416-1.0.bin
sysupgrade -n -v openwrt-clean-gl-inet-6416-1.0.bin
```
```
opkg update
opkg install kmod-usb-audio
opkg install alsa-utils
opkg install madplay
opkg install wget
opkg install git-http
cd /

git clone --depth=1 -b gl6416 https://github.com/sergnikol/radio_router.git

uci set uhttpd.main.listen_http='0.0.0.0:81' 
uci set uhttpd.radio=uhttpd
uci set uhttpd.radio.listen_http='0.0.0.0:80'
uci set uhttpd.radio.home='/radio_router'
uci set uhttpd.radio.cgi_prefix='/cgi-bin'
uci commit uhttpd


cat /radio_router/etc/crontabs/root  >> /etc/crontabs/root

/etc/init.d/cron enable
/etc/init.d/cron restart

ln -s /radio_router/etc/init.d/radio  /etc/init.d/radio 
/etc/init.d/radio enable
/etc/init.d/radio start
```
```
reboot
```
http://IP_YOUR_ROUTER:81
