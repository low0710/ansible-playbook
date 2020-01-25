#!/bin/bash

sudo mkdir -p /root/mysql

cp -R /var/lib/mysql  /root/mysql/

sudo chown mysql:mysql /root/mysql

