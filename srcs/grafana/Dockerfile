FROM alpine:latest

COPY files/grafana/ /grafana/
RUN chmod +x /grafana/bin/grafana-server

RUN	mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY files/start.sh /start.sh

EXPOSE 3000

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT sh start.sh