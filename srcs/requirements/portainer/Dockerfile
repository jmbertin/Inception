FROM	debian:buster

RUN		apt-get update; apt-get install -y ca-certificates curl jq tar openssl

RUN		mkdir -p /var/lib/portainer && \
		mkdir -p /certs && \
		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /certs/cert.pem -keyout /certs/key.pem -subj "/C=FR/ST=Nice/L=Nice/O=42/OU=jbertin/CN=jbertin/" && \
		addgroup -system portainer && \
		useradd --system --no-create-home --home-dir /var/lib/portainer --shell /bin/sh --gid portainer --groups portainer portainer && \
		chown portainer:portainer /var/lib/portainer

RUN		curl -sSL https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz | \
		tar -xzo -C /usr/local

CMD	["/usr/local/portainer/portainer", "--sslcert", "/certs/cert.pem", "--sslkey", "/certs/key.pem"]
