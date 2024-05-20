DATABASE_CREATION=/sql_database_answers/database.sql
DATABASE_POPULATION=/sql_database_answers/inser_data.sql
PASSWORD=coderhouse
INSTANCE=mysql

.PHONY: all start run access dwon

all: start run access

start:
	@echo "Start process with creation of the server"
	docker compose -f docker-compose.yml up -d --build
	@echo "Waiting for MySQL to be ready..."
	bash wait.sh

run:

	@echo "Create the import and run de script"
	docker exec -it $(INSTANCE) mysql -u root -p$(PASSWORD) -e "source $(DATABASE_CREATION);"
	docker exec -it $(INSTANCE) mysql -u root -p$(PASSWORD) -e "source $(DATABASE_POPULATION)"


access:

	@echo "Access to db-client in $¨(SERVICE_NAME)"
	docker exec -it $(SERVICE_NAME) mysql -u root -p$(PASSWORD) 

down:

	@echo "Shutting Down service"
	docker compose -f docker-compose.yml down
