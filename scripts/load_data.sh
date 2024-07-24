#!/bin/bash

# Environment variables
PGHOST=postgres
PGUSER=postgres
PGPASSWORD=password
PGDATABASE=imdb
export PGPASSWORD=$PGPASSWORD

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
until pg_isready -h $PGHOST -U $PGUSER -d $PGDATABASE; do
  sleep 1
done

# Execute the SQL script to create tables, truncate, and load data
psql -h $PGHOST -U $PGUSER -d $PGDATABASE -f /scripts/init_and_load.sql

echo "Data loading script executed."