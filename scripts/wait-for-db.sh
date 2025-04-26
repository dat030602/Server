#!/bin/sh

set -e

until pg_isready -h db -p 5432 -U odoo; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

exec "$@"
