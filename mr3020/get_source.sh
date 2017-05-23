#!/bin/sh
git clone -b barrier_breaker git://github.com/openwrt/openwrt.git
cd openwrt
mkdir  dl
cd dl
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.10.49.tar.xz
wget https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.1.tar.xz
cd ..
./scripts/feeds update -a
./scripts/feeds install alsa-utils
./scripts/feeds install madplay
./scripts/feeds install wget
rm -rf openwrt/.config
ln -s ../.config openwrt/.config
ln -s ../files openwrt/files
