FROM debian:oldstable

COPY conf/.inputrc conf/.bashrc /root/
COPY my.cnf /etc/mysql/
COPY script.sh /

RUN apt-get update && \
    apt-get -y install vim less netcat-openbsd mariadb-server && \
    chmod +x /script.sh && \
    mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/

ENTRYPOINT ["/script.sh"]
