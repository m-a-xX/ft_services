FROM alpine

RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN mkdir /run/nginx/

COPY files/nginx.conf /etc/nginx/nginx.conf

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN apk add openssh
RUN rm  -rf /tmp/* /var/cache/apk/*
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -A
RUN adduser -D ssh-user
RUN echo 'ssh-user:ssh-pwd' | chpasswd
COPY files/sshd_config /etc/ssh/sshd_config
EXPOSE 80 443 22

COPY files/start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT sh /start.sh