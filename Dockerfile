FROM php:8.1-apache

# Install system dependencies and PHP extensions as needed
# For example, if you need to install additional PHP extensions, you can do it like this:
# RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy your Laravel project into the container
COPY . /var/www/html

# Set appropriate permissions for Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Start Apache
CMD ["apache2-foreground"]
