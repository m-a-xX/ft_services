FROM alpine:latest

RUN apk update
RUN apk add --no-cache mariadb mariadb-client

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

COPY files/wordpress.sql /wordpress.sql
COPY files/start.sh /start.sh
COPY files/init.sh /init.sh

RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT sh /start.sh