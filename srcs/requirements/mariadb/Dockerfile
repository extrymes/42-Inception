FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install mariadb-server -y &&\
	apt install vim -y &&\
	apt install curl -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/script.sh"]
