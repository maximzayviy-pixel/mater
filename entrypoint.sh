#!/usr/bin/env sh
set -eu

DB_HOST="${DB_HOST:-postgres}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-mattermost}"
DB_USER="${DB_USER:-mmuser}"
DB_PASSWORD="${DB_PASSWORD:-changeme}"

echo "Waiting for Postgres at ${DB_HOST}:${DB_PORT} ..."
until nc -z "${DB_HOST}" "${DB_PORT}"; do
  sleep 2
done
echo "Postgres is reachable."

export MM_SQLSETTINGS_DRIVERNAME=postgres
export MM_SQLSETTINGS_DATASOURCE="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable&connect_timeout=10"

: "${MM_SERVICESETTINGS_SITEURL:=}"
export MM_SERVICESETTINGS_LISTENADDRESS=":8065"
export MM_FILESETTINGS_DIRECTORY="/mattermost/data"
export MM_PLUGINSETTINGS_ENABLEUPLOADS=true

exec /mattermost/bin/mattermost
