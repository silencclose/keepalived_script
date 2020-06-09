#!/bin/bash
flag=$(systemctl status kube-apiserver &> /dev/null;echo $?)
if [[ $flag != 0 ]];then
        echo "kube-apiserver is down,close the keepalived"
        systemctl stop keepalived
fi
