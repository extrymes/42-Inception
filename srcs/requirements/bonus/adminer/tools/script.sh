#!/bin/bash

chmod 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

wget https://www.adminer.org/latest.php -O /var/www/wordpress/adminer.php
