#!/bin/bash

if ! command -v wp
then
    mkdir -p /run/php/
    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
    cd /var/www/html/
    rm -rf ./*
    wp --allow-root core download
    export $(cat /run/secrets/db_credentials)
    wp --allow-root config create  --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=mariadb
    # wp --allow-root db create --path=/var/www/html/
    # wp --allow-root core install  --url=almarcos.42.fr --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org
fi
exec php-fpm7.4 -F --fpm-config /wordpress.conf
