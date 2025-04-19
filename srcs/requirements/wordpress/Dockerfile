FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y less wget php7.4-fpm && \
    wget https://wordpress.org/wordpress-6.8.tar.gz && \
    mkdir -p /var/www/html/ && \
    tar zxf wordpress-6.8.tar.gz && \
    mv -t /var/www/html/ wordpress/* && \
    rm -rf wordpress-6.8.tar.gz wordpress

COPY conf/.inputrc conf/.bashrc /root/
COPY conf/wordpress.conf /

ENTRYPOINT ["tail", "-f", "/dev/null"]