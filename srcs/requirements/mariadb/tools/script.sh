#!/bin/bash

mysqld_safe --datadir=/var/lib/mysql &

sleep 5

mysql -u root -p$DB_ROOT_PASS -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -u root -p$DB_ROOT_PASS -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASS}';"
mysql -u root -p$DB_ROOT_PASS -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root -p$DB_ROOT_PASS -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
mysql -u root -p$DB_ROOT_PASS -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOT_PASS shutdown

exec mysqld_safe
