FROM debian:oldstable

RUN apt-get update && apt-get install -y man nginx vim less netcat-openbsd procps openssl

COPY conf/.inputrc conf/.bashrc /root/

ENTRYPOINT ["bash"] 