# Test image for Coolify: nginx + php-fpm in one container (serversideup)
FROM serversideup/php:8.4-fpm-nginx AS base

ENV PHP_OPCACHE_ENABLE=1 \
    AUTORUN_ENABLED=true \
    AUTORUN_LARAVEL_MIGRATION=true \
    SSL_MODE=off

USER root
RUN install-php-extensions intl bcmath

WORKDIR /var/www/html
COPY --chown=www-data:www-data . /var/www/html

USER www-data
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader \
 && mkdir -p database && touch database/database.sqlite

EXPOSE 8080
