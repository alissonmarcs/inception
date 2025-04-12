FROM debian:oldstable

RUN apt-get update && apt-get -y install vim less netcat-openbsd

COPY conf/.inputrc conf/.bashrc /root/

ENTRYPOINT ["bash"]
