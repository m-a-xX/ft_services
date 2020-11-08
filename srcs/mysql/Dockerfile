FROM alpine:latest

RUN apk add mariadb mariadb-client openrc

COPY files/wordpress.sql /wordpress.sql
COPY files/start.sh /start.sh

EXPOSE 3306

CMD [ "/bin/sh", "/start.sh" ]