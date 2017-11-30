#!/bin/sh
IP=192.168.100.45
scp -r root@$IP:/radio_router ./files/
scp -r root@$IP:/etc/crontabs/root ./files/etc/crontabs/
scp -r root@$IP:/etc/init.d/radio ./files/etc/init.d/
