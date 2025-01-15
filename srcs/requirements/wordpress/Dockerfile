FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y vim && \
	apt-get install -y curl && \
	apt-get install -y wget && \
	apt-get install -y php7.4 php-fpm php-mysql && \
	apt-get install -y mariadb-client

# Download and extract WordPress
RUN wget https://wordpress.org/wordpress-6.7.tar.gz -P /var/www && \
	cd /var/www && \
	tar -xzf wordpress-6.7.tar.gz && \
	rm wordpress-6.7.tar.gz && \
	chown -R www-data:www-data /var/www/wordpress

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Copy configuration files
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp_config.sh /usr/local/bin/wp_config.sh
RUN chmod +x /usr/local/bin/wp_config.sh

# Expose php-fpm port
EXPOSE 9000

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/wp_config.sh"]
