#!/bin/bash
# if mysql is dead in this node, then other node will bind the IP.
MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USERNAME="root"
MYSQL_PASSWORD="Esupp-1234"

mysql --host=$MYSQL_HOST --port=$MYSQL_PORT --user=$MYSQL_USERNAME 
--password=$MYSQL_PASSWORD --connect_timeout=3 -e "select version();"

if [ $? -ne 0 ]; then
 echo "bad"
 exit 1      # mysql node is bad
fi
echo "good"
exit 0       # mysql node is good