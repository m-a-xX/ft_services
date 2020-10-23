FROM alpine:latest

RUN apk add mariadb mariadb-client openrc

EXPOSE 3306

VOLUME [ “/sys/fs/cgroup” ]

COPY files/start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT sh /start.sh