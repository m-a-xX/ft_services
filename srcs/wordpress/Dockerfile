FROM alpine:latest

RUN apk --no-cache add curl wget php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom nginx mysql-client

RUN mkdir /var/www/html/

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-5.5.3.tar.gz \
	&& tar -xzf wordpress.tar.gz -C /var/www/html/ \
	&& rm wordpress.tar.gz

RUN mv /var/www/html/wordpress/* /var/www/html/

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/wp-config.php /var/www/html/wp-config.php

EXPOSE 5050

COPY files/start.sh /start.sh

ENTRYPOINT sh /start.sh
