CYAN = \033[36m
RESET = \033[0m

HOSTS = /etc/hosts
DATA_FOLDER = /home/almarcos/data/
WORDPRESS_FOLDER = $(DATA_FOLDER)/wordpress/
MARIADB_FOLDER = $(DATA_FOLDER)/mariadb/

all: setup

setup:
	@if ! grep -q almarcos.42.fr $(HOSTS) ; then \
		printf "$(CYAN)Editing $(HOSTS)... $(RESET)\n"; \
 		sudo sed -i '1i 0.0.0.0\talmarcos.42.fr' $(HOSTS); \
		printf "$(CYAN)Done! $(RESET)\n"; \
	fi

	@if [ ! -d $(DATA_FOLDER) ]; then \
		printf "$(CYAN)Creating $(DATA_FOLDER) folder... $(RESET)\n"; \
		sudo mkdir -p $(WORDPRESS_FOLDER) $(MARIADB_FOLDER); \
		printf "$(CYAN)Done! $(RESET)\n"; \
	fi
