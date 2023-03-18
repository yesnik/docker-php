# Docker PHP Template

This is a Docker setup for PHP development.

## Used Docker images

- [nginx:X.XX-alpine](https://hub.docker.com/_/nginx)
- [php:X.X-fpm-alpine](https://hub.docker.com/_/php/tags?page=1&name=fpm-alpine)
- [php:X.X-cli-alpine](https://hub.docker.com/_/php/tags?page=1&name=cli-alpine)

## Installation

1. Clone this repo:
    ```bash
    git clone git@github.com:yesnik/docker-php.git
    ```
2. Run docker compose:
    ```bash
    cd docker-php
    docker compose up
    ```
3. Visit http://127.0.0.1:8080/
4. Run container with bash console: `make cli`
5. Container has `composer` installed. Install any PHP-framework you need.

## Makefile commands

- `make cli` - run container `php-cli` with shell
