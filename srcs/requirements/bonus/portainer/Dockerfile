FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

# Download and extract Portainer
RUN wget https://github.com/portainer/portainer/releases/download/2.21.2/portainer-2.21.2-linux-amd64.tar.gz && \
	tar -xzf portainer-2.21.2-linux-amd64.tar.gz && \
	rm portainer-2.21.2-linux-amd64.tar.gz

# Set entrypoint
ENTRYPOINT ["/portainer/portainer", "-H", "unix:///var/run/docker.sock"]
