#!/bin/bash
pass=Esupp-1234
slave_IP=192.168.1.120
slave_pass=Replica@123
expect <<EOF
spawn mysql -uroot -p
expect "password"
send "${pass}\n"
expect "mysql>" 
send "CREATE USER 'replica'@'${slave_IP}' IDENTIFIED BY \"${slave_pass}\";\n"
expect "mysql>" 
send "GRANT REPLICATION SLAVE ON *.* TO 'replica'@'${slave_IP}';\n"
expect "mysql>" 
send "flush privileges;\n"
expect eof
EOF