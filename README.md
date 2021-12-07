# Bitcoin Node
Script to sync a bitcoin node
---
Requirements: Computer that can have a public IP address with ~150% of the current blockchain size in storage. At time of push it's 420GB. Also allow incoming connections on port 8332.
---
Optional Mounting: (If you don't have sufficient storage on root drive)
```bash
sudo parted -s -a optimal /dev/nvme1n1 mklabel gpt -- mkpart primary ext4 0% 100%
sudo mkfs.ext4 /dev/nvme1n1p1
sudo mount /dev/nvme1n1p1 /mnt
```
---
Download and Sync Node:
```bash
git clone https://github.com/anthony-albertina/bitcoin-node.git
cd bitcoin-node
sudo chmod +x setup.sh
./setup.sh &
```
---
Maintenance
```bash
# Start the Process
sudo bitcoind -daemon -blocksdir=/mnt/ -conf=/mnt/bitcoin.conf

# Stop the Process
sudo /mnt/bitcoin-0.21.1/bin/bitcoin-cli -rpcuser=[RPCUSER] -rpcpassword=[RPCPASSWORD] stop

# Get Block Count
sudo /mnt/bitcoin-0.21.1/bin/bitcoin-cli -rpcuser=[RPCUSER] -rpcpassword=[RPCPASSWORD] getblockcount
```
[Other RPC Commands](https://developer.bitcoin.org/reference/rpc/)