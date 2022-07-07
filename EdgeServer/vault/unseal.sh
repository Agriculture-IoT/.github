#!/bin/bash
vaultip=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' vault`
export VAULT_ADDR=http://${vaultip}:8200
vault operator unseal bOMX5U36ERUbYztSh+f4vH8viL7Wrhyv/ohlaegwZfxs
vault operator unseal JZrp6U4RtxVhluVELufb8jphAXfgaH2G4jpY+ZQhvv5P
vault operator unseal 3rugK8yq1CsXMM5JFENfUxhU/VC4id3jQ0+OdHgaG5Su
