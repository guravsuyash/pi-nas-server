FROM php:7.4-fpm

# Create a non-root user and group
RUN groupadd -r appuser && useradd -r -g appuser -d /var/www -s /sbin/nologin appuser

# Install only essential packages, then remove apt cache
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) gd pdo_mysql mysqli zip \
 && apt-get purge -y --auto-remove \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set workdir and secure permissions
WORKDIR /var/www/html
RUN chown -R appuser:appuser /var/www

# Switch to non-root user
USER appuser

# Expose FPM port (optional if used in Compose with internal networking)
EXPOSE 9000
