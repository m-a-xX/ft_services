FROM alpine:latest

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz \
    && tar -zxvf grafana-7.3.2.linux-amd64.tar.gz

RUN	mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY files/start.sh /start.sh

EXPOSE 3000

ENTRYPOINT sh start.sh