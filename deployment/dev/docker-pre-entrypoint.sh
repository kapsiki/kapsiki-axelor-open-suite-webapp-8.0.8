#!/bin/bash

# Set default values for database connection
export DB_HOST="${DB_HOST:=db}"  # Matches the service name in Docker Compose
export DB_NAME="${DB_NAME:=${POSTGRES_DB}}"
export DB_PASSWORD="${DB_PASSWORD:=${POSTGRES_PASSWORD}}"
export DB_USER="${DB_USER:=${POSTGRES_USER}}"

# Prepare the command to execute
set -- "/docker-entrypoint.sh" "$@"

# Modify the application properties for database connection
sed -f- -i /var/lib/tomcat/webapps/ROOT/WEB-INF/classes/application.properties <<- EOF
    s|^db.default.url = .*|db.default.url = jdbc:postgresql://${DB_HOST}:5432/${DB_NAME}|;
    s|^db.default.user = .*|db.default.user = ${DB_USER}|;
    s|^db.default.password = .*|db.default.password = ${DB_PASSWORD}|;
EOF

# Execute the entrypoint script
exec "$@"
