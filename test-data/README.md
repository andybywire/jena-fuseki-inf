# Sample RDF Data & Queries
A simple RDF dataset and a set of queries to test for inference resolution at the SPARQL endpoint. When reasoning is active, queries will return "mammal" and "animal" in addition to "dog"/"cat."

## curl
```bash
curl -X POST \
-H "Content-Type: application/sparql-query" \
-H "Accept: application/sparql-results+json" \
--data-binary @./test-data/<filename>.rq \
http://localhost:3030/ds-owl/sparql
```