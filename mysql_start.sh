#!/bin/sh

telegraf &
/usr/bin/mysqld --defaults-file=/etc/my.cnf.d/mariadb-server.cnf --user=root --console &
if [ ! -d /var/lib/mysql/mysql ]; then
  mysql --user=root -e "CREATE DATABASE wordpress;" \
  mysql --user=root -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_pass';" \
  mysql --user=root -e "GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_pass' WITH GRANT OPTION;" \
  mysql --user=root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'password';" \
  mysql --user=root -e "GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" \
  mysql --user=root -e "FLUSH PRIVILEGES;" \
  mysql --user=root wordpress < /wordpress.sql
fi
