#!/bin/bash

if [ ! -d /var/lib/mysql/wordpress/ ]
then
    service mariadb start 
    export `cat /run/secrets/db_credentials`
    mariadb << EOF
    CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
    CREATE USER IF NOT EXISTS "$DB_USER"@'%' IDENTIFIED BY '$DB_USER_PASS';
    GRANT ALL ON \`$DB_NAME\`.* TO '$DB_USER'@'%';
    FLUSH PRIVILEGES;
EOF
    service mariadb stop 
fi

exec mysqld_safe