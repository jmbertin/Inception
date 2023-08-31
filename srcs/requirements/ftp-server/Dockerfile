FROM	debian:buster

ENV		DEBIAN_FRONTEND noninteractive

RUN		apt-get update; apt-get install -y proftpd-basic openssl

RUN		mkdir -p /etc/proftpd/ssl
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/proftpd/ssl/ssl_certificat.pem -keyout /etc/proftpd/ssl/ssl_key.key \
		-subj "/C=FR/ST=Nice/L=Nice/O=42/OU=jbertin/CN=jbertin/"; chmod 600 /etc/proftpd/ssl/*

COPY	conf/proftpd.conf /tmp/proftpd.conf
COPY	conf/tls.conf /tmp/tls.conf

COPY	tools/configure.sh /tmp/configure.sh

CMD		sh /tmp/configure.sh
