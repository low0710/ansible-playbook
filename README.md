This script using ansible playbook to setup MySQL Database and keepalived setup 
 
 Require Tool:
 Ansible install in your machine 
 
 Setup SSH with server
 - ssh-keygen 
 - sudo ssh-keygen
 
 Add the connection
- export REMOTE_USER=appadmin
- export REMOTE_IP=x.x.x.x
- ssh-copy-id ${REMOTE_USER}@${REMOTE_IP}
- sudo ssh-copy-id ${REMOTE_USER}@${REMOTE_IP}

Run the command to install MySQL into server 
- ansible-playbook -i enviroment/nec-dbsen/inventory --become mysql_master.yml

File need to update before execute :
1. inventory
2. allUpd
3. mysql_user.sh ( Change the root user password )
4. replica.sh ( Chnage the replica user login )

After run the script , you need manually setup the slave server :
1. Access into master serevr > login into Mysql command line> show Master status\G;
2. Record the 'File' $ 'Position' value.
3. Access into slave server > login into Mysql command line 
4. Stop slave;
5. CHANGE MASTER TO MASTER_HOST='192.168.121.59',MASTER_USER='replica',MASTER_PASSWORD='replica_password',MASTER_LOG_FILE='mysql-bin.000001',MASTER_LOG_POS=1427; 
6. Once done , you can check the slave status > show slave status\G;



