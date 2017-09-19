# radio_router
install empty firmwre openwrt from glinet

cd /tmp
wget http://www.gl-inet.com/firmware/6416/clean/openwrt-clean-gl-inet-6416-1.0.bin
sysupgrade -n -v openwrt-clean-gl-inet-6416-1.0.bin


opkg update
opkg install kmod-usb-audio
opkg install alsa-utils
opkg install madplay
opkg install wget

