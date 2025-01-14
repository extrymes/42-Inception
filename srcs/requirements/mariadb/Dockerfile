FROM debian:bullseye

# Install dependencies
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y vim && \
	apt install -y curl && \
	apt install -y mariadb-server

# Copy configuration files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy tool files
COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Expose MariaDB port
EXPOSE 3306

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/script.sh"]
