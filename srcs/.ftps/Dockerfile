FROM alpine

RUN apk update
RUN apk add vsftpd
RUN apk add openssl
RUN rm  -rf /tmp/* /var/cache/apk/*

RUN adduser -D ftp-user
RUN echo 'ftp-user:ftp-pwd' | chpasswd
RUN mkdir /home/ftp-user/ftp
RUN chown nobody:nogroup /home/ftp-user/ftp
RUN chmod a-w /home/ftp-user/ftp
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

EXPOSE 21 20

COPY files/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY files/start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT sh /start.sh
