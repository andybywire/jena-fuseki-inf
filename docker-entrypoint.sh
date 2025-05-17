#!/bin/bash
set -e

# Ensure database directory exists
mkdir -p $FUSEKI_HOME/databases/uxm

# Verify shiro.ini exists and is readable
if [ ! -f "$FUSEKI_HOME/shiro.ini" ] ; then
  echo "Error: shiro.ini not found in $FUSEKI_HOME"
  exit 1
fi

echo "Verifying shiro.ini permissions:"
ls -l $FUSEKI_HOME/shiro.ini

echo "Environment variables:"
echo "FUSEKI_HOME: $FUSEKI_HOME"
echo "FUSEKI_BASE: $FUSEKI_BASE"

# Start Fuseki server
exec "$@" 