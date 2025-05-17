# Use a Java base image
FROM eclipse-temurin:17-jdk

# Define environment variables
ENV FUSEKI_VERSION=5.1.0
ENV FUSEKI_HOME=/opt/fuseki

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Create Fuseki home directory
RUN mkdir -p $FUSEKI_HOME

# Download and extract Fuseki
WORKDIR /tmp
RUN wget -q --show-progress https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    echo "Verifying download..." && \
    tar -xzf apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    echo "Moving files to $FUSEKI_HOME..." && \
    cp -r apache-jena-fuseki-$FUSEKI_VERSION/* $FUSEKI_HOME/ && \
    rm -rf apache-jena-fuseki-$FUSEKI_VERSION* && \
    echo "Setting permissions..." && \
    chmod +x $FUSEKI_HOME/fuseki-server && \
    echo "Verifying installation..." && \
    ls -la $FUSEKI_HOME

# Copy config file
COPY shiro.ini $FUSEKI_HOME/shiro.ini
COPY config.ttl $FUSEKI_HOME/config.ttl

# Create database directory
RUN mkdir -p $FUSEKI_HOME/databases/uxm

# Expose HTTP port
EXPOSE 3030

# Set default command
CMD ["/opt/fuseki/fuseki-server", "--config=/opt/fuseki/config.ttl"]