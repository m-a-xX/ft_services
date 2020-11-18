#!/bin/sh

telegraf &
/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "172.17.0.11"