# Use the latest version of Ubuntu Jammy as the base image
FROM ubuntu:jammy

# Install dependencies and packages required to install and run Hashicorp Vault
RUN apt-get update && \
    apt-get install -y wget gpg lsb-release && \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y vault

COPY vault-config.hcl /etc

RUN mkdir -p /data/vault

# Expose the necessary ports for Vault to run
EXPOSE 8200

# Start the Vault server when the container is run
CMD [ "vault", "server", "-config=/etc/vault-config.hcl" ]