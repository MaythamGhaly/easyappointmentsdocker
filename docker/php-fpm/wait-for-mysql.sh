#!/bin/bash

# Wait for MySQL to be ready
until mysqladmin ping -h mysql -u${DB_USER} -p${DB_PASSWORD} --silent; do
  echo "Waiting for MySQL to be ready..."
  sleep 5
done

echo "MySQL is ready!"