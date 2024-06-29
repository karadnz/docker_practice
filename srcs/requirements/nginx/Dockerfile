# Use debian:buster base image
FROM debian:buster

# Update the package list and install required packages
RUN apt-get update && apt-get install -y nginx openssl

# Exposes port 443 for HTTPS
EXPOSE 443

# Copy the files
COPY ./conf/default/ /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www

# Make the startup script executable
RUN chmod +x /var/www/nginx_start.sh

# Set the script as the entry point for the container
ENTRYPOINT ["var/www/nginx_start.sh"]

# Pass the command as argument to the script, daemon off flag prevents it from running in foreground (PID 1)
CMD ["nginx", "-g", "daemon off;"]

