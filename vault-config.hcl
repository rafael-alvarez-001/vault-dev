# Vault configuration file

# APIs enabled by default
api_addr = "http://127.0.0.1:8200"
listener "tcp" {
 address = "127.0.0.1:8200"
 tls_disable = 1
}

# Enable secrets engine
path "secret/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Authentication methods
auth "token" {
    description = "Token based authentication"
    options {
        token_policies = ["default"]
    }
}

auth "userpass" {
    description = "Username and Password authentication"
}

# Persistence storage backend
storage "file" {
  path = "/data/vault/file"
}

# High-Availability
# The following example is for one instance - this section should be replaced if HA is required
ui = true
disable_mlock = true

# Telemetry
telemetry {
    statsite_address = "localhost:8125"
    disable_hostname = true
}