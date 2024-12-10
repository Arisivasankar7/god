FROM ubuntu:latest
RUN apt-get update && apt-get install -y apache2
WORKDIR /var/www/html
RUN rm -rf index.html
copy index.html /var/www/html
CMD [ "apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80



