FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx vim less

COPY conf/.inputrc conf/.bashrc /root/

EXPOSE 80
 
ENTRYPOINT ["bash"] 