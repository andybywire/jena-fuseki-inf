# UX Methods Fuseki Server

This is a Docker image for running Apache Jena Fuseki, which is a SPARQL 1.1 server with a web interface, backed by the Apache Jena TDB RDF triple store and configured to support OWL inference.

## Docker commands
```shell
docker-compose build
docker-compose up -d

# or 
docker-compose build up -d

docker-compose logs -f
docker-compose down

# remove all volumes and start fresh
docker volume rm fuseki-uxm_fuseki-data fuseki-uxm_fuseki-config
```