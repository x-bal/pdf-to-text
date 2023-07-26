# # Use the official PHP image with FPM as the base image
# FROM php:8.1-fpm

# # Set the working directory inside the container
# WORKDIR /var/www/html

# # Install system dependencies and PHP extensions
# RUN apt-get update && apt-get install -y \
#     libpng-dev \
#     libjpeg-dev \
#     libfreetype6-dev \
#     zip \
#     unzip \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install gd pdo pdo_mysql

# # Copy the application files to the container
# COPY . /var/www/html

# # Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Install Laravel dependencies using Composer
# RUN composer install

# # Set permissions for storage and bootstrap/cache directories
# RUN chown -R www-data:www-data storage bootstrap/cache

# # Expose port 9000 for PHP-FPM
# EXPOSE 9000

# # Start PHP-FPM when the container runs
# CMD ["php-fpm"]
