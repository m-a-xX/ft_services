#!/bin/sh

openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root << EOF
  CREATE DATABASE wordpress;
  CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_pass' WITH GRANT OPTION;
  CREATE USER 'admin'@'%' IDENTIFIED BY '$ADMIN_PASS';
  GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY '$ADMIN_PASS' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

printf "Database started !\n"

tail -F /dev/null