# -f: --file				-> filepath
# -q: --quiet
# -a: --all
# $$: escape $ for shell

# Check if all the necessary commands exists

# Creates directories, starts the docker containers
all:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

#  Stops and removes containers
down:
	@docker-compose -f ./srcs/docker-compose.yml down

# Rebuilds and starts the containers
re:
	@docker-compose -f srcs/docker-compose.yml up --build

# Removes containers, images, volumes, networks. Also deletes the data directories
clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/data/wordpress
	rm -rf $(HOME)/data/mariadb

connect:
	docker exec -it mariadb sh
.PHONY: all re down clean connect
