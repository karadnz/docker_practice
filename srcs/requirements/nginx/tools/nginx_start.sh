#!/bin/bash

# Check if SSL certicate is already exists, if not generate a self signed SSL certificate valid for 365 years
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=TR/ST=ISTANBUL/L=SARIYER/O=42ISTANBUL/CN=mkaraden.42.fr";
echo "Nginx: ssl is set up!";
fi

# Execute the arguments passed to the script
exec "$@"
