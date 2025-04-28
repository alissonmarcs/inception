FROM debian:oldstable

COPY conf/.inputrc conf/.bashrc /root/
COPY conf/wordpress.conf /etc/nginx/conf.d/

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/private-key.key \
	-out /etc/ssl/certs/cert-self-signed.crt \
	-subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/OU=Student/CN=almarcos.42.fr" && \
	rm /etc/nginx/sites-enabled/default

ENTRYPOINT ["nginx", "-g", "daemon off;"] 