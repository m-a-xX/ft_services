#!/bin/sh

ssdh_ret=$(ps | grep sshd | sed '/grep sshd/d' | wc -l)
nginx_ret=$(ps | grep nginx | sed '/grep nginx/d' | wc -l)
if [ $ssdh_ret = 1 ] && [ $nginx_ret = 2 ]
then
	exit 0
else
	exit 1
fi