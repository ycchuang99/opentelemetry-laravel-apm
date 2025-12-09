FROM php:8.5-cli-alpine AS app

WORKDIR /app

RUN set -eux; \
    apk update; \
    apk add --no-cache \
    $PHPIZE_DEPS \
    zlib-dev \
    libzip-dev \
    linux-headers;

RUN pecl install opentelemetry redis; \
    docker-php-ext-install -j$(nproc) zip pdo pdo_mysql bcmath; \
    docker-php-ext-enable opentelemetry redis;

COPY --from=composer:2.9 /usr/bin/composer /usr/local/bin/composer

COPY . .

RUN composer install --optimize-autoloader --no-ansi

RUN chown -R 1000:1000 /app \
    && chmod -R 755 /app/storage

USER 1000

CMD [ "/bin/sh", "-c", "php artisan serve --host=0.0.0.0 --port=8080" ]
