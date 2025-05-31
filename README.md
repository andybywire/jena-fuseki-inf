# Jena Fuseki Server with Inference Support

This is a Docker image for running Apache Jena Fuseki 5.4.0 with RDFS and OWL inference support. It's designed to be an easy way to get started with semantic web technologies, especially for taxonomists and ontologists who want to experiment with inference capabilities locally. This version of Jena supports RDF 1.2, the latest version of the RDF specification, including its new features like triple terms and reifying triples.

## 📦 What's Included

- A SPARQL web interface (accessible at `http://localhost:3030` after startup)
- Persistent storage backed by the Apache Jena TDB2 RDF triple store
- Two pre-configured static datasets that support RDFS and OWL inference:
  - `/ds-rdfs` - A dataset with RDFS inference enabled
  - `/ds-owl` - A dataset with OWL inference enabled
  - These datasets can be modified, duplicated, or deleted in `config.ttl`
  - Additional reasoners are available as documented in the [Fuseki Configuration docs](https://jena.apache.org/documentation/fuseki2/fuseki-configuration.html#possible-reasoners)
- Support for persistent dynamic (non-inference) datasets added through the Fuseki UI

## ✨ Key Features

- **Inference Support**: Reason over your RDFS and OWL ontologies and datasets
- **Triple Terms**: Experimental support for [triple terms](https://www.w3.org/TR/rdf12-concepts/#section-triple-terms) and [reifying triples](https://www.w3.org/TR/rdf12-turtle/#reifying-triples), allowing for the expression of edge properties (statements about relationships) in clean, concise syntax
- **Persistent Storage**: Your data and configurations are saved between restarts
- **Easy Setup**: No need to manually configure Fuseki or install Java

## 🚀 Getting Started

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed on your computer
- Basic understanding of RDF, SPARQL, and semantic web concepts

### Quick Start

1. Clone this repository to your local machine
2. Open a terminal in the repository directory
3. Run the following commands:

```shell
# Build the Docker image:
docker compose build

# Start the Docker instance (`-d` detaches the instance from the terminal):
docker compose up -d
```

### Accessing Fuseki

Once running, you can:
1. Open `http://localhost:3030` in your web browser
2. Access the SPARQL query interface at `http://localhost:3030/sparql`
3. Manage dynamic datasets through the Fuseki web interface

### Loading Your Data

You can load your RDF data in several ways:
- Through the Fuseki web interface
- Using SPARQL UPDATE queries
- Using the Fuseki API

### Test Data

The `test-data` directory contains a simple RDF dataset and two sample SPARQL queries that will allow you to test inference capabilities. To see the differences in the data returned load `data.ttl` in each dataset and then query the endpoints with the SPARQL queries provided. 

### Stopping the Server

```shell
# Stop the container:
docker compose down

# Stop the container and remove volumes (this will clear any loaded RDF data):
docker compose down -v
```

## 🔐 Security

This Docker image is configured for local development and experimentation by default:
- Fuseki's built-in authentication has been disabled in `config.ttl` and `shiro.ini`
- All endpoints are accessible without authentication
- Full read and write access is enabled for all operations

### For Local Development
If you're running this locally for development or testing:
- The default configuration is suitable as long as you're only accessing it from your local machine
- Remember that anyone on your local network could potentially access the server

### For Production Use
If you plan to expose this server to other users or the internet:
1. **Option 1: Re-enable Fuseki Authentication**
   - Restore the default authentication in `config.ttl` and `shiro.ini`
   - Configure user accounts and permissions
   - See the [Fuseki Security documentation](https://jena.apache.org/documentation/fuseki2/fuseki-security.html) for details

2. **Option 2: Use a Reverse Proxy (Recommended)**
   - Run Fuseki behind a reverse proxy like Nginx
   - Configure authentication and SSL/TLS at the proxy level
   - This approach provides:
     - Better security features (rate limiting, SSL/TLS, etc.)
     - More flexible authentication options
     - Easier certificate management
     - Better protection against common web vulnerabilities

## 📚 Additional Resources
This repo is intentionally lean and is intended to provide a quick way to get started and experiment with inference in Jena Fuseki. For a more full featured Jena Fuseki image, check out [@stain](https://github.com/stain)'s excellent [Docker files for Jena repo.](https://github.com/stain/jena-docker/tree/master)

### Docs
- [Apache Jena Documentation](https://jena.apache.org/documentation/)
- [SPARQL Query Language Reference](https://www.w3.org/TR/sparql11-query/)
- [RDF 1.1 Concepts and Abstract Syntax](https://www.w3.org/TR/rdf11-concepts/)
- [RDF 1.2 Primer (Draft Note)](https://w3c.github.io/rdf-primer/spec/)
- [OWL 2 Web Ontology Language](https://www.w3.org/TR/owl2-overview/)
