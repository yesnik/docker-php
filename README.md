# Docker PHP Template

This is a Docker setup for PHP development.

## Used Docker images

- [nginx:X.XX-alpine](https://hub.docker.com/_/nginx)
- [php:X.X-fpm-alpine](https://hub.docker.com/_/php/tags?page=1&name=fpm-alpine)
- [php:X.X-cli-alpine](https://hub.docker.com/_/php/tags?page=1&name=cli-alpine)

## Installation

1. Clone this repo with the name of your project, say `mysite`, and remove `.git` folder:
    ```bash
    git clone --depth 1 https://github.com/yesnik/docker-php.git mysite
    cd mysite
    rm -rf .git
    ```
2. Build docker images and run:
    ```bash
    make build
    make up
    
    # Or if you don't have `make` utility:
    docker compose build --build-arg HOST_USER_ID="$(id -u)" --build-arg HOST_GROUP_ID="$(id -g)"
    docker compose up -d
    ```
4. Visit http://127.0.0.1:8080/

### Symfony Installation

1. Run container with bash console:
    ```bash
    make cli
    # Or
    docker compose run -it --rm php-cli sh
    ```
2. Install [Symfony](https://symfony.com/):
    ```bash
    rm -rf public
    composer create-project symfony/skeleton .
    ```
3. Visit http://127.0.0.1:8080/

### Laravel Installation

1. Run container with bash console:
    ```bash
    make cli
    # Or
    docker compose run -it --rm php-cli sh
    ```
2. Install [Laravel](https://laravel.com/):
    ```bash
    rm -rf public
    composer create-project laravel/laravel .
    ```

## Makefile commands

- `make build` - build containers for app
- `make cli` - run container `php-cli` with shell
- `make up` - start app
- `make reset` - stop containers, remove volumes and orphan containers

## Additional Services

### MariaDB

Image: https://hub.docker.com/_/mariadb

Add to `docker-compose.yml`:

```yml
services:
    mariadb:
        image: mariadb:11.1.2
        volumes:
            - db_data:/var/lib/mysql:rw
        ports:
            - '3306:3306'
        environment:
            MARIADB_ROOT_PASSWORD: password

volumes:
    db_data:
```
Add to `docker/php-cli/Dockerfile` and `docker/php-fpm/Dockerfile`:

```dockerfile
# MariaDB
RUN apk add --no-cache mariadb-client \
    && docker-php-ext-install mysqli pdo pdo_mysql
```

### Postgres

Add to `docker-compose.yml`:

```yml
services:
    postgres:
        image: postgres:${POSTGRES_VERSION:-15}-alpine
        environment:
            POSTGRES_DB: ${POSTGRES_DB:-app}
            POSTGRES_USER: ${POSTGRES_USER:-app}
            POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-123}
        volumes:
            - db_data:/var/lib/postgresql/data:rw
        ports:
            - '5432:5432'

volumes:
    db_data:
```

Add to `docker/php-cli/Dockerfile` and `docker/php-fpm/Dockerfile`:

```dockerfile
# Postgres
RUN apk add --no-cache libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql
```
