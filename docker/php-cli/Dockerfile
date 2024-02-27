FROM php:8.3-cli-alpine

ARG HOST_USER_ID
ARG HOST_GROUP_ID

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN addgroup -g ${HOST_GROUP_ID} --system app
RUN adduser -G app --system -D -s /bin/sh -u ${HOST_USER_ID} app
USER app

WORKDIR /app
