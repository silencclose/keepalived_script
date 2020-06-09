#!/bin/bash 

nginx_status=`/home/redis/redis-5.0.5/src/redis-cli -h 127.0.0.1 PING` 
if [ "$nginx_status" == "PONG" ];then
    echo $nginx_status 
    exit 0 
else
    echo $nginx_status
    systemctl stop keepalived
    exit 1 
fi
