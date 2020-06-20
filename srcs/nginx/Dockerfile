FROM alpine

RUN apk update
RUN apk add nginx
RUN mkdir /run/nginx/

COPY files/nginx.conf /etc/nginx/nginx.conf
#COPY files/index.html /var/lib/nginx/html

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt


EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]