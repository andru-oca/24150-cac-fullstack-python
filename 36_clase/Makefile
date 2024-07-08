#!make

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

.PHONY: all up 

all: info up

info:
	@echo "This is a project for $(SERVICE_NAME)"
	

up:
	@echo "Create the instance of docker"
	docker compose up $(SERVICE_NAME) -d --build

	@echo "Waiting for MySQL to be ready..."
	bash waiter.sh


	@echo "RUN REST OF THE SERVICES"
	docker compose up django -d 
	docker compose up web -d 
	
