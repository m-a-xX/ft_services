#!/bin/sh

if [ ! -d /var/lib/mysql/wordpress ]
then
nohup ./init.sh > /dev/null 2>&1 &
fi

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
telegraf &
if [ ! -d /var/lib/mysql/mysql ]
then
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
fi
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"