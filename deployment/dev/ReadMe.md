# Kapsiki Axelor ERP with PostgreSQL

This repository contains a Docker Compose setup for the Kapsiki Axelor ERP application, backed by a PostgreSQL database. This setup allows for easy deployment and management of the application and its database in a containerized environment.

## Prerequisites

- **Docker**: Ensure you have Docker installed on your machine.
- **Docker Compose**: Make sure you have Docker Compose installed.

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/kapsiki/kapsiki-axelor-open-suite-webapp-8.0.8.git
cd kapsiki-axelor-open-suite-webapp-8.0.8/deployment/dev
```

### Configuration

Before starting the services, you may want to customize the environment variables. You can do this by creating a `.env` file in the same directory as your `docker-compose.yml`. Here’s an example `.env` file:

```env
POSTGRES_DB=axelor
POSTGRES_USER=axelor
POSTGRES_PASSWORD=axelor
AXELOR_CONFIG_DB_DEFAULT_URL=jdbc:postgresql://db:5432/axelor
AXELOR_CONFIG_DB_DEFAULT_USER=axelor
AXELOR_CONFIG_DB_DEFAULT_PASSWORD=axelor
```

#### PostgreSQL Configuration
- **POSTGRES_DB**: The name of the PostgreSQL database (default: axelor).
- **POSTGRES_USER**: The username for the PostgreSQL database (default: axelor).
- **POSTGRES_PASSWORD**: The password for the PostgreSQL user (default: axelor).

#### Axelor Application Configuration
The Axelor application requires specific environment variables for proper database connectivity and configuration:

- **AXELOR_CONFIG_DB_DEFAULT_URL**: This is the JDBC URL that tells Axelor where to find the PostgreSQL database. It must reference the database service defined in the Docker Compose file (e.g., `jdbc:postgresql://db:5432/axelor`). This allows Axelor to connect to the database container seamlessly.
- **AXELOR_CONFIG_DB_DEFAULT_USER**: The username to access the Axelor database. This should match the `POSTGRES_USER` variable.
- **AXELOR_CONFIG_DB_DEFAULT_PASSWORD**: The password for the Axelor database user. This should match the `POSTGRES_PASSWORD` variable.

### Using Local PostgreSQL

If you prefer to use a local instance of PostgreSQL instead of the Dockerized version, you can modify these environment variables accordingly:

1. **Set Local Database Values**:
   - Change `AXELOR_CONFIG_DB_DEFAULT_URL` to point to your local PostgreSQL instance, e.g., `jdbc:postgresql://localhost:5432/axelor`.
   - Ensure that the `POSTGRES_USER` and `POSTGRES_PASSWORD` match the credentials of your local PostgreSQL setup.

2. **Remove the Database Service**:
   - If you're using a local PostgreSQL instance, you may want to remove the `db` service from the `docker-compose.yml` file to avoid conflicts.

### Starting the Services

To start the application and database, run:

```bash
docker-compose -f dev.docker-compose.yml up -d
```

This command will launch the services in detached mode.

### Accessing the Application

Once the services are up, you can access the Axelor ERP application in your web browser at:

```
http://localhost:8080/
```

### Stopping the Services

To stop the services, run:

```bash
docker-compose -f dev.docker-compose.yml down
```

This command will stop and remove the containers.

### Viewing Logs

To view the logs of the Axelor service, use:

```bash
docker-compose logs axelor
```

For PostgreSQL logs, use:

```bash
docker-compose logs db
```

### Troubleshooting

If the Axelor container keeps restarting, check the logs for error messages:

```bash
docker-compose logs axelor
```

Common issues may include:
- Database connection problems
- Misconfigured environment variables
- Missing application properties

### Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request.

## Summary

This README provides clear instructions on setting up and running your Docker Compose application, along with troubleshooting tips and contributing guidelines. You can customize it further based on your specific use case or project details.
