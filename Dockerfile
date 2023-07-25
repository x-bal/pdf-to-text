# Use the official PHP-FPM image as the base image
FROM php:8.0-fpm

# Set the working directory in the container
WORKDIR /var/www/html

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the Laravel project files into the container
COPY . .

# Set the ownership and permissions for the Laravel files
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000 (PHP-FPM)
EXPOSE 9000

# Start PHP-FPM to serve the Laravel application
CMD ["php-fpm"]
