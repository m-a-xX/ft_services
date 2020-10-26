FROM alpine:latest

RUN apk update && \
	apk add gnupg nginx php7-fpm php7-common php7-iconv php7-json php7-gd \
	php7-curl php7-xml php7-mysqli php7-imap php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7-session php7-mbstring curl \
	&& mkdir -p /var/www/html/ \
	&& mkdir -p /run/nginx \
	&& rm -f /var/cache/apk/*;


# Copy configuration
COPY files /config

RUN curl https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.xz -o /tmp/phpMyAdmin-5.0.4-all-languages.tar.xz && \
		mkdir /usr/src && \
		mkdir /etc/phpmyadmin/ && \
		mkdir /sessions && \
    tar -xf /tmp/phpMyAdmin-5.0.4-all-languages.tar.xz -C /usr/src && \
    rm -r /tmp/phpMyAdmin-5.0.4-all-languages.tar.xz && \
    mv /usr/src/phpMyAdmin-5.0.4-all-languages /usr/src/phpmyadmin && \
    rm -rf /usr/src/phpmyadmin/setup/ /usr/src/phpmyadmin/examples/ /usr/src/phpmyadmin/test/ /usr/src/phpmyadmin/po/ /usr/src/phpmyadmin/composer.json /usr/src/phpmyadmin/RELEASE-DATE-5.0.4 && \
    sed -i "s@define('CONFIG_DIR'.*@define('CONFIG_DIR', '/etc/phpmyadmin/');@" /usr/src/phpmyadmin/libraries/vendor_config.php && \
		cp -R /usr/src/phpmyadmin/* /var/www/html/ && \
		cp /config/config.inc.php /etc/phpmyadmin/config.inc.php && \
		cp /config/php.ini /etc/php7/php.ini && \
		cp /config/php_fpm_site.conf /etc/php7/php-fpm.d/www.conf && \
		chown -R nobody:nginx /var/www/html /sessions && \
    cp /config/nginx_site.conf /etc/nginx/conf.d/default.conf

EXPOSE 5000

COPY files/start.sh /start.sh

ENTRYPOINT sh /start.sh
