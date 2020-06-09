#!/bin/bash
MYSQL_HOST=127.0.0.1
MYSQL_USER=root
MYSQL_PASSWORD=rootpassword
CHECK_TIME=3
#MYSQL_STATUS=1 mysql running;MYSQL_STATUS=0 mysql shutdown
MYSQL_STATUS=1
function check_mysql_helth (){
    $MYSQL -h $MYSQL_HOST -u $MYSQL_USER -p${MYSQL_PASSWORD} -e "show status;" >/dev/null 2>&1
    if [ $? = 0 ] ;then
    MYSQL_STATUS=1
    else
    MYSQL_STATUS=0
    fi
    return $MYSQL_STATUS
}
while [ $CHECK_TIME -ne 0 ]
do
    let "CHECK_TIME -= 1"
    check_mysql_helth
if [ $MYSQL_STATUS = 1 ] ; then
    CHECK_TIME=0
    exit 0
fi
if [ $MYSQL_OK -eq 0 ] &&  [ $CHECK_TIME -eq 0 ]
then
	systemctl stop keepalived
    exit 1
fi
sleep 1
done