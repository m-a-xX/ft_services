FROM alpine:latest

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz \
    && tar -zxvf grafana-7.3.2.linux-amd64.tar.gz \
    && rm -rf grafana-7.3.2.linux-amd64.tar.gz

RUN	mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN rm -rf /grafana-7.3.2/conf/ /grafana-7.3.2/data/

COPY files/grafana/data /grafana-7.3.2/data/
COPY files/grafana/conf /grafana-7.3.2/conf/
COPY files/start.sh /start.sh

EXPOSE 3000

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT sh start.sh