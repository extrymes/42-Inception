FROM debian:bullseye

# Install dependencies
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y vim && \
	apt install -y curl && \
	apt install -y nginx

# Install SSL
RUN mkdir -p /etc/nginx/ssl && \
	apt install openssl -y && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# Create directory for Nginx runtime
RUN mkdir -p /var/run/nginx

# Set permissions for the web root
RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

# Copy configuration files
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose HTTPS port
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
