FROM	debian:buster

ENV		DEBIAN_FRONTEND noninteractive

RUN		apt-get update;			\
		apt-get install -y		\
		wget				\
		tar					\
		mariadb-client		\
		php7.3-fpm			\
		php7.3				\
		php7.3-bcmath		\
		php7.3-bz2			\
		php7.3-calendar		\
		php7.3-ctype		\
		php7.3-curl			\
		php7.3-dom			\
		php7.3-exif			\
		php7.3-fileinfo		\
		php7.3-gd			\
		php7.3-gmagick		\
		php7.3-gmp			\
		php7.3-iconv		\
		php7.3-imap			\
		php7.3-intl			\
		php7.3-json			\
		php7.3-mbstring		\
		php7.3-memcache		\
		php7.3-mysqli		\
		php7.3-mysqlnd		\
		php7.3-pdo			\
		php7.3-pgsql		\
		php7.3-phar			\
		php7.3-posix		\
		php7.3-redis		\
		php7.3-shmop		\
		php7.3-simplexml	\
		php7.3-soap			\
		php7.3-sockets		\
		php7.3-sqlite3		\
		php7.3-sysvsem		\
		php7.3-sysvshm		\
		php7.3-tokenizer	\
		php7.3-xml			\
		php7.3-xmlreader	\
		php7.3-xmlwriter	\
		php7.3-xsl			\
		php7.3-zip

RUN			adduser --system --no-create-home --group nginx
COPY		conf/php-fpm.conf /etc/php7/fpm/php-fpm.conf
COPY		conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY		conf/www.conf /etc/php7/fpm/pool.d/www.conf

COPY		conf/static.tar /tmp/

WORKDIR		/var/www/html/wordpress

COPY		tools/configure.sh /tmp/configure.sh
ENTRYPOINT	[ "sh", "/tmp/configure.sh" ]
