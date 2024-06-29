
all: up

up:
	mkdir -p /home/data/wordpress
	mkdir -p /home/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa)			||	 true
	docker rm $$(docker ps -qa)			||	 true
	
fclean:
	docker stop $$(docker ps -qa)			||	 true
	docker rm $$(docker ps -qa)			||	 true
	docker rmi -f $$(docker images -q)		||	 true
	docker volume rm $$(docker volume ls -q)	||	 true
	docker network rm $$(docker network ls -q)	||	 true
	rm -rf /home/data/wordpress			||	 true
	rm -rf /home/data/mariadb			||	 true


re: 
	mkdir -p /home/data/wordpress
	mkdir -p /home/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build

.PHONY: all up down clean re

