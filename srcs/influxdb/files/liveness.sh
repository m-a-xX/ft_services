#!/bin/sh

ret=$(ps | grep influxd | sed '/grep influxd/d' | wc -l)
if [ $ret = 1 ]
then
	exit 0
else
	exit 1
fi