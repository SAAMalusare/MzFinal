FROM php:7.2.1-fpm

LABEL maintainer "Suhas malusare <suhas.malusare@gmail.com>"

RUN docker-php-ext-install pdo pdo_mysql
ADD ./src /var/www/html
ADD ./public /var/www/public
