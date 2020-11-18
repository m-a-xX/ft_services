#!/bin/sh

mkdir -p /run/mysqld
sed -i 's/^.*auth_pam_tool_dir.*$/#auth_pam_tool_dir not exists/' /usr/bin/mysql_install_db

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf > /dev/null

  /usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --console --user=root --bootstrap << EOF
    CREATE DATABASE wordpress;
    CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
    GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_pass' WITH GRANT OPTION;
    CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
    GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF
  /usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --console --user=root --bootstrap < /wordpress.sql
fi

telegraf &
exec /usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --user=root --console