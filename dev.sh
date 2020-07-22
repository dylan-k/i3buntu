#!/bin/sh

# Optional apps [Development]

apt install -y docker
apt install -y postgres
apt install -y redis
apt install -y redis-tools
apt install -y ansible
apt install -y yarn
apt install -y npm 

cd apps 
wget https://networkgenomics.com/try/mitogen-0.2.9.tar.gz
tar -xvf mitogen-0.2.9.tar.gz
