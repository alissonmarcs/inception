FROM debian:oldstable

COPY conf/.inputrc conf/.bashrc /root/
COPY conf/wordpress.conf /
COPY conf/script.sh /script.sh

RUN apt-get update && \
    apt-get install -y less wget php7.4-fpm grep php-mysql mariadb-client && \
    wget https://wordpress.org/wordpress-6.8.tar.gz && \
    mkdir -p /var/www/html/ /run/php && \
    tar zxf wordpress-6.8.tar.gz && \
    mv /wordpress/wp-config-sample.php /wordpress/wp-config.php && \
    mv -ft /var/www/html/ wordpress/* && \
    rm -rf wordpress-6.8.tar.gz wordpress && \
    chmod +x /script.sh 

ENTRYPOINT ["/script.sh"]