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

## To run the container with persistent storage

`docker build -t fuseki-uxm .`

```
docker run -d \
  -p 3030:3030 \
  -v $(pwd)/config.ttl:/opt/fuseki/config.ttl \
  -v $(pwd)/databases:/opt/fuseki/databases \
  --name fuseki \
  fuseki-uxm
```

`docker stop fuseki`

to remove it:
`docker rm fuseki`

to restart it:
`docker start fuseki`

The docker start command will use all the same volume mounts, port mappings, and other settings that were specified when the container was first created with docker run. You don't need to specify these parameters again.


Reasoners: https://jena.apache.org/documentation/fuseki2/fuseki-configuration.html#possible-reasoners