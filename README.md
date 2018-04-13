# vivo_mn_ip4

Installs a vivo masternode using an ip4.

Copy the line below into notepad and after modyfying it, run the entire line as root.
As root, you can run the following command in one line but replace the xxx s with your private key.

apt install -y git;cd;echo 'masternodeprivkey=xxxxxxxxxxxxxxxxxxxxxxxxxxxx'>finalPrivateKey1.txt ;git clone https://github.com/coolblock/vivoMnIp4.git;cd vivoMnIp4/;./firstscreen.sh

The vps script will run for 15 minutes and disconnect your ssh session. Putty will show a disconnect error. That means the machine is rebooting. You can restart another session if you want to check the vps.

# Set up Cold Wallet and start masternode after VPS has rebooted

Meanwhile set up your cold wallet, the masternode.conf file on your windows machine (if that is where your cold wallet is at).

After the server has rebooted, you will need to start the alias on the cold wallet.


# Looking at the VPS information

The conf file is located at:
/etc/masternodes/vivo_n1.conf

Executables like vivod are in:
/usr/local/bin

Data directory is in:
/var/lib/masternodes/vivo1

To do an individual run of sentinel:
/root/runsentinelnolog1.sh

To do a getinfo:
/usr/local/bin/vivo-cli -conf=/etc/masternodes/vivo_n1.conf getinfo

