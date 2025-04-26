#!/bin/bash

# Wait for PostgreSQL to be ready
/usr/local/bin/wait-for-db.sh

# Set database connection variables
DB_HOST=${DB_HOST:-db}
DB_USER=${DB_USER:-odoo}
DB_NAME=${DB_NAME:-odoo17}
PGPASSWORD=${POSTGRES_PASSWORD:-odoo}

# Initialize the database if it doesn't exist
if ! PGPASSWORD="$PGPASSWORD" psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -c '\q' 2>/dev/null; then
    echo "Creating database..."
    if createdb -h "$DB_HOST" -U "$DB_USER" "$DB_NAME"; then
        echo "Database created successfully."
    else
        echo "Failed to create database."
        exit 1
    fi
    # Initialize the database with Odoo
    PGPASSWORD="$PGPASSWORD" /app/odoo/odoo-bin -c /etc/odoo.conf --init=all
fi

# Start Odoo
exec "$@"
