DATABASE_CREATION=/sql_database_answers/database.sql
DATABASE_POPULATION=/sql_database_answers/insert_data.sql
PASSWORD=coderhouse
INSTANCE=mysql_server

.PHONY: all start run access dwon

all: start run access

start:
	@echo "Start process with creation of the server"
	docker compose -f docker-compose.yml up -d --build
	@echo "Waiting for MySQL to be ready..."

run:
	bash wait.sh
	@echo "Create the import and run de script"
	docker exec -it $(INSTANCE) mysql -u root -p$(PASSWORD) -e "source $(DATABASE_CREATION);"
	docker exec -it $(INSTANCE) mysql -u root -p$(PASSWORD) -e "source $(DATABASE_POPULATION)"


access:

	@echo "Access to db-client in $(INSTANCE)"
	docker exec -it $(INSTANCE) mysql -u root -p$(PASSWORD) 

down:

	@echo "Shutting Down service"
	docker compose -f docker-compose.yml down
