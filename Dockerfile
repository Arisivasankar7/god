FROM ubuntu:latest

# Update package list and install Apache
RUN apt-get update && apt-get install -y apache2

# Set working directory
WORKDIR /var/www/html

# Remove any existing index.html in the default location
RUN rm -rf index.html

# Copy the local index.html into the container
COPY index.html /var/www/html

# Run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 for HTTP
EXPOSE 80




