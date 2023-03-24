# Vault configuration file

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = true
}

# Persistence storage backend
storage "raft" {
  path = "/data/vault/file"
  node_id = "storage1"
}

ui = true
disable_mlock = true
api_addr = "http://0.0.0.0:8200"
cluster_addr = "http://0.0.0.0:8201"
