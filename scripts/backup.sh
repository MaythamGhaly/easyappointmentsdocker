#!/bin/bash

# Set the current date as a variable
DATE=$(date +"%Y%m%d%H%M")

# Define the MySQL credentials
DB_HOST="mysql"
DB_USER="user"
DB_PASSWORD="password"
DB_NAME="easyappointments"
# Define the backup path
BACKUP_PATH="/backups"

# Create the backup directory if it doesn't exist
mkdir -p ${BACKUP_PATH}

# Dump the database into a SQL file
docker exec -i easyappointmentsdocker-phpmyadmin-1 mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_PATH}/${DB_NAME}_${DATE}.sql

# Delete backups older than 7 days
find ${BACKUP_PATH} -type f -name "*.sql" -mtime +7 -exec rm {} \;