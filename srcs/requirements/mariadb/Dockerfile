FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y mariadb-server &&\
	apt install -y vim &&\
	apt install -y curl

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/usr/local/bin/script.sh"]
