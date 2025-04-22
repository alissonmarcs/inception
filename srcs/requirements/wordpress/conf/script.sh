#!/bin/bash

if grep  -q "database_name_here" /var/www/html/wp-config.php
then
    export $(cat /run/secrets/db_credentials)
    sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php
    sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php
    sed -i "s/password_here/$DB_USER_PASS/" /var/www/html/wp-config.php
    sed -i "s/localhost/mariadb/" /var/www/html/wp-config.php
fi
exec php-fpm7.4 -F --fpm-config /wordpress.conf