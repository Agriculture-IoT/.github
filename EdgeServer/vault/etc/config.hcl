ui = true

listener "tcp" {
  address     = "[::]:8200"
  tls_disable = 1
}

storage "file" {
  path = "/edgeserver/vault/data/"
}
