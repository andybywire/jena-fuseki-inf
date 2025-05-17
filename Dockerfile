# Use a Java base image
FROM eclipse-temurin:17-jdk

# Define environment variables
ENV FUSEKI_VERSION=5.1.0
ENV FUSEKI_HOME=/opt/fuseki
ENV FUSEKI_BASE=/opt/fuseki

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Create Fuseki home directory
RUN mkdir -p $FUSEKI_HOME

# Download and extract Fuseki
WORKDIR /tmp
RUN wget -q --show-progress https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    tar -xzf apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    cp -r apache-jena-fuseki-$FUSEKI_VERSION/* $FUSEKI_HOME/ && \
    rm -rf apache-jena-fuseki-$FUSEKI_VERSION* && \
    chmod +x $FUSEKI_HOME/fuseki-server

# Create a non-root user with a specific UID
RUN useradd -u 1001 -m -s /bin/bash fuseki

# Create database directory and set permissions
RUN mkdir -p $FUSEKI_HOME/databases/uxm && \
    chown -R fuseki:fuseki $FUSEKI_HOME

# Copy config files
COPY shiro.ini $FUSEKI_HOME/shiro.ini
COPY config.ttl $FUSEKI_HOME/config.ttl
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && \
    chmod 644 $FUSEKI_HOME/shiro.ini && \
    chown fuseki:fuseki $FUSEKI_HOME/shiro.ini

# Expose HTTP port
EXPOSE 3030

# Switch to non-root user
USER fuseki

# Set default command
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/fuseki/fuseki-server", "--config=/opt/fuseki/config.ttl"]