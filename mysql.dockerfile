FROM alpine:latest

RUN apk add mariadb mariadb-client openrc

COPY files/wordpress.sql /wordpress.sql

RUN chown -R mysql /var/lib/mysql \
    && chgrp -R mysql /var/lib/mysql \
    && mysql_install_db --user=mysql --ldata=/var/lib/mysql \
    && sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

COPY files/start.sh /start.sh

ENTRYPOINT sh /start.sh