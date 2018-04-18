# vivo_mn_ip4

Installs a vivo masternode using an ip4. It will build the masternode from source. It will run as a service and will be restarted if the vps is restarted.

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

# Troubleshooting

99 percent of the time, a problem is because of invalid private key or a mistake on the the cold wallet (the controlling wallet).

To see if the deamon is running
service vivo_n1 status

Or you can look at top and see if vivod exists in the list

To start the deamon
service vivo_n1 start

If it does not start, to trouble shoot the "starting"

/sbin/runuser -l masternode -c '/usr/local/bin/vivod -daemon -pid=/var/lib/masternodes/vivo1/alqo.pid -conf=/etc/masternodes/vivo_n1.conf -datadir=/var/lib/masternodes/vivo1'

Look at the output

If you have made a mistake with your privatekey, 
nano conf=/etc/masternodes/vivo_n1.conf
Go the the bottom and fix it
control x to save
and then type in
reboot
That will restart everything.
