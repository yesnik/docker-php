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
    ```
3. Visit http://127.0.0.1:8080/

### Symfony Installation

1. Run container with bash console: `make cli`
2. Install [Symfony](https://symfony.com/):
    ```
    rm -rf public
    composer create-project symfony/skeleton .
    ```
3. Visit http://127.0.0.1:8080/

### Laravel Installation

1. Run container with bash console: `make cli`
2. Install [Laravel](https://laravel.com/):
    ```
    rm -rf public
    composer create-project laravel/laravel .
    ```

## Makefile commands

- `make build` - build containers for app
- `make cli` - run container `php-cli` with shell
- `make up` - start app
- `make reset` - stop containers, remove volumes and orphan containers

## Additional Services

### Postgres

Add to `docker-compose.yml`:

```yml
services:
    database:
        image: postgres:${POSTGRES_VERSION:-15}-alpine
        environment:
            POSTGRES_DB: ${POSTGRES_DB:-app}
            POSTGRES_USER: ${POSTGRES_USER:-app}
            POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-123}
        volumes:
            - database_data:/var/lib/postgresql/data:rw
        ports:
            - '5432:5432'
```

Add to `docker/php-cli/Dockerfile` and `docker/php-fpm/Dockerfile`:

```dockerfile
# Postgres
RUN apk add --no-cache libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql
```
