FROM debian:oldstable

COPY conf/wordpress.conf /
COPY tools/script.sh /script.sh

RUN apt-get update && \
    apt-get install -y wget php7.4-fpm php-mysql mariadb-client && \
    chmod +x /script.sh 

ENTRYPOINT ["/script.sh"]