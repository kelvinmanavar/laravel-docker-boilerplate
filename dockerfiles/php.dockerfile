FROM php:8.0.20RC1-fpm-alpine3.16

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN apk add --no-cache libpng libpng-dev jpeg-dev

RUN docker-php-ext-configure gd --enable-gd --with-jpeg
RUN docker-php-ext-install gd

RUN docker-php-ext-install exif

RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

RUN docker-php-ext-install pdo pdo_mysql
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]