FROM debian:oldstable

COPY conf/.inputrc conf/.bashrc /root/
COPY conf/wordpress.conf /
COPY conf/script.sh /script.sh

RUN apt-get update && \
    apt-get install -y wget php7.4-fpm php-mysql mariadb-client && \
    chmod +x /script.sh 

ENTRYPOINT ["/script.sh"]