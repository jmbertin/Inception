FROM		debian:buster

ENV			DEBIAN_FRONTEND noninteractive

RUN 		echo never > /sys/kernel/mm/transparent_hugepage/enabled; apt-get update; apt-get install -y redis

COPY		conf/redis.conf /etc/redis/redis.conf

ENTRYPOINT	[ "redis-server", "--protected-mode", "no" ]
