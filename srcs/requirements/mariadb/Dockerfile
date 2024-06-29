# Use debian:buster base image
FROM debian:buster

# Update the package list and install required packages
RUN apt-get update && apt-get install -y mariadb-server

# Exposes port 9000 for MariaDB
EXPOSE 3306

# Copy the files
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

# Start the service, init with .sql file and remove the .sql file after
RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

# Run the mariadb (it doesent run on foreground so no need to use --nodaemonize)
CMD ["mysqld"]
