FROM alpine:latest

RUN apk add influxdb
RUN apk add openrc

RUN influxd </dev/null &>/dev/null & \
    sleep 5 && \
    influx -execute "CREATE USER admin WITH PASSWORD 'password' WITH ALL PRIVILEGES;" && \
    influx -execute "CREATE DATABASE telegraf;" && \
    influx -execute "CREATE USER telegraf_user WITH PASSWORD 'password';" && \
    influx -execute "GRANT ALL ON telegraf TO telegraf_user;"


COPY files/start.sh /start.sh

EXPOSE 8086

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY files/telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT sh /start.sh