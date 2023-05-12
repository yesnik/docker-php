build:
	docker compose build --build-arg HOST_USER_ID=$$(id -u) --build-arg HOST_GROUP_ID=$$(id -g)
cli:
	docker compose run -it --rm php-cli sh
up:
	docker compose up
reset:
	docker compose down -v --remove-orphans
