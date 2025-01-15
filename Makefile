COMPOSE = docker compose
COMPOSE_PATH = srcs/docker-compose.yml
MARIADB_VOLUME = $(HOME)/data/mariadb
WORDPRESS_VOLUME = $(HOME)/data/wordpress

all: up

up:
	@mkdir -p $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	@sudo chmod 755 $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	@$(COMPOSE) -f $(COMPOSE_PATH) up --build

down:
	@$(COMPOSE) -f $(COMPOSE_PATH) down

clean:
	@$(COMPOSE) -f $(COMPOSE_PATH) down -v --remove-orphans
	@docker system prune -a -f --volumes
	@sudo rm -rf $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

re: clean up

.PHONY: all up down clean re
