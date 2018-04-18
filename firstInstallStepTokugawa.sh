#!/usr/bin/env bash
set -x
trap read debug
cd
git clone https://github.com/coolblock/vpsVIVO.git
cd vpsVIVO/
#git checkout v1.0 
chmod +x install.sh
./install.sh -p tokugawa -n 4
/usr/local/bin/activate_masternodes_tokugawa
cd /home/masternode
chown -R masternode:masternode /home/masternode/
apt -y install fail2ban
systemctl enable fail2ban
systemctl start fail2ban
sudo apt -y install rkhunter
chmod 755 /
chmod 755 /bin
chmod 755 /lib
touch /root/installCompleted
reboot
