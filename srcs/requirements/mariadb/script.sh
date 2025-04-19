#!/bin/bash

if [ -d /var/lib/mysql/wordpress/ ]
then
    exec mysqld_safe
else
    service mariadb start 
    export $(cat /run/secrets/db_credentials)
    mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
    CREATE USER IF NOT EXISTS "$DB_USER"@'%' IDENTIFIED BY '$DB_USER_PASS';
    GRANT ALL ON \`$DB_NAME\`.* TO '$DB_USER'@'%';
EOF
    service mariadb stop 
    unset -v DB_NAME DB_USER DB_USER_PASS
    exec mysqld_safe
fi
