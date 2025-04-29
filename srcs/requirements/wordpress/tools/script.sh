#!/bin/bash

if ! command -v wp
then
    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
    cd /var/www/html/
    rm -rf ./*
    export $(cat /run/secrets/db_credentials)
    wp --allow-root core download
    wp --allow-root config create  --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=mariadb
    wp --allow-root db create 
    wp --allow-root core install  --url=almarcos.42.fr --title="42 - São Paulo" --admin_user=marcos --admin_password=123a123b --admin_email=alissonmarcos249@gmail.com
    mkdir -p /run/php/
fi
exec php-fpm7.4 -F --fpm-config /wordpress.conf
