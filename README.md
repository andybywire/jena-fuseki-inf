# Jena Fuseki Server with Inference Support

This is a Docker image for running Apache Jena Fuseki 5.4.0 with RDFS and OWL inference support. It includes:

- A SPARQL web interface
- Persistent storage backed by the Apache Jena TDB2 RDF triple store
- Two pre-configured static datasets that support RDFS and OWL inference
  - Static datasets can be modified, duplicated, or deleted in `config.ttl`
  - You can find additional reasoners in the [Fuseki Configuration docs](https://jena.apache.org/documentation/fuseki2/fuseki-configuration.html#possible-reasoners) 
- Support for persistent dynamic (non-inference) datasets added through the Fuseki UI

Jena 5.4.0 also has experimental support for [triple terms](https://www.w3.org/TR/rdf12-concepts/#section-triple-terms) and [reifying triples](https://www.w3.org/TR/rdf12-turtle/#reifying-triples), which allows for the expression of edge properties (statements about relationships) in clean, concise syntax.


## Docker
If you're new to Docker, the easiest way to get started is with Docker Desktop. Once installed, you'll be able to build and run this Docker image. 

```shell
# Build the Docker image:
docker-compose build

# Start the Docker instance:
docker-compose up -d

# The `-d` flag runs the container in detached state. 
# Fuseki will be available at `http://localhost:3030`.

# Stop the container:
docker-compose down

# Stop the container and remove volumes (this will clear any loaded RDF data):
docker-compose down -v
```

## Security
This configuration bypasses Fuseki's standard authentication to allow unauthenticated access to full dataset read and write operations. If you plan to expose access any other users, be sure to re-enable authentication or secure endpoints via your server configuration.

## Additional Resources
This repo is intentionally lean and is intended to provide a quick way to get started and experiment with inference in Jena Fuseki. For a more full featured Jena Fuseki image, check out [@stain](https://github.com/stain)'s excellent [Docker files for Jena repo.](https://github.com/stain/jena-docker/tree/master)