# radio_router
15.05 webradio 3020 not working
На 14.07 working!!!
```
git clone -b barrier_breaker git://github.com/openwrt/openwrt.git
cd openwrt
mkdir dl
cd dl
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.10.49.tar.xz
wget https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.1.tar.xz
cd ..
./scripts/feeds update -a
./scripts/feeds install alsa-utils 
./scripts/feeds install madplay 
./scripts/feeds install wget

```
Make menuconfig

Target Profile (TP-LINK TL-MR3020)  --->

Global build settings->Enable IPv6 support in packages->< >
Global build settings->Remove ipkg/opkg status data files in final images->[*]

Base system->busybox->Networking utilities->Enabled IPv6 support< >

Base system->busybox->Networking utilities->wget< >

Base system->opkg->< >

Network->File Transfer ->wget-nossl<*>

Network->Web Servers/Proxies->uhttpd-><*>

Network->odhcp6c->< >

Network->ppp->< >

Kernel modules->Netfilter Extensions->kmod-ip6tables< >

//Kernel modules->Netfilter Extensions->kmod-nf-ipt6 < >

//Kernel modules->Netfilter Extensions->kmod-nf-conntrack6 < >

Kernel modules->Network support -> kmod-ipv6->< >

Kernel modules->Network support -> kmod-ppp->< >

Kernel modules -> Sound Support->kmod-sound-core-><*>

Kernel modules -> Sound Support->kmod-usb-audio-><*>

Libraries->Firewall->libip6tc< >

Sound->madplay-><*>

Utilities->alsa-utils-><*>
