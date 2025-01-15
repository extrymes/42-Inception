#!/bin/bash

sleep 10

cd /var/www/wordpress

if [ ! -f "wp-config.php" ]; then
	wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_USER_PASS \
		--dbhost=$DB_HOST
fi

if ! grep -q "require_once ABSPATH . 'wp-settings.php';" wp-config.php; then
	echo "require_once ABSPATH . 'wp-settings.php';" >> wp-config.php
fi

wp core install --allow-root \
	--url=$WP_DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASS \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email

if ! wp user get $WP_EDITOR_USER --allow-root > /dev/null 2>&1; then
	wp user create $WP_EDITOR_USER $WP_EDITOR_EMAIL --allow-root \
		--role=editor \
		--user_pass=$WP_EDITOR_PASS > /dev/null 2>&1
fi

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

/usr/sbin/php-fpm7.4 -F
