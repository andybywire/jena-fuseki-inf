#!/bin/bash
set -e

# Ensure database directory exists
mkdir -p $FUSEKI_HOME/databases/uxm

# Start Fuseki server
exec "$@" 