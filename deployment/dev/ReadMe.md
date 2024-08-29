
# Getting Axelor Running in Docker

This guide will help you set up Axelor using Docker. Axelor is an open-source ERP and CRM solution that can be easily deployed with Docker.

## Prerequisites

- Docker installed on your machine (version 19.03 or later).
- Docker Compose installed (version 1.27 or higher).

## Quick Start

1. **Clone the Repository**

   ```bash
   git clone https://github.com/kapsiki/kapsiki-axelor-open-suite-webapp.git
   cd kapsiki-axelor-open-suite-webapp-8.0.8/deployment/dev
   ```

2. **Create a `.env` File**

   Copy the example environment file and customize it as needed:

   ```bash
   cp .env.example .env
   ```

3. **Build and Start the Containers**

   If you are using Docker Compose, run:

   ```bash
   docker-compose -f dev.docker-compose.yml up -d
   ```

   To build the images without using the cache (optional):

   ```bash
   docker-compose -f dev.docker-compose.yml  build --no-cache
   ```

4. **Access Axelor**

   Once the containers are running, you can access Axelor in your web browser at:

   ```
   http://localhost:8080/kapsiki-erp
   ```

   The default credentials are:
   - **Username:** admin
   - **Password:** admin

## Stopping the Containers

To stop the running containers, use:

```bash
docker-compose -f dev.docker-compose.yml down
```

## Customizing Your Setup

You can customize the configuration by modifying the `.env` file. Here are some common variables you might want to change:

- `DB_NAME`: Name of the database.
- `DB_USER`: Username for the database.
- `DB_PASSWORD`: Password for the database.

## Troubleshooting

- If you encounter any issues, check the logs with:

  ```bash
  docker-compose logs
  ```

- Ensure Docker is running and you have sufficient resources allocated.

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

If you would like to contribute to the project, please fork the repository and submit a pull request.

## Support

For further assistance, please refer to the [Axelor Documentation](https://docs.axelor.com).

```
