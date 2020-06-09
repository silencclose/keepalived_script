#!/bin/bash
haproxyrun=`ps -C haproxy --no-header |wc -l`
if [ $haproxyrun -eq 0 ];then
    echo "`date` haproxy is dead"
	su - haproxy<<EOF
        /home/haproxy/haproxy-2.0.5/sbin/haproxy -f /home/haproxy/haproxy-2.0.5/haproxy.cfg
EOF
    sleep 2
    if [ `ps -C haproxy --no-header |wc -l` -eq 0 ];then
        echo "`date` haproxy cannot start" 
	systemctl stop keelalived
fi
