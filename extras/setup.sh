#!/bin/bash

# Remember to use source <script_name.sh> 
# Otherwise the variables will only be available to this script.

# Help Menu function
show_help() {
    echo "Usage: $(basename -- $0) [--help] [--var] [--dbsec] [--dbcreate]"
    echo "  --help          This message."
    echo "  --var           Set up local variables"
    echo "  --dbsec         Set up Secure Database connection"
    echo "  --dbcreate      Create and populate the database"
    echo "  --db-failover   DB Failover ping test"
    #exit 0
}

if [[ "$1" == "" || "$1" == "--help" ]]; then
    show_help

# Setting up the variables.
elif [ "$1" = "--var" ]; then
    echo "#########################"
    echo "## Exporting Variables ##"
    echo "#########################"
    # ONLY UPDATE ON HOST MACHINE
    export RDSHOST="get-postgres.cfes2oy8o6rj.eu-west-1.rds.amazonaws.com"
    export DB_PASSWORD="7thelongerthebetterincase0fpasswords?"
    #############################
    export DB_USER="getadmin"
    export DB_NAME="get_demo"
    
    source ~/.bashrc

    echo "RDSHOST=$RDSHOST"
    echo "DB_USER=$DB_USER"
    echo "DB_NAME=$DB_NAME"
    echo "DB_PASSWORD=Ha Ha... No!"

# Creating the secure .pgpass file for DB connection (hides the password).
elif [ "$1" = "--dbsec" ]; then
    echo "#############################################"
    echo "## Setting up .pgpass file with variables. ##"
    echo "#############################################"
    echo "$RDSHOST:5432:$DB_NAME:$DB_USER:$DB_PASSWORD" > ~/.pgpass
    echo ""
    echo "Changing file permissions"
    chmod 600 ~/.pgpass

# Connecting to the DB and creating tables.
elif [ "$1" = "--dbcreate" ]; then
    echo "###################################################"
    echo "## Connecting to Database and setting up tables. ##"
    echo "###################################################"

    psql -h "$RDSHOST" -U "$DB_USER" -d "$DB_NAME" -f movies.sql
elif [ "$1" = "--db-failover" ]; then
    read -rs -p "DB password: " DB_PASSWORD; export PGPASSWORD=$DB_PASSWORD
    while true; do
        printf '%s  ' "$(date +%T)"
        psql "host=$RDSHOST dbname=get_demo user=getadmin sslmode=require connect_timeout=3" -Atc "select inet_server_addr();" 2>&1 | head -1
        sleep 1
    done
else
    show_help
fi


