FROM ubuntu:22.04

# Update package list and install Apache
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www/html

# Copy the local index.html into the container
COPY index.html /var/www/html

# Expose port 80 for HTTP
EXPOSE 80

# Add health check
HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl -f http://localhost/ || exit 1

# Run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

