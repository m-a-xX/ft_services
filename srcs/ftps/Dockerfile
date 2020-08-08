FROM alpine:latest

RUN apk upgrade && \
    printf '%s\n' \
      '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
      >> /etc/apk/repositories && \
    apk update && \
	apk add openssl && \
    apk add pure-ftpd@testing="1.0.49-r1" && \
    rm -rf /var/cache/apk/*

RUN openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Paris/O=Com 42/CN=maxxx" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem && \
	chmod 600 /etc/ssl/private/pure-ftpd.pem

RUN	mkdir -p /ftps/ftp-user && \
	adduser -h /ftps/ftp-user -D ftp-user && \
	echo "ftp-user:ftp-pwd" | chpasswd

COPY files/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 21 21000

ENTRYPOINT sh /start.sh