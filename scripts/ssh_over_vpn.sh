#!/bin/bash
set -e

touch /work/signed-cert-user.pub

if [ ! -z "$USE_VPN" ]
then
	sudo openvpn --config /work/vpn/vpn.ovpn --daemon --log /var/log/openvpn.log
	echo ">> openvpn started, wait a bit"
	sleep 10
	sudo tail /var/log/openvpn.log
	route
fi

if [ ! -z "$USE_VAULT" ]
then
	source /work/.private/vault

	sudo touch /work/.vault-token
	sudo chmod 777 /work/.vault-token

	echo ">> Vault login started"
	vault login -method=userpass username=$VAULT_USERNAME password=$VAULT_PASSWORD
	echo ">> Vault key-signing started"
	vault write -field=signed_key ssh-client-signer/sign/$VAULT_FOLDER public_key=@/work/.ssh/id_rsa.pub > /work/signed-cert-user.pub

	echo ">> SSH started"
	ssh -i /work/signed-cert-user.pub -i /work/.ssh/id_rsa -o "StrictHostKeyChecking=no" -o 'ConnectionAttempts 20' -o 'ConnectTimeout=10' -v $SSH_HOST
else
	if [ ! -z "$USE_WG" ]
	then
		sudo kill -9 $(pgrep -f openvpn)
	fi
	echo ">> SSH started"
	ssh -o "StrictHostKeyChecking=no" -o 'ConnectionAttempts 20' -o 'ConnectTimeout=10' -v $SSH_HOST

fi
