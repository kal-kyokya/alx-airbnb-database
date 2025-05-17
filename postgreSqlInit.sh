#!/usr/bin/env bash
# Bash Script initializing postgreSql with a user, DB and privileges as the system 'postgres' user

# Usage:
# ./postgreSqlInit.sh <username> <password> <database> [optional_sql_file.sql]

set +H # Disable history expansion (so '!' in passwords does'nt break things)
set -e # Exit on any error

USERNAME="$1"
PASSWORD="$2"
DBNAME="$3"
SQLFILE="$4"
LOGFILE="postgresql_init.log"

if [[ -z "$USERNAME" || -z "$PASSWORD" || -z "$DBNAME" ]];
then
    echo "Usage: $0 <username> <password> <database> [optional_sql_file.sql]"
    echo ""
    exit 1
fi

echo "Initializing PostgreSql setup..." | tee "$LOGFILE"
echo ""

# Step 1: Create user 'if not exists'
echo "Checking if user '$USERNAME' exists..." | tee -a "$LOGFILE"
echo ""

sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='$USERNAME'" | grep -q 1 || {
    echo "Creating user '$USERNAME'..." | tee -a "$LOGFILE"
    echo ""

    sudo -u postgres psql -c "CREATE USER $USERNAME WITH PASSWORD '$PASSWORD';" | tee -a "$LOGFILE"
}

# Step 2: Create database 'if not exists'
echo "Checking if database '$DBNAME' exists..." | tee -a "$LOGFILE"
echo ""

sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='$DBNAME'" | grep -q 1 || {
    echo "Creating database '$DBNAME'..." | tee -a "$LOGFILE"
    echo ""

    sudo -u postgres psql -c "CREATE DATABASE $DBNAME;" | tee -a "$LOGFILE"
}

# Step 3:
# 3.1 Grant privileges
echo "Granting privileges on '$DBNAME' to '$USERNAME'..." | tee -a "$LOGFILE"
echo ""

sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DBNAME TO $USERNAME;" | tee -a "$LOGFILE"

# 3.2 Grant access to public schema (to allow table creation)
echo "Granting usage and create privileges on schema 'public' to '$USERNAME'..." | tee -a "$LOGFILE"
echo ""

sudo -u postgres psql -d "$DBNAME" -c "GRANT ALL ON SCHEMA public TO $USERNAME;" | tee -a "$LOGFILE"

###
# Example of running an '.sql' script using the new user
#
# -> psql -U your_username -d your_database -f your_script.sql
###

# Step 4: Optional SQL file execution
if [ -n "$SQLFILE" ];
then
    echo "Executing SQL file: $SQLFILE" | tee -a "$LOGFILE"
    echo ""

    PGPASSWORD="$PASSWORD" psql -U "$USERNAME" -d "$DBNAME" -f "$SQLFILE" | tee -a "$LOGFILE"
else
    echo "$SQLFILE - No SQL file provided or file does not exist. Skipping script execution." | tee -a "$LOGFILE"
    echo ""

fi

echo "✅PostgreSql initialization complete" | tee -a "$LOGFILE"
echo ""
