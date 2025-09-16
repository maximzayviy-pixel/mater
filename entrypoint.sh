#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-postgres}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-mattermost}"
DB_USER="${DB_USER:-mmuser}"
DB_PASSWORD="${DB_PASSWORD:-changeme}"

# Wait for Postgres
echo "Waiting for Postgres at ${DB_HOST}:${DB_PORT} ..."
until /bin/bash -c "cat < /dev/null > /dev/tcp/${DB_HOST}/${DB_PORT}" 2>/dev/null; do
  sleep 2
done
echo "Postgres is reachable."

# Build datasource (disable ssl for internal network; adjust if using managed DB with SSL)
export MM_SQLSETTINGS_DRIVERNAME=postgres
export MM_SQLSETTINGS_DATASOURCE="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable&connect_timeout=10"

# Basic required settings
: "${MM_SERVICESETTINGS_SITEURL:=}"         # set in Render env later to your domain/URL
export MM_SERVICESETTINGS_LISTENADDRESS=":8065"
export MM_FILESETTINGS_DIRECTORY="/mattermost/data"
export MM_PLUGINSETTINGS_ENABLEUPLOADS=true

# Start Mattermost
exec /mattermost/bin/mattermost
