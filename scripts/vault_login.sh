#!/bin/bash
set -e
source ~/.private/vault

echo ">> Vault login started"
vault login -method=userpass username=$VAULT_USERNAME password=$VAULT_PASSWORD
echo ">> Vault key-signing started"
vault write -field=signed_key ssh-client-signer/sign/$VAULT_FOLDER public_key=@$HOME/.ssh/id_rsa.pub > ~/.ssh/signed-cert-user.pub

