FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y vim && \
	apt-get install -y curl && \
	apt-get install -y mariadb-server

# Copy configuration files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy tool files
COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Expose MariaDB port
EXPOSE 3306

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/script.sh"]
