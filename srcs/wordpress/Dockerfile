FROM alpine:latest

RUN apk --no-cache add curl wget php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom nginx mysql-client

ENV WORDPRESS_VERSION 5.5.1
ENV WORDPRESS_SHA1 d3316a4ffff2a12cf92fde8bfdd1ff8691e41931

RUN mkdir /var/www/html/

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& tar -xzf wordpress.tar.gz -C /var/www/html/ \
	&& rm wordpress.tar.gz \    
	&& chown -R nobody.nobody /var/www/html/wordpress

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/wp-config.php /var/www/html/wordpress

EXPOSE 5050

COPY files/start.sh /start.sh

ENTRYPOINT sh /start.sh
