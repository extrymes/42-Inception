FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y nginx &&\
	apt install -y vim &&\
	apt install -y curl

RUN mkdir -p /etc/nginx/ssl &&\
	apt install openssl -y &&\
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html &&\
	chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
