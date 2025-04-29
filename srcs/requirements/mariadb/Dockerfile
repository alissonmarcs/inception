FROM debian:oldstable

COPY conf/my.cnf /etc/mysql/
COPY conf/script.sh /

RUN apt-get update && \
    apt-get -y install mariadb-server && \
    chmod +x /script.sh && \
    mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/

ENTRYPOINT ["/script.sh"]
