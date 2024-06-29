#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";	# Modify the www.conf file to set the PHP-FPM listen address to port 9000.
	chown -R www-data:www-data /var/www/*;																# Change ownership and permissions of files.
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;																					# Create directories and files for PHP-FPM.
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then															# Check if it exists, if not set up wordpress.
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;						# Download and install the WP-CLI.
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}	# Install wp with provided env vars.
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};																			# Create wp user with provided env vars.
	echo "Wordpress: set up!"
fi

exec "$@"	# Run the command that provided as argument
