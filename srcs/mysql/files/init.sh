#!/bin/sh

until mysql
do
	echo "Waiting..."
done

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_pass' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --password=  < /wordpress.sql