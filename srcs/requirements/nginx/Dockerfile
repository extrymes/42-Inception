FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx

# Install SSL
RUN mkdir -p /etc/nginx/ssl && \
	apt-get install openssl -y && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# Create directory for Nginx runtime
RUN mkdir -p /var/run/nginx

# Set permissions for the web root
RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

# Copy configuration files
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy static page
COPY static/index.html /usr/share/nginx/html/index.html

# Run Nginx on startup
CMD ["nginx", "-g", "daemon off;"]
