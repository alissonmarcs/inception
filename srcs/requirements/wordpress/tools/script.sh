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
    wp --allow-root core install  --url=almarcos.42.fr --title="42 - São Paulo" --admin_user=$ADMIN --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL
    wp --allow-root user create $USER $USER_EMAIL --user_pass=$USER_PASS --role=author
    mkdir -p /run/php/
fi
exec php-fpm7.4 -F --fpm-config /wordpress.conf
