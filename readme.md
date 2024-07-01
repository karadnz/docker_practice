# docker_project

## Overview

This project sets up a WordPress website with a MariaDB database backend and an Nginx web server using Docker. Each component runs in its own container, providing a modular and isolated environment. The setup ensures secure and efficient operation with persistent data storage. You can also check the comments in the files to get additional information.

## Diagram

![Diyagram](./imgs/image.png)

## Concepts
### Docker Concepts
- **Docker Images:** Read-only templates used to create containers. They contain the application code, runtime, libraries, and dependencies needed to run the application.
- **Docker Containers:** Lightweight, standalone, and executable packages that run the application using the image. Containers are isolated but can communicate with each other.
- **Docker Networks:** Allow containers to communicate with each other. In this project, a custom bridge network (app-network) is used.
- **Docker Volumes:** Persist data generated and used by Docker containers. Volumes ensure that data is not lost when containers are stopped or restarted.
- **Docker Compose:** A tool for defining and running multi-container Docker applications. The docker-compose.yml file specifies the services, networks, and volumes needed for the application.
### Application Concepts
- **WordPress:** A content management system (CMS) used to create and manage websites. In this project, it runs in a container, with PHP-FPM handling PHP processing.
- **Nginx:** A high-performance web server used to serve static files and act as a reverse proxy to handle dynamic requests by forwarding them to PHP-FPM. It also manages HTTPS connections.
- **MariaDB:** An relational database management system (RDBMS) forked from MySQL. It stores all the data for the WordPress site and runs in a dedicated container.

## Project Structure

```
.
|-- Makefile
`-- srcs
    |-- docker-compose.yml
    |-- .env
    `-- requirements
        |-- mariadb
        |   |-- conf
        |   |   `-- 50-server.cnf
        |   |-- Dockerfile
        |   `-- tools
        |       `-- initial_db.sql
        |-- nginx
        |   |-- conf
        |   |   `-- default
        |   |-- Dockerfile
        |   `-- tools
        |       `-- nginx_start.sh
        `-- wordpress
            |-- conf
            |   `-- www.conf
            |-- Dockerfile
            `-- tools
                |-- wordpress_start.sh
                `-- wp-config.php
```

## Setup and Usage

### Prerequisites
- Docker
- Docker Compose

### Commands

- **Build and Start Services**: 
  ```sh
  make all
  ```

- **Stop Services**: 
  ```sh
  make down
  ```

- **Rebuild and Restart Services**: 
  ```sh
  make re
  ```

- **Clean Up**: 
  ```sh
  make clean
  ```

## Configuration Files

### `docker-compose.yml`
Defines the services (MariaDB, WordPress, Nginx), networks, and volumes.

### `.env`
Contains environment variables for WordPress configuration (e.g., site URL, admin credentials).

### MariaDB
- **`50-server.cnf`**: Custom MariaDB configuration.
- **`initial_db.sql`**: SQL script for database initialization.
- **`Dockerfile`**: Defines the MariaDB image build process.

### WordPress
- **`www.conf`**: PHP-FPM configuration.
- **`wordpress_start.sh`**: Startup script to set up WordPress.
- **`wp-config.php`**: WordPress configuration file.
- **`Dockerfile`**: Defines the WordPress image build process.

### Nginx
- **`default`**: Nginx configuration file for serving WordPress with SSL.
- **`nginx_start.sh`**: Startup script to generate SSL certificates.
- **`Dockerfile`**: Defines the Nginx image build process.

## Accessing the Site

Once the services are up, access the WordPress site at:

```sh
https://<your-domain>
```

or you can use curl


