#!/bin/bash

sleep 10

cd /var/www/wordpress

if [ ! -f "wp-config.php" ]; then
	wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASS \
		--dbhost=$DB_HOST
fi

if ! grep -q "require_once ABSPATH . 'wp-settings.php';" wp-config.php; then
	echo "require_once ABSPATH . 'wp-settings.php';" >> wp-config.php
fi

wp core install --allow-root \
	--url=$DOMAIN_NAME \
	--title=$TITLE \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	--skip-email

if ! wp user get $USER --allow-root > /dev/null 2>&1; then
	wp user create $USER $USER_EMAIL --allow-root \
		--role=editor \
		--user_pass=$USER_PASS > /dev/null 2>&1
fi

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

/usr/sbin/php-fpm7.4 -F
