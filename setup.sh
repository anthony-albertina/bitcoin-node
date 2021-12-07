#!/bin/bash

# Make folder if not already there from mount
if [ ! -d /mnt ]; then
  mkdir /mnt
fi

# Download bitcoin core
cd /mnt
sudo wget https://bitcoin.org/bin/bitcoin-core-0.21.1/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz
sudo tar xvf bitcoin-0.21.1-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin bitcoin-0.21.1/bin/*
sudo chmod -R 777 /mnt

# Prompt user for desired rpcuser and rpcpassword
echo "Choose a username: "
read rpcuser
echo "Choose a password: "
read rpcpassword

# Create config file
sudo cat << EOF > /mnt/bitcoin.conf
daemon=1
datadir=/mnt
rpcbind=0.0.0.0
rpcport=8332
rpcallowip=0.0.0.0/0
rpcuser=
rpcpassword=
rpcconnect=0.0.0.0
EOF

# Set user inputted vars
sed -i "s/rpcuser=/rpcuser=$rpcuser/g" /mnt/bitcoin.conf
sed  -i "s/rpcpassword=/rpcpassword=$rpcpassword/g" /mnt/bitcoin.conf

# Start the Daemonized Process
sudo bitcoind -daemon -blocksdir=/mnt/ -conf=/mnt/bitcoin.conf &
