#!/bin/sh
	sleep 10 # be careful with this ! Could fail on a slow PC
if [ ! -f "/var/www/html/index.html" ]; then

	echo "Wordpress doesn't exist. Creation in progress..."
	echo "Downloading WP CLI tool..."
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	cp wp-cli.phar /usr/bin/wp
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	wp plugin update --all --allow-root
	echo "Adminer downloading in progress..."
	wget -q https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php
	echo "Static website deployment..."
	tar -xzvf /tmp/static.tar -C /var/www/html/ > /dev/null 2>&1
	echo "Configure Wordpress for Redis..."
	sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"      wp-config.php
	sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
	sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
	sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
	sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root

	echo "Wordpress (with Redis), Adminer & static website deployment are complete."
fi

mkdir -p /run/php/

echo "Wordpress started (port 9000)."
/usr/sbin/php-fpm7.3 -F -R
