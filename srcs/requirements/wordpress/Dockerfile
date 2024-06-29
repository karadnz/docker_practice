# Use debian:buster base image
FROM debian:buster

# Update the package list and install required packages
RUN apt-get update && apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

# Exposes port 9000 for PHP-FPM
EXPOSE 9000

# Copy the files
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

# Make the startup script executable
RUN chmod +x /var/www/wordpress_start.sh

# Set the script as the entry point for the container
ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

# Pass the command as argument to the script, --nodaemonize flag prevents it from running in foreground (PID 1)
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
