FROM alpine

RUN apk update
RUN apk add --no-cache mariadb mariadb-client

EXPOSE 3306

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

COPY files/my.cnf /etc/mysql/my.cnf
COPY files/wordpress.sql /wordpress.sql
COPY files/start.sh /start.sh

ENTRYPOINT sh /start.sh