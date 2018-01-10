build:
	docker-compose build

stop:
	docker-compose down

start:
	docker-compose up -d

ssh:
	docker-compose exec app bash

server:
	hanami server --port 2300 --host 0.0.0.0