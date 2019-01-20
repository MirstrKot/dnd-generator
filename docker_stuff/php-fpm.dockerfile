FROM php:7.3.1-fpm
RUN apt update
RUN apt install libpq-dev -y \
    && docker-php-ext-install pgsql pdo pdo_pgsql