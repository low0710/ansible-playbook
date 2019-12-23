#!/bin/bash
password_temp=$(grep 'temporary password' /var/log/mysqld.log | awk -F ':' '{print $4;}')
password=${password_temp:1}
newpassword=Esupp-1234
expect <<EOF
spawn mysql -uroot -p
expect "password"
send "${password}\n"
expect "mysql>" 
send "ALTER USER 'root'@'localhost' IDENTIFIED BY \"${newpassword}\";\n"
expect "mysql>" 
send "use mysql;\n"
expect "mysql>" 
send "flush privileges;\n"
expect eof
EOF