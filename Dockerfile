FROM php:7.4-fpm-alpine
LABEL Author="prxgomes@gmail.com, lclinhares@hotmail.com" \
      Description="Mibew messenger"

ENV MIBEW_VERSION=3.2.7

WORKDIR /var/www/html/

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && apk update && apk upgrade \
    && apk add nginx supervisor wget msmtp ca-certificates libxml2 openssl zlib-dev libzip-dev libpng-dev openrc \
    && wget https://master.dl.sourceforge.net/project/mibew/core/${MIBEW_VERSION}/mibew-${MIBEW_VERSION}.tar.gz \
    && tar -zxvf mibew-${MIBEW_VERSION}.tar.gz \
    && wget https://master.dl.sourceforge.net/project/mibew/i18n/pt-br/3.2.7/mibew-i18n-pt-br-3.2.7-20200709.tar.gz \
    && tar -zxvf mibew-i18n-pt-br-3.2.7-20200709.tar.gz -C /var/www/html/mibew/locales/ \
    && rm -f mibew-${MIBEW_VERSION}.tar.gz mibew-i18n-pt-br-3.2.7-20200709.tar.gz \
    && chown -R www-data:www-data mibew \
    && chmod 0755 mibew \
    && chmod 0700 mibew/files/avatar \
    && chmod 0700 mibew/cache \
    && docker-php-ext-install pdo pdo_mysql gd zip mysqli \
    && mkdir -p /run/nginx \
    && mkdir -p /run/supervisor \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /etc/supervisor/conf.d

COPY config.yml /var/www/html/mibew/configs/

# copy nginx config to container
COPY default_nginx_config_d /etc/nginx/conf.d/default.conf

# supervisor base configuration
COPY supervisor.conf /etc/supervisor.conf

EXPOSE 80/tcp 443/tcp

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
