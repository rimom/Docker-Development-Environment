
FROM php:8.0-fpm

RUN apt-get update -y \
        && apt-get install -y nano \
        wget \
        mariadb-client \
        sudo

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install json