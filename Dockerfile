# Use the latest Ubuntu base image
FROM ubuntu:latest

# Update the package list and install Apache2 in a single RUN step
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the custom index.html file into the container
COPY index.html /var/www/html/

# Start Apache2 in the foreground
CMD ["apache2", "-D", "FOREGROUND"]

# Expose port 80 to the host
EXPOSE 80



