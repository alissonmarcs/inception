CYAN = \033[36m
RESET = \033[0m

HOSTS = /etc/hosts
DATA_FOLDER = /home/almarcos/data/
WORDPRESS_FOLDER = $(DATA_FOLDER)/wordpress/
MARIADB_FOLDER = $(DATA_FOLDER)/mariadb/
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
ENV_FILE = srcs/.env
ENV_FILE_URL = https://gist.githubusercontent.com/alissonmarcs/d949711826d48b6f404848a9ec712427/raw/cd0eb5b6fdf2b172cd1f12094dadbc27ad8bafd9/gistfile1.txt
all: setup

setup:
	@if ! grep -q almarcos.42.fr $(HOSTS) ; then \
		printf "$(CYAN)Editing $(HOSTS) ... $(RESET)"; \
 		sudo sed -i '1i 0.0.0.0\talmarcos.42.fr' $(HOSTS); \
		printf "$(CYAN)Done! $(RESET)\n"; \
	fi

	@if [ ! -d $(DATA_FOLDER) ]; then \
		printf "$(CYAN)Creating $(DATA_FOLDER) folder ... $(RESET)"; \
		sudo mkdir -p $(WORDPRESS_FOLDER) $(MARIADB_FOLDER); \
		printf "$(CYAN)Done! $(RESET)\n"; \
	fi

	@if [ ! -e $(ENV_FILE) ]; then \
		printf "$(CYAN)Downloading $(ENV_FILE) ... $(RESET)"; \
		curl -o $(ENV_FILE) $(ENV_FILE_URL); \
		printf "$(CYAN)Done! $(RESET)\n"; \
	fi

up: setup
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down -v --rmi local

prune: down
	sudo rm -rf /home/almarcos/data/

start: 
	docker-compose -f $(DOCKER_COMPOSE_FILE) start

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop -t 4