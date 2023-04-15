# Docker PHP Template

This is a Docker setup for PHP development.

## Used Docker images

- [nginx:X.XX-alpine](https://hub.docker.com/_/nginx)
- [php:X.X-fpm-alpine](https://hub.docker.com/_/php/tags?page=1&name=fpm-alpine)
- [php:X.X-cli-alpine](https://hub.docker.com/_/php/tags?page=1&name=cli-alpine)

## Installation

1. Clone this repo with the name of your project, say `mysite`:
    ```bash
    git clone git@github.com:yesnik/docker-php.git mysite
    ```
2. Build docker images and run:
    ```bash
    cd mysite
    make build
    make up
    ```
3. Visit http://127.0.0.1:8080/
4. Run container with bash console: `make cli`
5. Container has `composer` installed. Install any PHP-framework you need.

## Makefile commands

- `make build` - build containers for app
- `make cli` - run container `php-cli` with shell
- `make up` - start app
