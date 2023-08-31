FROM	debian:buster

ENV		DEBIAN_FRONTEND noninteractive

RUN		apt-get update; apt-get install -y nginx openssl

RUN		mkdir -p /etc/nginx/ssl; mkdir -p /run/nginx
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ssl_certificat.pem -keyout /etc/nginx/ssl/ssl_key.key \
		-subj "/C=FR/ST=Nice/L=Nice/O=42/OU=jbertin/CN=jbertin/"

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]
