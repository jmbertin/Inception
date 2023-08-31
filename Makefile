NAME = inception

all: up

intro:
	@ echo ""
	@ echo "\033[0;96m::::::::::: ::::    :::  ::::::::  :::::::::: ::::::::: ::::::::::: ::::::::::: ::::::::  ::::    :::"
	@ echo "    :+:     :+:+:   :+: :+:    :+: :+:        :+:    :+:    :+:         :+:    :+:    :+: :+:+:   :+:"
	@ echo "\033[0;36m    +:+     :+:+:+  +:+ +:+        +:+        +:+    +:+    +:+         +:+    +:+    +:+ :+:+:+  +:+"
	@ echo "    +#+     +#+ +:+ +#+ +#+        +#++:++#   +#++:++#+     +#+         +#+    +#+    +:+ +#+ +:+ +#+"
	@ echo "\033[0;94m    +#+     +#+  +#+#+# +#+        +#+        +#+           +#+         +#+    +#+    +#+ +#+  +#+#+#"
	@ echo "    #+#     #+#   #+#+# #+#    #+# #+#        #+#           #+#         #+#    #+#    #+# #+#   #+#+#"
	@ echo "\033[0;34m########### ###    ####  ########  ########## ###           ###     ########### ########  ###    ####\033[0;39m"
	@ echo ""

help: intro
	@ echo "\033[0;31m  You need help ? Try with one of these commands :\033[0;39m"
	@ echo ""
	@ awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@ echo ""

up: intro volumes ## Launch Inception in background
	@ docker compose -f ./srcs/docker-compose.yml up -d

build: intro volumes ## Build Inception (use make start after, to launch)
	@ docker compose -f ./srcs/docker-compose.yml build

start: ## Begin Inception
	@ docker compose -f srcs/docker-compose.yml start

down: ## Stop Inception
	@ docker compose -f srcs/docker-compose.yml down

reload: volumes ## Restart Inception
	@ docker compose -f srcs/docker-compose.yml up --build

status: ## Display Inception status
	@ docker ps

logs: ## See Inception logs
	@ docker compose -f ./srcs/docker-compose.yml logs

clean: down ## Stop Inception & Clean inception docker (prune -f)
	@ docker system prune -f

cleanv: ## Remove persistant datas
	@ sudo rm -rf ~/data

prune: down ## Remove all dockers on this system (prune -a)
	@ docker system prune -a

fclean: down prune cleanv ## Remove all dockers on this system & Remove persistant datas
	@ echo

volumes: ## Prepare folders needed
	@ mkdir -p ~/data/website/wordpress
	@ mkdir -p ~/data/database
	@ mkdir -p ~/data/portainer

.PHONY: volumes fclean prune cleanv clean logs status reload down start build up help intro all
