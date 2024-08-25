# Use Debian 12 as the base image
FROM debian:12-slim

# Install Java 21, curl, and jq
RUN apt update && \
    apt install -y wget apt-transport-https gpg curl jq && \
    wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt update && \
    apt install -y temurin-21-jdk

# Copy in the Velocity install script
COPY ./velocity-*.sh /velocity/

# Set the working directory
WORKDIR /velocity

# Ensure the scripts have execute permissions
RUN chmod +x velocity-*.sh

# Download the Velocity proxy jar
RUN ./velocity-update.sh

EXPOSE 25565

# Start the Velocity proxy (copied in earlier)
CMD ["./velocity-start.sh"]