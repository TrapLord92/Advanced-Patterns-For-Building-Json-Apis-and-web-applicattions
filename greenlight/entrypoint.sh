#!/bin/bash
set -e

# Wait for PostgreSQL to be available
RETRIES=5
DELAY=15

for (( i=0; i<RETRIES; i++ )); do
  if pg_isready -h db -U "${POSTGRES_USER}"; then
    echo "PostgreSQL is ready."
    break
  else
    echo "Waiting for PostgreSQL to be ready... (Attempt $((i+1)) of $RETRIES)"
    sleep $DELAY
  fi

  if [ $i -eq $((RETRIES-1)) ]; then
    echo "PostgreSQL is not available after $((i+1)) attempts, exiting."
    exit 1
  fi
done

# Create the database if it doesn't exist
psql -h db -U "${POSTGRES_USER}" -d postgres -c "CREATE DATABASE IF NOT EXISTS greenlight;"

# Create the user if it doesn't exist
psql -h db -U "${POSTGRES_USER}" -d greenlight -c "CREATE ROLE IF NOT EXISTS greenlight WITH LOGIN PASSWORD 'pa55word';"

# Add the citext extension if it doesn't exist
psql -h db -U "${POSTGRES_USER}" -d greenlight -c "CREATE EXTENSION IF NOT EXISTS citext;"

# Call the original entrypoint command
exec "$@"
