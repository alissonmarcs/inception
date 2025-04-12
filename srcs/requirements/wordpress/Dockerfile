FROM debian:oldstable

RUN apt-get update && apt-get install -y man vim less netcat-openbsd wget php7.4-fpm procps

COPY conf/.inputrc conf/.bashrc /root/
# COPY conf/wordpress.conf /etc/php/7.4/fpm/
COPY conf/wordpress.conf /

ENTRYPOINT ["bash"]