#!/bin/bash
nginxrun=`ps -C nginx --no-header | wc -l`
if [ $nginxrun -eq 0 ]
then
/usr/local/nginx/sbin/nginx -s stop
/usr/local/nginx/sbin/nginx
sleep 3
if [ `ps -C nginx --no-header | wc -l` ]
then
killall keepalived
fi
fi
