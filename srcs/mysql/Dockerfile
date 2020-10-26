FROM alpine:latest

RUN apk add mariadb mariadb-client openrc

VOLUME [ “/sys/fs/cgroup” ]

COPY files/wordpress.sql /wordpress.sql

COPY files/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3306

ENTRYPOINT sh /start.sh