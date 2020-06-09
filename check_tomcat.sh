#!/bin/bash  
 
CATALINA_HOME=/home/tomcat/Tomcat8

tomcatPID=`ps -ef|grep ${CATALINA_HOME} |  grep -v "grep"  | awk '{print $2}'`

if [ "$tomcatPID" == "" ]
then  
    su - tomcat <<EOF
    source ~/.bash_profile
    ${CATALINA_HOME}/bin/startup.sh
    echo "===tomcat start ok.==="  
EOF
    sleep 3 
    # check the tomcat status.  
    tomcatnewPID=`ps -ef|grep ${CATALINA_HOME} |  grep -v "grep"  | awk '{print $2}'`
    if [ "${tomcatnewPID}" == "" ]  
    then  
        systemctl stop keepalived
    echo "keepalived has stoped"
    fi  
fi
