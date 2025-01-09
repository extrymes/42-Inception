FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y wget &&\
	apt install -y php7.3 php-fpm php-mysql &&\
	apt install -y mariadb-client &&\
	apt install -y vim &&\
	apt install -y curl

RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.1.1.tar.gz && rm wordpress-6.1.1.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY conf/wp_config.sh /usr/local/bin/wp_config.sh

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/usr/local/bin/wp_config.sh"]

